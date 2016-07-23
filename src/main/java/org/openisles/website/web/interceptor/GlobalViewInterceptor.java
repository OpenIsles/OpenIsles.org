package org.openisles.website.web.interceptor;

import org.openisles.website.config.LanguageMap;
import org.openisles.website.exception.HttpNotFoundException;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

public class GlobalViewInterceptor extends HandlerInterceptorAdapter {

    private final Map<String, String> languageMap;
    private final long timeOfDeployment;

    public GlobalViewInterceptor() {
        this.languageMap = LanguageMap.getInstance();

        // Uhrzeit merken, wann es los ging
        this.timeOfDeployment = System.currentTimeMillis();
    }

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
                             Object handler) throws Exception {

        PreProcessFilter.RequestInfo requestInfo =
                (PreProcessFilter.RequestInfo) request.getAttribute(PreProcessFilter.ATTRIBUTE_NAME_REQUEST_INFO);

        // static-Subdomain darf nicht mit dem RequestMappingHandlerMapping aufgerufen werden!
        if (requestInfo.isStaticSubdomain()) {
            throw new HttpNotFoundException();
        }

        // Sprache da? Dann müssen wir nix tun
        if (requestInfo.getSiteLanguage() != null) {
            return true;
        }

        // Keine Sprache in der Subdomain? Dann müssen wir eine Sprache auswählen und weiterleiten

        // Accept-Language-Header checken, welche Sprache der Nutzer will
        String siteLanguage = null;
        Enumeration<Locale> localeEnumeration = request.getLocales();
        while (localeEnumeration.hasMoreElements()) {
            String localeLanguage = localeEnumeration.nextElement().getLanguage();
            if (languageMap.containsKey(localeLanguage)) {
                siteLanguage = localeLanguage;
                break;
            }
        }

        // Keine oder unbekannte Sprache? Dann Deutsch nehmen
        if (siteLanguage == null) {
            siteLanguage = "de";
        }

        // Weiterleiten
        String port = requestInfo.isLocalDevelopment() ? ":8080" : "";
        String newLocation = "http://" + siteLanguage + "." + requestInfo.getBaseHost() + port + request.getRequestURI();
        response.sendRedirect(newLocation);
        return false;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response,
                           Object handler, ModelAndView modelAndView) throws Exception {

        if (modelAndView == null) {
            return;
        }

        PreProcessFilter.RequestInfo requestInfo =
                (PreProcessFilter.RequestInfo) request.getAttribute(PreProcessFilter.ATTRIBUTE_NAME_REQUEST_INFO);
        String port = requestInfo.isLocalDevelopment() ? ":8080" : "";

        // aktuelles Jahr
        String year = DateTimeFormatter.ofPattern("yyyy").format(LocalDate.now());
        modelAndView.addObject("year", year);

        // Sprachen
        modelAndView.addObject("siteLanguage", requestInfo.getSiteLanguage());
        modelAndView.addObject("languageMap", languageMap);

        Map<String, String> alternateUrls = new HashMap<>(languageMap.size());
        for (String lang : languageMap.keySet()) {
            alternateUrls.put(lang, "http://" + lang + "." + requestInfo.getBaseHost() + port + request.getRequestURI());
        }
        modelAndView.addObject("alternateUrls", alternateUrls);

        modelAndView.addObject("isSearchCrawler", requestInfo.isSearchCrawler());
        modelAndView.addObject("isLocalDevelopment", requestInfo.isLocalDevelopment());
        modelAndView.addObject("baseHost", requestInfo.getBaseHost() + port);
        modelAndView.addObject("staticHostName", "static." + requestInfo.getBaseHost() + port);

        // Ausgewählter Navigationspunkt
        HashMap<String, Boolean> navsActive = new HashMap<>(2);
        if (handler instanceof HandlerMethod) {
            NavsActive annotation = ((HandlerMethod) handler).getMethodAnnotation(NavsActive.class);
            if (annotation != null) {
                for (Nav nav : annotation.value()) {
                    navsActive.put(nav.name(), true);
                }
            }
        }
        modelAndView.addObject("navsActive", navsActive);

        // Header
        if (response.getContentType() == null) {
            response.setContentType("text/html; charset=UTF-8");
        }
        response.setHeader("Content-Language", requestInfo.getSiteLanguage());

        if (response.getStatus() == HttpServletResponse.SC_OK) {
            if (response.getHeader("Last-Modified") == null) {
                response.setDateHeader("Last-Modified", timeOfDeployment);
            }
        }
    }
}
