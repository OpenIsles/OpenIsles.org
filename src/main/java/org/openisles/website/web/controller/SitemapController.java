package org.openisles.website.web.controller;

import org.openisles.website.data.Buildings;
import org.openisles.website.data.Screenshots;
import org.openisles.website.web.support.AbstractController;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpServletResponse;

@Controller
public class SitemapController extends AbstractController {

    @GetMapping(path = "/sitemap.xml")
    public String xmlSitemap(Model model, HttpServletResponse response) {
        model.addAttribute("screenshots", Screenshots.getScreenshots());
        model.addAttribute("buildings", Buildings.getBuildings());

        response.setContentType("text/xml; charset=UTF-8");
        return "sitemap.xml";
    }

}
