package org.openisles.website.domain;

import org.openisles.website.config.LanguageMap;
import org.springframework.beans.BeanUtils;

import java.beans.PropertyDescriptor;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.Map;

abstract class Translatable {

    protected Map<String, String> getLangValueMap(String fieldPrefix) {
        Map<String, String> languageMap = LanguageMap.getInstance();

        Map<String, String> valueMap = new HashMap<>(languageMap.size());
        for (String lang : languageMap.keySet()) {
            String field = fieldPrefix + lang.substring(0, 1).toUpperCase() + lang.substring(1);
            valueMap.put(lang, getFieldValue(field));
        }

        return valueMap;
    }

    protected String getFieldValue(String field) {
        PropertyDescriptor pd = BeanUtils.getPropertyDescriptor(getClass(), field);
        Method getter = pd.getReadMethod();
        try {
            return (String) getter.invoke(this);
        } catch (IllegalAccessException | InvocationTargetException e) {
            throw new RuntimeException(e);
        }
    }

}
