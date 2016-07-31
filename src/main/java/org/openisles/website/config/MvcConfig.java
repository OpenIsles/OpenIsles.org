package org.openisles.website.config;

import freemarker.core.XHTMLOutputFormat;
import org.openisles.website.web.freemarker.I18nTemplateMethod;
import org.openisles.website.web.freemarker.TranslateDirective;
import org.openisles.website.web.interceptor.GlobalViewInterceptor;
import org.openisles.website.web.interceptor.PreProcessFilter;
import org.openisles.website.web.interceptor.SubdomainLocaleResolver;
import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.support.MessageSourceAccessor;
import org.springframework.context.support.ResourceBundleMessageSource;
import org.springframework.core.io.ClassPathResource;
import org.springframework.ui.freemarker.SpringTemplateLoader;
import org.springframework.web.servlet.HandlerMapping;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurationSupport;
import org.springframework.web.servlet.handler.SimpleUrlHandlerMapping;
import org.springframework.web.servlet.resource.ResourceHttpRequestHandler;
import org.springframework.web.servlet.view.freemarker.FreeMarkerConfigurer;
import org.springframework.web.servlet.view.freemarker.FreeMarkerViewResolver;

import javax.servlet.http.HttpServletRequest;
import java.util.Collections;
import java.util.Locale;
import java.util.Map;

import static org.openisles.website.config.Consts.DEFAULT_LANGUAGE;

/**
 * MVC-Konfiguration
 */
@ComponentScan(basePackages = "org.openisles.website.web.controller")
@Configuration
public class MvcConfig extends WebMvcConfigurationSupport {

    // Locale-Resolving und MessageSource //////////////////////////////////////////////////////////////////////////////

    @Bean
    public LocaleResolver localeResolver() {
        return new SubdomainLocaleResolver();
    }

    @Bean
    public MessageSource messageSource() {
        ResourceBundleMessageSource messageSource = new ResourceBundleMessageSource();
        messageSource.setBasename("i18n/messages");
        messageSource.setDefaultEncoding("UTF-8");
        return messageSource;
    }

    @Bean
    public MessageSourceAccessor messageSourceAccessor() {
        return new MessageSourceAccessor(messageSource(), new Locale(DEFAULT_LANGUAGE));
    }

    // View-Resolving und FreeMarker-Konfiguration /////////////////////////////////////////////////////////////////////

    @Bean
    public FreeMarkerViewResolver viewResolver() {
        FreeMarkerViewResolver freeMarkerViewResolver = new FreeMarkerViewResolver();
        freeMarkerViewResolver.setCache(false); // TODO nur lokal aus
        freeMarkerViewResolver.setSuffix(".ftl");
        return freeMarkerViewResolver;
    }

    @Bean
    public FreeMarkerConfigurer freeMarkerConfigurer(ApplicationContext applicationContext) {
        freemarker.template.Configuration freeMarkerConfiguration =
                new freemarker.template.Configuration(freemarker.template.Configuration.VERSION_2_3_24);
        freeMarkerConfiguration.addAutoImport("layout", "auto-import/layout.ftl");
        freeMarkerConfiguration.setSharedVariable("translate", new TranslateDirective());
        freeMarkerConfiguration.setSharedVariable("i18n", new I18nTemplateMethod(messageSourceAccessor()));
        freeMarkerConfiguration.setOutputFormat(XHTMLOutputFormat.INSTANCE);
        freeMarkerConfiguration.setTemplateLoader(new SpringTemplateLoader(applicationContext, "classpath:/templates"));

        FreeMarkerConfigurer freeMarkerConfigurer = new FreeMarkerConfigurer();
        freeMarkerConfigurer.setConfiguration(freeMarkerConfiguration);
        return freeMarkerConfigurer;
    }

    // Auslieferung statischer Resourcen ///////////////////////////////////////////////////////////////////////////////

    @Bean
    public ResourceHttpRequestHandler resourceHandler() {
        ResourceHttpRequestHandler requestHandler = new ResourceHttpRequestHandler();
        requestHandler.setLocations(Collections.singletonList(new ClassPathResource("/public")));
        return requestHandler;
    }

    @Override
    @Bean
    public HandlerMapping resourceHandlerMapping() {
        return new SimpleUrlHandlerMapping() {

            @Override
            protected void registerHandlers(Map<String, Object> urlMap) throws BeansException {
                // Die Basismethode würde eine Warnung ins Log schreiben, weil urlMap leer ist.
                // Aber alles gut, wir brauchen keine urlMap :-) Also nix tun.
            }

            @Override
            protected Object lookupHandler(String urlPath, HttpServletRequest request) throws Exception {
                PreProcessFilter.RequestInfo requestInfo =
                        (PreProcessFilter.RequestInfo)
                                request.getAttribute(PreProcessFilter.ATTRIBUTE_NAME_REQUEST_INFO);

                // Nicht die static-Subdomain? Dann sind wir nicht zuständig
                if (!requestInfo.isStaticSubdomain()) {
                    return null;
                }

                String lookupPath = getUrlPathHelper().getLookupPathForRequest(request);
                return buildPathExposingHandler(resourceHandler(), lookupPath, "public" + lookupPath, null);
            }
        };
    }

    // globaler Interceptor ////////////////////////////////////////////////////////////////////////////////////////////

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        super.addInterceptors(registry);

        registry.addInterceptor(new GlobalViewInterceptor());
    }

}
