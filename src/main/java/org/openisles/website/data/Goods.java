package org.openisles.website.data;

import org.openisles.website.domain.Good;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;

public final class Goods {

    private static final List<Good> goods;
    static {
        goods = Collections.unmodifiableList(Arrays.asList(
                new Good(Good.Group.RAW_MATERIAL, "wool"),
                new Good(Good.Group.RAW_MATERIAL, "sugar"),
                new Good(Good.Group.RAW_MATERIAL, "tobacco"),
                new Good(Good.Group.RAW_MATERIAL, "cattle"),
                new Good(Good.Group.RAW_MATERIAL, "grain"),
                new Good(Good.Group.RAW_MATERIAL, "flour"),
                new Good(Good.Group.CONSUMER_GOOD, "food"),
                new Good(Good.Group.CONSUMER_GOOD, "tobacco-goods"),
                new Good(Good.Group.CONSUMER_GOOD, "spices"),
                new Good(Good.Group.CONSUMER_GOOD, "alcohol"),
                new Good(Good.Group.CONSUMER_GOOD, "cloth"),
                new Good(Good.Group.BUILDING_MATERIAL, "tools"),
                new Good(Good.Group.BUILDING_MATERIAL, "wood"),
                new Good(Good.Group.BUILDING_MATERIAL, "bricks")
        ));
    }

    public static List<Good> getGoods() {
        return goods;
    }

}
