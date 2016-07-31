package org.openisles.website.web.controller;

import org.openisles.website.data.Videos;
import org.openisles.website.domain.Video;
import org.openisles.website.web.support.AbstractController;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class VideosController extends AbstractController {

    @GetMapping("/media/videos.html")
    public String videos(Model model) {
        setBreadcrumb()
                .nonClickableUrl("/media.html")
                .activeUrl("/media/videos.html");

        List<Video> videos = Videos.getVideos();

        model.addAttribute("videos", videos);
        return "media/videos";
    }

}
