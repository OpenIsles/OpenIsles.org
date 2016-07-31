package org.openisles.website.data;

import org.openisles.website.domain.Building;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Optional;

public final class Buildings {

    private static final List<Building> buildings;
    static {
        buildings = Collections.unmodifiableList(Arrays.asList(
                new Building(Building.Group.ROAD, "square1"),
                new Building(Building.Group.ROAD, "square2"),
                new Building(Building.Group.ROAD, "square3"),
                new Building(Building.Group.CRAFTSMAN, "weaving-mill1"),
                new Building(Building.Group.CRAFTSMAN, "butchers"),
                new Building(Building.Group.CRAFTSMAN, "stonemason"),
                new Building(Building.Group.CRAFTSMAN, "distillery"),
                new Building(Building.Group.CRAFTSMAN, "tobacco-goods"),
                new Building(Building.Group.CRAFTSMAN, "bakery"),
                new Building(Building.Group.CRAFTSMAN, "toolsmiths"),
                new Building(Building.Group.FARM, "hunters-hut"),
                new Building(Building.Group.FARM, "foresters"),
                new Building(Building.Group.FARM, "sheep-farm"),
                new Building(Building.Group.FARM, "cattle-farm"),
                new Building(Building.Group.FARM, "sugarcane-plantation"),
                new Building(Building.Group.FARM, "tobacco-plantation"),
                new Building(Building.Group.FARM, "spices-plantation"),
                new Building(Building.Group.FARM, "grain-farm"),
                new Building(Building.Group.PORT, "pier"),
                new Building(Building.Group.PORT, "office1"),
                new Building(Building.Group.PORT, "office2"),
                new Building(Building.Group.PUBLIC, "marketplace"),
                new Building(Building.Group.PUBLIC, "chapel"),
                new Building(Building.Group.PUBLIC, "tavern"),
                new Building(Building.Group.PUBLIC, "school"),
                new Building(Building.Group.PUBLIC, "church"),
                new Building(Building.Group.PUBLIC, "cathedral")
        ));
    }

    public static List<Building> getBuildings() {
        return buildings;
    }

    public static Optional<Building> getByName(String name) {
        return buildings.stream()
                .filter(building -> building.getName().equals(name))
                .findAny();
    }

}
