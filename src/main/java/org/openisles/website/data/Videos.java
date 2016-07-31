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
