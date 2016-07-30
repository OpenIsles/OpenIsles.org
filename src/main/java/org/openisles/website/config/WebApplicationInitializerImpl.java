package org.openisles.website.config;

import org.springframework.web.WebApplicationInitializer;
import org.springframework.web.context.support.AnnotationConfigWebApplicationContext;
import org.springframework.web.servlet.DispatcherServlet;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRegistration;

public class WebApplicationInitializerImpl implements WebApplicationInitializer {

    @Override
    public void onStartup(ServletContext servletContext) throws ServletException {
        AnnotationConfigWebApplicationContext applicationContext = new AnnotationConfigWebApplicationContext();
        applicationContext.setConfigLocation("org.openisles.website.config");

        DispatcherServlet dispatcherServlet = new DispatcherServlet();
        dispatcherServlet.setApplicationContext(applicationContext);

        ServletRegistration.Dynamic springDispatcher =
                servletContext.addServlet("springDispatcher", dispatcherServlet);

        springDispatcher.setLoadOnStartup(1);
        springDispatcher.addMapping("/");
    }
}
