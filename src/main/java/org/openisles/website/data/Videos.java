package org.openisles.website.data;

import org.openisles.website.domain.Video;

import java.time.LocalDate;
import java.time.Month;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

public final class Videos {

    private static final List<Video> videos;
    static {
        videos = Collections.unmodifiableList(Arrays.asList(
                new Video(
                        "2016-08-06-ai-roads-and-foresters",
                        LocalDate.of(2016, Month.AUGUST, 6)
                ),
                new Video(
                        "2016-06-10-grain-mill-animated",
                        LocalDate.of(2016, Month.JUNE, 10)
                ),
                new Video(
                        "2016-05-29-demolish",
                        LocalDate.of(2016, Month.MAY, 29)
                ),
                new Video(
                        "2016-04-16-houses-advancement",
                        LocalDate.of(2016, Month.APRIL, 16)
                ),
                new Video(
                        "2015-05-17-growth",
                        LocalDate.of(2015, Month.MAY, 17)
                ),
                new Video(
                        "2014-10-14-carrier-animation",
                        LocalDate.of(2014, Month.OCTOBER, 14)
                )
        ));
    }

    public static List<Video> getVideos() {
        return videos;
    }

}
