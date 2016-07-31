package org.openisles.website.domain;

import java.time.LocalDateTime;
import java.time.ZoneOffset;
import java.util.Date;

public class Screenshot {

    /**
     * URL-Teil und eindeutiges Identifikationsmerkmal.
     * Verwenden wir in der {@code messages.properties} für Titel und Beschreibung.
     */
    private String urlName;

    /**
     * Zeitpunkt, wann der Screenshot aufgenommen wurde
     */
    private LocalDateTime createdDateTime;


    public Screenshot(String urlName, LocalDateTime createdDateTime) {
        this.urlName = urlName;
        this.createdDateTime = createdDateTime;
    }

    public String getUrlName() {
        return urlName;
    }

    public LocalDateTime getCreatedDateTime() {
        return createdDateTime;
    }

    /**
     * @return {@link #createdDateTime} als {@link java.util.Date},
     *         weil FreeMarker die Java8-Zeittypen nicht verarbeiten kann.
     */
    public Date getCreatedDate() {
        return Date.from(createdDateTime.toInstant(ZoneOffset.UTC));
    }

    /**
     * @return Message-Key für den Titel
     */
    public String getTitleKey() {
        return "screenshot." + urlName + ".title";
    }

    /**
     * @return Message-Key für den Beschreibung
     */
    public String getDescriptionKey() {
        return "screenshot." + urlName + ".description";
    }
}
