package org.openisles.website.web.support;

import org.springframework.context.support.MessageSourceAccessor;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.LinkedList;
import java.util.List;

public class Breadcrumb extends LinkedList<Breadcrumb.Bit> {

    public static final String ATTRIBUTE_NAME = Breadcrumb.class.getName();

    private Breadcrumb(List<Bit> bits) {
        addAll(bits);
    }


    /**
     * Builder für die Breadcrumb, sodass Controller diese mit einem Einzeiler setten können
     */
    public static class Builder {

        private MessageSourceAccessor messageSourceAccessor;

        private LinkedList<Bit> bits = new LinkedList<>();


        public Builder(MessageSourceAccessor messageSourceAccessor) {
            this.messageSourceAccessor = messageSourceAccessor;
        }

        public Builder nonClickableUrl(String url, String title) {
            bits.add(new Bit(url, title, false));
            return this;
        }

        public Builder nonClickableUrl(String url) {
            return nonClickableUrl(url, getTitleForUrlFromMessageSource(url));
        }

        public Builder clickableUrl(String url, String title) {
            bits.add(new Bit(url, title, true));
            return this;
        }

        public Builder clickableUrl(String url) {
            return clickableUrl(url, getTitleForUrlFromMessageSource(url));
        }

        public void activeUrl(String url, String title) {
            bits.add(new Bit(url, title, false));

            // An Request anheften
            HttpServletRequest request =
                    ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
            request.setAttribute(ATTRIBUTE_NAME, new Breadcrumb(bits));
        }

        public void activeUrl(String url) {
            activeUrl(url, getTitleForUrlFromMessageSource(url));
        }

        /**
         * Liefert den Text für ein Bit, wenn nur die URL bekannt ist. In diesem Fall schlagen wir in der
         * messages.properties nach.
         *
         * @param url URL
         * @return lokalisierter Text
         */
        private String getTitleForUrlFromMessageSource(String url) {
            return messageSourceAccessor.getMessage("nav." + url);
        }
    }

    /**
     * Ein Stück in der Breadcrumb
     */
    public static class Bit {

        /** URL */
        private String url;

        /** angezeigter Text */
        private String title;

        /** ist der Link klickbar? */
        private boolean clickable;

        public Bit(String url, String title, boolean clickable) {
            this.url = url;
            this.title = title;
            this.clickable = clickable;
        }

        public String getUrl() {
            return url;
        }

        public String getTitle() {
            return title;
        }

        public boolean isClickable() {
            return clickable;
        }
    }

}
