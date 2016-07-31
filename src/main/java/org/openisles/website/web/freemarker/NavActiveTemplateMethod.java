package org.openisles.website.web.freemarker;

import freemarker.template.TemplateMethodModelEx;
import freemarker.template.TemplateModelException;
import freemarker.template.TemplateScalarModel;
import org.openisles.website.web.support.Breadcrumb;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Stellt eine Funktion für die FreeMarker-Templates zur Verfügung, um zu prüfen, ob eine bestimmte URL
 * in der Breadcrumb enthalten ist und somit in der Navigationsleiste aktiv gezeigt werden muss
 */
public class NavActiveTemplateMethod implements TemplateMethodModelEx {

    @Override
    public Object exec(List arguments) throws TemplateModelException {
        if (arguments.size() != 1) {
            throw new TemplateModelException("Illegal argument count. Expected was exactly one.");
        }

        Object rawArgument = arguments.get(0);
        if (!(rawArgument instanceof TemplateScalarModel)) {
            throw new TemplateModelException("Argument must be a string (TemplateScalarModel)");
        }

        String url = ((TemplateScalarModel) rawArgument).getAsString();

        HttpServletRequest request =
                ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        Breadcrumb breadcrumb = (Breadcrumb) request.getAttribute(Breadcrumb.ATTRIBUTE_NAME);

        if (breadcrumb == null) {
            return false;
        }

        return breadcrumb.stream().anyMatch(bit -> bit.getUrl().equals(url));
    }
}
