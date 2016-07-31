package org.openisles.website.web.support;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.MessageSourceAccessor;

public abstract class AbstractController {

    protected Breadcrumb.Builder setBreadcrumb() {
        return new Breadcrumb.Builder(messageSourceAccessor);
    }

    @Autowired
    public void setMessageSourceAccessor(MessageSourceAccessor messageSourceAccessor) {
        this.messageSourceAccessor = messageSourceAccessor;
    }

    protected MessageSourceAccessor messageSourceAccessor;

}
