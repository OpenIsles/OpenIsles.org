package org.openisles.website.web.controller;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.openisles.website.domain.Good;
import org.openisles.website.web.interceptor.Nav;
import org.openisles.website.web.interceptor.NavsActive;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.stream.Collectors;

@Controller
@Transactional
public class GameInfosController {

    private final SessionFactory sessionFactory;

    @Autowired
    public GameInfosController(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @GetMapping("/game-infos/goods.html")
    @NavsActive({ Nav.GAMEINFOS, Nav.GAMEINFOS_GOODS })
    public String goods(Model model) {
        Session session = sessionFactory.getCurrentSession();
        List<GoodsModel> goods = session
                .createQuery("from Good order by group asc, orderIndex asc", Good.class)
                .list()
                .stream()
                    .collect(Collectors.groupingBy(Good::getGroup, LinkedHashMap::new, Collectors.toList()))
                    .entrySet()
                    .stream()
                        .map(entry -> new GoodsModel(entry.getKey(), entry.getValue()))
                        .collect(Collectors.toList());

        model.addAttribute("goods", goods);
        return "game-infos/goods";
    }


    public class GoodsModel {
        private Good.Group group;
        private List<Good> goods;

        GoodsModel(Good.Group group, List<Good> goods) {
            this.group = group;
            this.goods = goods;
        }

        public Good.Group getGroup() {
            return group;
        }

        public List<Good> getGoods() {
            return goods;
        }

        @Override
        public String toString() {
            return "GoodsModel{" +
                    "group=" + group +
                    ", goods=" + goods +
                    '}';
        }
    }

}
