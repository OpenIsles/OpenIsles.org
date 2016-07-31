package org.openisles.website.web.interceptor;

import org.springframework.web.servlet.LocaleResolver;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Locale;

/**
 * <p>
 *     {@link LocaleResolver}, der die Sprache aus der Subdomain verwendet, die unser {@link PreProcessFilter} bereits
 *     vorbereitet hat.
 * </p>
 * <p>
 *     Ein Aufruf an {@link #setLocale(HttpServletRequest, HttpServletResponse, Locale)} ist nicht erlaubt, weil das
 *     Ändern des Locales programmatisch unmöglich ist. Nur der Nutzer kann durch eine andere URL die Sprache
 *     umschalten.
 * </p>
 */
public class SubdomainLocaleResolver implements LocaleResolver {

    @Override
    public Locale resolveLocale(HttpServletRequest request) {
        PreProcessFilter.RequestInfo requestInfo =
                (PreProcessFilter.RequestInfo) request.getAttribute(PreProcessFilter.ATTRIBUTE_NAME_REQUEST_INFO);

        return new Locale(requestInfo.getSiteLanguage());
    }

    @Override
    public void setLocale(HttpServletRequest request, HttpServletResponse response, Locale locale) {
        throw new UnsupportedOperationException("Not allowed");
    }
}
