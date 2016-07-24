package org.openisles.website.domain;

import org.hibernate.annotations.Immutable;

import javax.persistence.*;
import java.util.Map;

@Entity
@Immutable
@Table(name = "good")
public class Good extends Translatable {

    @Id
    @Column(name = "order_index", nullable = false)
    private int orderIndex;

    @Enumerated(EnumType.ORDINAL)
    @Column(name = "[group]", nullable = false)
    private Group group;

    @Column(name = "icon_name", nullable = false)
    private String iconName;

    @Column(name = "name_de", nullable = false)
    private String nameDe;

    @Column(name = "name_en", nullable = false)
    private String nameEn;


    public int getOrderIndex() {
        return orderIndex;
    }

    public Group getGroup() {
        return group;
    }

    public String getIconName() {
        return iconName;
    }

    public String getNameDe() {
        return nameDe;
    }

    public String getNameEn() {
        return nameEn;
    }

    @Transient
    public Map<String, String> getName() {
        return getLangValueMap("name");
    }


    public enum Group {
        RAW_MATERIAL,
        CONSUMER_GOOD,
        BUILDING_MATERIAL
    }

}
