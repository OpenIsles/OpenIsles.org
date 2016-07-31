package org.openisles.website.web.controller;

import org.openisles.website.data.Videos;
import org.openisles.website.domain.Video;
import org.openisles.website.web.interceptor.Nav;
import org.openisles.website.web.interceptor.NavsActive;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class VideosController {

    @GetMapping("/media/videos.html")
    @NavsActive({ Nav.MEDIA, Nav.MEDIA_VIDEOS })
    public String videos(Model model) {
        List<Video> videos = Videos.getVideos();

        model.addAttribute("videos", videos);
        return "media/videos";
    }

}
