package org.openisles.website.domain;

import org.hibernate.annotations.Immutable;

import javax.persistence.*;
import java.util.Date;
import java.util.Map;

@Entity
@Immutable
@Table(name = "video")
public class Video extends Translatable {

    @Column(name = "order_index", nullable = false)
    private int orderIndex;

    @Id
    @Column(name = "file_prefix", nullable = false)
    private String filePrefix;

    @Column(name = "description_de", nullable = false)
    private String descriptionDe;

    @Column(name = "description_en", nullable = false)
    private String descriptionEn;

    @Temporal(TemporalType.DATE)
    @Column(name = "created_date", nullable = false)
    private Date createdDate;


    public int getOrderIndex() {
        return orderIndex;
    }

    public String getFilePrefix() {
        return filePrefix;
    }

    public String getDescriptionDe() {
        return descriptionDe;
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
