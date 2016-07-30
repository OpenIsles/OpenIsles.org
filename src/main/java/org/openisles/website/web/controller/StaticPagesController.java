package org.openisles.website.web.controller;

import org.openisles.website.web.interceptor.Nav;
import org.openisles.website.web.interceptor.NavsActive;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class StaticPagesController {

    @GetMapping("/")
    @NavsActive(Nav.HOME)
    public String home() {
        return "home";
    }

    @GetMapping(path = "/robots.txt", produces = "text/plain; charset=UTF-8")
    @ResponseBody
    public String robotsTxt() {
        return ""; // leere Textdatei simulieren
    }

    @GetMapping("/faq.html")
    @NavsActive(Nav.FAQ)
    public String faq() {
        return "faq";
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
