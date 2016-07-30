package org.openisles.website.domain;

import org.hibernate.annotations.Immutable;

import javax.persistence.*;
import java.util.Map;

@Entity
@Immutable
@Table(name = "building")
public class Building extends Translatable {

    @Id
    @Column(name = "order_index", nullable = false)
    private int orderIndex;

    @Column(name = "name", nullable = false)
    private String name;

    @Enumerated(EnumType.ORDINAL)
    @Column(name = "[group]", nullable = false)
    private Group group;

    @Column(name = "title_de", nullable = false)
    private String titleDe;

    @Column(name = "title_en", nullable = false)
    private String titleEn;


    public int getOrderIndex() {
        return orderIndex;
    }

    public String getName() {
        return name;
    }

    public Group getGroup() {
        return group;
    }

    public String getTitleDe() {
        return titleDe;
    }

    public String getTitleEn() {
        return titleEn;
    }

    @Transient
    public Map<String, String> getTitle() {
        return getLangValueMap("title");
    }


    public enum Group {
        ROAD, // Straßen und Brücken
        CRAFTSMAN, // Handwerksbetriebe
        FARM, // Farmen & Plantagen
        PORT, // Hafenanlagen
        PUBLIC // Öffentliche Gebäude
    }

}
