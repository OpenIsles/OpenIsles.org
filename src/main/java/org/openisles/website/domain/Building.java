package org.openisles.website.domain;

public class Building {

    /**
     * Gruppe
     */
    private Group group;

    /**
     * Name (wird für Grafiken und Message-Key verwendet)
     */
    private String name;


    public Building(Group group, String name) {
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
        return "building." + name;
    }


    public enum Group {
        ROAD, // Straßen und Brücken
        CRAFTSMAN, // Handwerksbetriebe
        FARM, // Farmen & Plantagen
        PORT, // Hafenanlagen
        PUBLIC; // Öffentliche Gebäude

        /**
         * @return Message-Key für den Titel
         */
        public String getTitleKey() {
            return "building.group." + name();
        }
    }

}
