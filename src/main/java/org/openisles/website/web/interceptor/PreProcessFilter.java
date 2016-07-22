package org.openisles.website.web.interceptor;

import org.openisles.website.config.LanguageMap;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.*;

@WebFilter(urlPatterns = "/*")
public class PreProcessFilter implements Filter {

    public static final String ATTRIBUTE_NAME_REQUEST_INFO = PreProcessFilter.class.getName() + ".requestInfo";

    private static final String HOST_PRODUCTION = "openisles.org";

    private Map<String, String> languageMap;
    private Set<String> knownSearchCrawlers;

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // Sprachen
        languageMap = LanguageMap.getInstance();

        // Suchmaschinen
        knownSearchCrawlers = Collections.unmodifiableSet(new HashSet<>(Arrays.asList(
                "Googlebot",                 // Google
                "Mediapartners-Google",
                "AdsBot-Google",
                "Yahoo! Slurp",              // Yahoo
                "ia_archiver",               // Alexa
                "msnbot",                    // Bing/MSN
                "bingbot",
                "Baiduspider"                // Baidu
        )));
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response,
                         FilterChain chain) throws IOException, ServletException {

        if (request instanceof HttpServletRequest) {
            HttpServletRequest httpServletRequest = (HttpServletRequest) request;

            RequestInfo requestInfo = createRequestInfo(httpServletRequest);
            request.setAttribute(ATTRIBUTE_NAME_REQUEST_INFO, requestInfo);
        }

        chain.doFilter(request, response);
    }

    private RequestInfo createRequestInfo(HttpServletRequest request) {
        String requestedHost = request.getServerName();
        String baseHost = getBaseHost(requestedHost);

        boolean isLocalDevelopment = !(requestedHost.endsWith(HOST_PRODUCTION));
        boolean isStaticSubdomain = (requestedHost.equals("static." + baseHost));

        String siteLanguage = null;
        if (!isStaticSubdomain) {
            for (String lang : languageMap.keySet()) {
                if (requestedHost.equals(lang + "." + baseHost)) {
                    siteLanguage = lang;
                    break;
                }
            }
        }

        RequestInfo requestInfo = new RequestInfo();
        requestInfo.setSearchCrawler(isSearchCrawler(request));
        requestInfo.setLocalDevelopment(isLocalDevelopment);
        requestInfo.setBaseHost(baseHost);
        requestInfo.setSiteLanguage(siteLanguage);
        requestInfo.setStaticSubdomain(isStaticSubdomain);
        return requestInfo;
    }

    private String getBaseHost(String requestedHost) {
        int c = requestedHost.indexOf("openisles.org");

        // openisles.org muss im Host vorkommen, um den Base-Host ermitteln zu können
        if (c == -1) {
            throw new RuntimeException("Illegal host " + requestedHost);
        }

        // Base-Host = ab "openisles.org"
        return requestedHost.substring(c);
    }

    private boolean isSearchCrawler(HttpServletRequest request) {
        String userAgent = request.getHeader("User-Agent");

        for (String knownSearchCrawler : knownSearchCrawlers) {
            if (userAgent.contains(knownSearchCrawler)) {
                return true;
            }
        }

        return false;
    }

    @Override
    public void destroy() {
        // nix tun
    }


    public static class RequestInfo {

        private boolean searchCrawler;
        private boolean localDevelopment;
        private String baseHost; // "openisles.org" bzw. "openisles.org.localhost"
        private String siteLanguage; // "de", "en" etc. null wenn staticSubdomain oder unbekannt
        private boolean staticSubdomain;

        public boolean isSearchCrawler() {
            return searchCrawler;
        }

        private void setSearchCrawler(boolean searchCrawler) {
            this.searchCrawler = searchCrawler;
        }

        public boolean isLocalDevelopment() {
            return localDevelopment;
        }

        private void setLocalDevelopment(boolean localDevelopment) {
            this.localDevelopment = localDevelopment;
        }

        public String getBaseHost() {
            return baseHost;
        }

        private void setBaseHost(String baseHost) {
            this.baseHost = baseHost;
        }

        public String getSiteLanguage() {
            return siteLanguage;
        }

        private void setSiteLanguage(String siteLanguage) {
            this.siteLanguage = siteLanguage;
        }

        public boolean isStaticSubdomain() {
            return staticSubdomain;
        }

        private void setStaticSubdomain(boolean staticSubdomain) {
            this.staticSubdomain = staticSubdomain;
        }
    }

}
