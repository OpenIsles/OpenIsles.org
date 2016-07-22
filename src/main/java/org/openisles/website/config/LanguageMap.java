package org.openisles.website.config;

import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.Map;

public class LanguageMap extends LinkedHashMap<String, String> {

    private final static Map<String, String> INSTANCE = Collections.unmodifiableMap(new LanguageMap());

    public static Map<String, String> getInstance() {
        return INSTANCE;
    }

    private LanguageMap() {
        super(2);
        put("de", "Deutsch");
        put("en", "English");
    }

}
