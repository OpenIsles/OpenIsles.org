package org.openisles.website.domain;

public class Good {

    /**
     * Gruppe
     */
    private Group group;

    /**
     * Name (wird für Symbol und Message-Key verwendet)
     */
    private String name;


    public Good(Group group, String name) {
        this.group = group;
        this.name = name;
    }

    public Group getGroup() {
        return group;
    }

    public String getName() {
        return name;
    }

    /**
     * @return Message-Key für den Titel
     */
    public String getTitleKey() {
        return "good." + name;
    }


    public enum Group {
        RAW_MATERIAL,
        CONSUMER_GOOD,
        BUILDING_MATERIAL;

        /**
         * @return Message-Key für den Titel
         */
        public String getTitleKey() {
            return "good.group." + name();
        }
    }

}
