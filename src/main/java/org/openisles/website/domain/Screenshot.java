package org.openisles.website.domain;

import org.hibernate.annotations.Immutable;

import javax.persistence.*;
import java.util.Date;
import java.util.Map;

@Entity
@Immutable
@Table(name = "screenshot")
public class Screenshot extends Translatable {

    @Column(name = "order_index", nullable = false)
    private int orderIndex;

    @Id
    @Column(name = "url_name", nullable = false)
    private String urlName;

    @Column(name = "title_de", nullable = false)
    private String titleDe;

    @Column(name = "description_de", nullable = false)
    private String descriptionDe;

    @Column(name = "title_en", nullable = false)
    private String titleEn;

    @Column(name = "description_en", nullable = false)
    private String descriptionEn;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "created_date", nullable = false)
    private Date createdDate;


    public int getOrderIndex() {
        return orderIndex;
    }

    public String getUrlName() {
        return urlName;
    }

    public String getTitleDe() {
        return titleDe;
    }

    public String getDescriptionDe() {
        return descriptionDe;
    }

    public String getTitleEn() {
        return titleEn;
    }

    public String getDescriptionEn() {
        return descriptionEn;
    }

    public Date getCreatedDate() {
        return createdDate;
    }

    @Transient
    public Map<String, String> getTitle() {
        return getLangValueMap("title");
    }

    @Transient
    public Map<String, String> getDescription() {
        return getLangValueMap("description");
    }
}
