package org.openisles.website.web.controller;

import org.openisles.website.data.Screenshots;
import org.openisles.website.domain.Screenshot;
import org.openisles.website.exception.HttpNotFoundException;
import org.openisles.website.web.interceptor.Nav;
import org.openisles.website.web.interceptor.NavsActive;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.List;

@Controller
public class ScreenshotsController {

    @GetMapping("/media/screenshots.html")
    @NavsActive({ Nav.MEDIA, Nav.MEDIA_SCREENSHOTS })
    public String screenshots(Model model) {
        List<Screenshot> screenshots = Screenshots.getScreenshots();

        model.addAttribute("screenshots", screenshots);
        return "media/screenshots";
    }

    @GetMapping("/media/screenshots/{urlName}.html")
    @NavsActive({ Nav.MEDIA, Nav.MEDIA_SCREENSHOTS })
    public String screenshot(Model model, @PathVariable String urlName) {
        Screenshot screenshot = Screenshots.getByUrlName(urlName)
                .orElseThrow(HttpNotFoundException::new);

        Screenshot prevScreenshot = Screenshots.getPrevScreenshot(screenshot);
        Screenshot nextScreenshot = Screenshots.getNextScreenshot(screenshot);

        model.addAttribute("screenshot", screenshot);
        model.addAttribute("nextScreenshot", nextScreenshot);
        model.addAttribute("prevScreenshot", prevScreenshot);
        return "media/screenshot";
    }

}
