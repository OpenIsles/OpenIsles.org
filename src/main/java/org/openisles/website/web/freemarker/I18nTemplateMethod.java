package org.openisles.website.web.freemarker;

import freemarker.template.SimpleScalar;
import freemarker.template.TemplateMethodModelEx;
import freemarker.template.TemplateModelException;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.context.support.MessageSourceAccessor;

import java.util.List;
import java.util.Locale;

/**
 * Stellt eine Funktion für die FreeMarker-Templates zur Verfügung, um Message-Keys auflösen zu können
 */
public class I18nTemplateMethod implements TemplateMethodModelEx {

    private MessageSourceAccessor messageSourceAccessor;

    public I18nTemplateMethod(MessageSourceAccessor messageSourceAccessor) {
        this.messageSourceAccessor = messageSourceAccessor;
    }

    @Override
    public Object exec(List arguments) throws TemplateModelException {
        if (arguments.size() != 1) {
            throw new TemplateModelException("Illegal argument count. Expected was exactly one.");
        }

        if (!(arguments.get(0) instanceof SimpleScalar)) {
            throw new TemplateModelException("Argument must be a string (SimpleScalar)");
        }
        String messageCode = ((SimpleScalar) arguments.get(0)).getAsString();

        Locale locale = LocaleContextHolder.getLocale();
        return messageSourceAccessor.getMessage(messageCode, locale);
    }
}
