package org.openisles.website.domain;

import java.time.LocalDate;
import java.time.ZoneOffset;
import java.util.Date;

public class Video {

    /**
     * URL-Teil und eindeutiges Identifikationsmerkmal.
     * Verwenden wir in der {@code messages.properties} für die Beschreibung.
     */
    private String urlName;

    /**
     * Datum, wann das Video aufgenommen wurde
     */
    private LocalDate createdDate;


    public Video(String urlName, LocalDate createdDate) {
        this.urlName = urlName;
        this.createdDate = createdDate;
    }

    public String getUrlName() {
        return urlName;
    }

    /**
     * @return {@link #createdDate} als {@link java.util.Date},
     *         weil FreeMarker die Java8-Zeittypen nicht verarbeiten kann.
     */
    public Date getCreatedDate() {
        return Date.from(createdDate.atTime(0, 0).toInstant(ZoneOffset.UTC));
    }

    /**
     * @return Message-Key für den Beschreibung
     */
    public String getDescriptionKey() {
        return "video." + urlName + ".description";
    }
}
