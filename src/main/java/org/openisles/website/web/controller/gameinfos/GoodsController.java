package org.openisles.website.web.controller.gameinfos;

import org.openisles.website.data.Goods;
import org.openisles.website.domain.Good;
import org.openisles.website.web.support.AbstractController;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.stream.Collectors;

@Controller
public class GoodsController extends AbstractController {

    @GetMapping("/game-infos/goods.html")
    public String goods(Model model) {
        setBreadcrumb()
                .nonClickableUrl("/game-infos.html")
                .activeUrl("/game-infos/goods.html");

        List<GoodsGroupModel> goodGroups = Goods.getGoods().stream()
                .collect(Collectors.groupingBy(Good::getGroup, LinkedHashMap::new, Collectors.toList()))
                .entrySet()
                .stream()
                    .map(entry -> new GoodsGroupModel(entry.getKey(), entry.getValue()))
                    .collect(Collectors.toList());

        model.addAttribute("goodGroups", goodGroups);
        return "game-infos/goods";
    }


    public static class GoodsGroupModel {
        private Good.Group group;
        private List<Good> goods;

        GoodsGroupModel(Good.Group group, List<Good> goods) {
            this.group = group;
            this.goods = goods;
        }

        public Good.Group getGroup() {
            return group;
        }

        public List<Good> getGoods() {
            return goods;
        }
    }

}
