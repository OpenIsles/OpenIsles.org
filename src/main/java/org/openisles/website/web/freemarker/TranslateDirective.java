package org.openisles.website.web.freemarker;

import freemarker.core.Environment;
import freemarker.template.*;

import java.io.IOException;
import java.util.Map;

/**
 * {@code <#translate>}-Direktive für FreeMarker, die Text je nach Sprache durchlässt oder rausfiltert.
 * <p>
 * Beispiel:
 * <pre>
 * &lt;#translate lang="de"&gt;Beispiel&lt;/#translate&gt;
 * &lt;#translate lang="en"&gt;
 *     Example
 * &lt;/#translate&gt;
 * </pre>
 */
public class TranslateDirective implements TemplateDirectiveModel {

    @Override
    public void execute(Environment env, Map params, TemplateModel[] loopVars,
                        TemplateDirectiveBody body) throws TemplateException, IOException {

        String siteLanguage = ((TemplateScalarModel) env.getVariable("siteLanguage")).getAsString();
        String langValue = ((TemplateScalarModel) params.get("lang")).getAsString();

        if (langValue.equals(siteLanguage)) {
            body.render(env.getOut());
        }
    }
}
