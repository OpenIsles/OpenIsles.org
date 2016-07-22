package org.openisles.website.web.controller;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.openisles.website.domain.Screenshot;
import org.openisles.website.exception.HttpNotFoundException;
import org.openisles.website.web.interceptor.Nav;
import org.openisles.website.web.interceptor.NavsActive;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.List;

@Controller
@Transactional
public class ScreenshotsController {

    private final SessionFactory sessionFactory;

    @Autowired
    public ScreenshotsController(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @GetMapping("/media/screenshots.html")
    @NavsActive({ Nav.MEDIA, Nav.MEDIA_SCREENSHOTS })
    public String screenshots(Model model) {
        Session session = sessionFactory.getCurrentSession();
        List<Screenshot> screenshots = session
                .createQuery("from Screenshot order by orderIndex desc", Screenshot.class)
                .list();

        model.addAttribute("screenshots", screenshots);
        return "media/screenshots";
    }

    @GetMapping("/media/screenshots/{urlName}.html")
    @NavsActive({ Nav.MEDIA, Nav.MEDIA_SCREENSHOTS })
    public String screenshot(Model model, @PathVariable String urlName) {
        Session session = sessionFactory.getCurrentSession();
        Screenshot screenshot = session
                .createQuery("from Screenshot where urlName = :urlName", Screenshot.class)
                .setParameter("urlName", urlName)
                .uniqueResult();

        if (screenshot == null) {
            throw new HttpNotFoundException();
        }

        // vorheriger Screenshot
        Screenshot prevScreenshot = session
                .createQuery(
                        "from Screenshot where orderIndex > :orderIndex order by orderIndex asc",
                        Screenshot.class)
                .setParameter("orderIndex", screenshot.getOrderIndex())
                .setMaxResults(1)
                .uniqueResult();

        if (prevScreenshot == null) {
            prevScreenshot = session
                    .createQuery(
                            "from Screenshot where orderIndex = (select min(orderIndex) from Screenshot)",
                            Screenshot.class)
                    .setMaxResults(1)
                    .uniqueResult();
        }

        // nächster Screenshot
        Screenshot nextScreenshot = session
                .createQuery(
                        "from Screenshot where orderIndex < :orderIndex order by orderIndex desc",
                        Screenshot.class)
                .setParameter("orderIndex", screenshot.getOrderIndex())
                .setMaxResults(1)
                .uniqueResult();

        if (nextScreenshot == null) {
            nextScreenshot = session
                    .createQuery(
                            "from Screenshot where orderIndex = (select max(orderIndex) from Screenshot)",
                            Screenshot.class)
                    .setMaxResults(1)
                    .uniqueResult();
        }

        model.addAttribute("screenshot", screenshot);
        model.addAttribute("nextScreenshot", nextScreenshot);
        model.addAttribute("prevScreenshot", prevScreenshot);
        return "media/screenshot";
    }

}
