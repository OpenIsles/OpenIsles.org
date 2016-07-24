package org.openisles.website.web.controller;

import org.openisles.website.web.interceptor.Nav;
import org.openisles.website.web.interceptor.NavsActive;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class StaticPagesController {

    @GetMapping("/")
    @NavsActive(Nav.HOME)
    public String home() {
        return "home";
    }

    @GetMapping("/faq.html")
    @NavsActive(Nav.FAQ)
    public String faq() {
        return "faq";
    }

    @GetMapping("/game-infos/buildings.html")
    @NavsActive({ Nav.GAMEINFOS, Nav.GAMEINFOS_BUILDINGS })
    public String gameInfosBuildings() {
        return "game-infos/buildings";
    }

    @GetMapping("/game-infos/inhabitants.html")
    @NavsActive({ Nav.GAMEINFOS, Nav.GAMEINFOS_INHABITANTS })
    public String gameInfosInhabitants() {
        return "game-infos/inhabitants";
    }

    @GetMapping("/game-infos/ships.html")
    @NavsActive({ Nav.GAMEINFOS, Nav.GAMEINFOS_SHIPS })
    public String gameInfosShips() {
        return "game-infos/ships";
    }

    @GetMapping("/contact.html")
    @NavsActive(Nav.CONTACT)
    public String contact() {
        return "contact";
    }

    @GetMapping("/privacy.html")
    @NavsActive(Nav.PRIVACY)
    public String privacy() {
        return "privacy";
    }

}
