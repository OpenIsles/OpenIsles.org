package org.openisles.website.web.controller.gameinfos;

import org.openisles.website.data.Buildings;
import org.openisles.website.domain.Building;
import org.openisles.website.exception.HttpNotFoundException;
import org.openisles.website.web.interceptor.Nav;
import org.openisles.website.web.interceptor.NavsActive;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.stream.Collectors;

@Controller
public class BuildingsController {

    @GetMapping("/game-infos/buildings.html")
    @NavsActive({ Nav.GAMEINFOS, Nav.GAMEINFOS_BUILDINGS })
    public String gameInfosBuildings(Model model) {
        List<BuildingGroupModel> buildingGroups = Buildings.getBuildings().stream()
                .collect(Collectors.groupingBy(Building::getGroup, LinkedHashMap::new, Collectors.toList()))
                .entrySet()
                .stream()
                    .map(entry -> new BuildingGroupModel(entry.getKey(), entry.getValue()))
                    .collect(Collectors.toList());

        model.addAttribute("buildingGroups", buildingGroups);
        return "game-infos/buildings";
    }

    @GetMapping("/game-infos/buildings/{buildingName}.html")
    @NavsActive({ Nav.GAMEINFOS, Nav.GAMEINFOS_BUILDINGS })
    public String building(Model model, @PathVariable String buildingName) {
        Building building = Buildings.getByName(buildingName)
                .orElseThrow(HttpNotFoundException::new);

        model.addAttribute("building", building);
        return "game-infos/building";
    }


    public static class BuildingGroupModel {
        private Building.Group group;
        private List<Building> buildings;

        BuildingGroupModel(Building.Group group, List<Building> buildings) {
            this.group = group;
            this.buildings = buildings;
        }

        public Building.Group getGroup() {
            return group;
        }

        public List<Building> getBuildings() {
            return buildings;
        }
    }

}
