package org.openisles.website.web.controller;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.openisles.website.domain.Video;
import org.openisles.website.web.interceptor.Nav;
import org.openisles.website.web.interceptor.NavsActive;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
@Transactional
public class VideosController {

    private final SessionFactory sessionFactory;

    @Autowired
    public VideosController(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @GetMapping("/media/videos.html")
    @NavsActive({ Nav.MEDIA, Nav.MEDIA_VIDEOS })
    public String videos(Model model) {
        Session session = sessionFactory.getCurrentSession();
        List<Video> videos = session
                .createQuery("from Video order by orderIndex desc", Video.class)
                .list();

        model.addAttribute("videos", videos);
        return "media/videos";
    }

}
