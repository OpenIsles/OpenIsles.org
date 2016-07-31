package org.openisles.website.web.controller;

import org.openisles.website.web.support.AbstractController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class StaticPagesController extends AbstractController {

    @GetMapping("/")
    public String home() {
        setBreadcrumb()
                .activeUrl("/");

        return "home";
    }

    @GetMapping(path = "/robots.txt", produces = "text/plain; charset=UTF-8")
    @ResponseBody
    public String robotsTxt() {
        return ""; // leere Textdatei simulieren
    }

    @GetMapping("/faq.html")
    public String faq() {
        setBreadcrumb()
                .activeUrl("/faq.html");

        return "faq";
    }

    @GetMapping("/game-infos/inhabitants.html")
    public String gameInfosInhabitants() {
        setBreadcrumb()
                .nonClickableUrl("/game-infos.html")
                .activeUrl("/game-infos/inhabitants.html");

        return "game-infos/inhabitants";
    }

    @GetMapping("/game-infos/ships.html")
    public String gameInfosShips() {
        setBreadcrumb()
                .nonClickableUrl("/game-infos.html")
                .activeUrl("/game-infos/ships.html");

        return "game-infos/ships";
    }

    @GetMapping("/contact.html")
    public String contact() {
        setBreadcrumb()
                .activeUrl("/contact.html");

        return "contact";
    }

    @GetMapping("/privacy.html")
    public String privacy() {
        setBreadcrumb()
                .activeUrl("/privacy.html");

        return "privacy";
    }

}
