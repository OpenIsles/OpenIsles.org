package org.openisles.website.web.controller;

import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

/**
 * Controller, der Seiten enthält, die es nicht mehr gibt
 */
@Controller
public class LegacyController {

    @GetMapping(path = {
            "/media.html",
            "/game-infos.html"
    })
    @ResponseStatus(HttpStatus.GONE)
    @ResponseBody
    public String gone() {
        return "HTTP 410 Gone";
    }

}
