package org.openisles.website.web.interceptor;

import java.lang.annotation.*;

/**
 * Annotation für die Controller-Methoden, um Navigationspunkte als ausgewählt zu markieren
 */
@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface NavsActive {

    Nav[] value();

}
