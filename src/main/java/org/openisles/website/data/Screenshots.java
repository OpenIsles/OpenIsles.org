package org.openisles.website.data;

import org.openisles.website.domain.Screenshot;

import java.time.LocalDateTime;
import java.time.Month;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Optional;

public final class Screenshots {

    private static final List<Screenshot> screenshots;
    static {
        screenshots = Collections.unmodifiableList(Arrays.asList(
                new Screenshot(
                        "2016-07-07-school-and-church",
                        LocalDateTime.of(2016, Month.JULY, 7, 20, 15, 42)
                ),
                new Screenshot(
                        "2016-06-12-ships",
                        LocalDateTime.of(2016, Month.JUNE, 12, 11, 35, 46)
                ),
                new Screenshot(
                        "2016-05-28-grain-fields-mill-and-bakery",
                        LocalDateTime.of(2016, Month.MAY, 28, 18, 5, 12)
                ),
                new Screenshot(
                        "2016-02-07-cattle",
                        LocalDateTime.of(2016, Month.FEBRUARY, 7, 15, 4, 1)
                ),
                new Screenshot(
                        "2016-01-03-demanded-goods",
                        LocalDateTime.of(2016, Month.JANUARY, 3, 2, 45, 11)
                ),
                new Screenshot(
                        "2015-12-28-i18n-poedit",
                        LocalDateTime.of(2015, Month.DECEMBER, 28, 19, 54, 12)
                ),
                new Screenshot(
                        "2015-12-28-i18n-english",
                        LocalDateTime.of(2015, Month.DECEMBER, 28, 19, 50, 42)
                ),
                new Screenshot(
                        "2015-11-28-infopanel-player",
                        LocalDateTime.of(2015, Month.NOVEMBER, 28, 12, 24, 52)
                ),
                new Screenshot(
                        "2015-11-28-infopanel-public-building",
                        LocalDateTime.of(2015, Month.NOVEMBER, 28, 12, 18, 32)
                ),
                new Screenshot(
                        "2015-11-28-infopanel-house",
                        LocalDateTime.of(2015, Month.NOVEMBER, 28, 12, 18, 14)
                ),
                new Screenshot(
                        "2015-09-14-gui-map-controls-graphically-revised",
                        LocalDateTime.of(2015, Month.SEPTEMBER, 14, 17, 36, 31)
                ),
                new Screenshot(
                        "2015-08-23-build-menu-revised",
                        LocalDateTime.of(2015, Month.AUGUST, 23, 8, 59, 19)
                ),
                new Screenshot(
                        "2015-08-10-refactoring-buildoperation-done",
                        LocalDateTime.of(2015, Month.AUGUST, 10, 22, 7, 37)
                ),
                new Screenshot(
                        "2015-07-19-refactoring-buildoperation-dev",
                        LocalDateTime.of(2015, Month.JULY, 19, 8, 48, 13)
                ),
                new Screenshot(
                        "2015-06-28-rendering-elevation-zero",
                        LocalDateTime.of(2015, Month.JUNE, 28, 20, 9, 52)
                ),
                new Screenshot(
                        "2015-05-14-sugarcane-and-tobacco-plantations",
                        LocalDateTime.of(2015, Month.MAY, 14, 20, 45, 25)
                ),
                new Screenshot(
                        "2015-05-14-sugarcane-and-tobacco-fields",
                        LocalDateTime.of(2015, Month.MAY, 14, 20, 41, 49)
                ),
                new Screenshot(
                        "2015-04-13-carriers-behind-buildings",
                        LocalDateTime.of(2015, Month.APRIL, 13, 15, 45, 14)
                ),
                new Screenshot(
                        "2015-04-13-settlers-houses",
                        LocalDateTime.of(2015, Month.APRIL, 13, 15, 37, 57)
                ),
                new Screenshot(
                        "2015-03-29-building-paths",
                        LocalDateTime.of(2015, Month.MARCH, 29, 0, 44, 8)
                ),
                new Screenshot(
                        "2015-03-29-building-areas",
                        LocalDateTime.of(2015, Month.MARCH, 29, 0, 43, 32)
                ),
                new Screenshot(
                        "2015-03-29-forest-around-foresters-house",
                        LocalDateTime.of(2015, Month.MARCH, 29, 0, 25, 52)
                ),
                new Screenshot(
                        "2015-03-29-first-graphic-of-forest",
                        LocalDateTime.of(2015, Month.MARCH, 29, 0, 25, 23)
                ),
                new Screenshot(
                        "2015-03-29-farm-road-graphics",
                        LocalDateTime.of(2015, Month.MARCH, 19, 21, 13, 29)
                ),
                new Screenshot(
                        "2015-03-15-hoverobject-no-place",
                        LocalDateTime.of(2015, Month.MARCH, 15, 20, 42, 27)
                ),
                new Screenshot(
                        "2015-03-15-building-multiple-buildings-at-once",
                        LocalDateTime.of(2015, Month.MARCH, 15, 20, 41, 30)
                ),
                new Screenshot(
                        "2015-02-13-rotation-rendering-dev",
                        LocalDateTime.of(2015, Month.FEBRUARY, 13, 22, 35, 52)
                ),
                new Screenshot(
                        "2015-01-17-graphics-four-views",
                        LocalDateTime.of(2015, Month.JANUARY, 7, 0, 11, 16)
                ),
                new Screenshot(
                        "2015-01-15-rendering-bug",
                        LocalDateTime.of(2015, Month.JANUARY, 5, 15, 51, 30)
                ),
                new Screenshot(
                        "2014-11-30-settlement-with-all-buildings",
                        LocalDateTime.of(2014, Month.NOVEMBER, 30, 13, 51, 54)
                ),
                new Screenshot(
                        "2014-11-15-pioneers-house-improved",
                        LocalDateTime.of(2014, Month.NOVEMBER, 15, 22, 24, 31)
                ),
                new Screenshot(
                        "2014-11-12-evelation-finished-new-coast-graphics",
                        LocalDateTime.of(2014, Month.NOVEMBER, 12, 16, 5, 11)
                ),
                new Screenshot(
                        "2014-11-11-elevation-finished-old-coast-graphics",
                        LocalDateTime.of(2014, Month.NOVEMBER, 11, 23, 46, 25)
                ),
                new Screenshot(
                        "2014-10-28-graphic-of-toolsmiths",
                        LocalDateTime.of(2014, Month.OCTOBER, 28, 0, 3, 40)
                ),
                new Screenshot(
                        "2014-10-26-pathfinding-algorithm-only-using-streets",
                        LocalDateTime.of(2014, Month.OCTOBER, 26, 11, 9, 48)
                ),
                new Screenshot(
                        "2014-10-21-sheep-farms-weaving-mills-new-goods-woll-cloth",
                        LocalDateTime.of(2014, Month.OCTOBER, 21, 23, 24, 19)
                ),
                new Screenshot(
                        "2014-10-18-pathfinding-algorithm-finished",
                        LocalDateTime.of(2014, Month.OCTOBER, 18, 13, 14, 6)
                ),
                new Screenshot(
                        "2014-09-28-java-helper-program-dependencies-rendering-order",
                        LocalDateTime.of(2014, Month.SEPTEMBER, 28, 16, 51, 31)
                )
        ));
    }

    public static List<Screenshot> getScreenshots() {
        return screenshots;
    }

    public static Optional<Screenshot> getByUrlName(String urlName) {
        return screenshots.stream()
                .filter(screenshot -> screenshot.getUrlName().equals(urlName))
                .findAny();
    }

    public static Screenshot getPrevScreenshot(Screenshot screenshot) {
        int i = screenshots.indexOf(screenshot);
        int prevI = (i != 0) ? (i - 1) : (screenshots.size() - 1);
        return screenshots.get(prevI);
    }

    public static Screenshot getNextScreenshot(Screenshot screenshot) {
        int i = screenshots.indexOf(screenshot);
        int nextI = (i != screenshots.size() - 1) ? (i + 1) : 0;
        return screenshots.get(nextI);
    }
}
