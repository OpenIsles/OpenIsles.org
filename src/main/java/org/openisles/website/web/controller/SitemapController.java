package org.openisles.website.web.controller;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.openisles.website.domain.Screenshot;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

@Controller
@Transactional
public class SitemapController {

    private final SessionFactory sessionFactory;

    @Autowired
    public SitemapController(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @GetMapping(path = "/sitemap.xml")
    public String xmlSitemap(Model model, HttpServletResponse response) {
        Session session = sessionFactory.getCurrentSession();
        List<Screenshot> screenshots = session
                .createQuery("from Screenshot order by orderIndex desc", Screenshot.class)
                .list();

        model.addAttribute("screenshots", screenshots);
        response.setContentType("text/xml; charset=UTF-8");
        return "sitemap.xml";
    }

}
