package org.openisles.website.web.controller;

import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.DispatcherServlet;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * Fehlerseiten
 */
@Controller
public class ErrorController {

    private static final Logger logger = Logger.getLogger(ErrorController.class.getName());

    @ResponseStatus(HttpStatus.NOT_FOUND)
    @GetMapping("/error/404.html")
    public String notFound(HttpServletRequest request) {
        logger.log(Level.WARNING, "404 for url " + request.getRequestURI());
        return "error/404";
    }

    @ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
    @GetMapping("/error/default.html")
    public String allOtherErrors(HttpServletRequest request) {
        Throwable errorException = (Throwable) request.getAttribute(DispatcherServlet.EXCEPTION_ATTRIBUTE);
        if (errorException != null) {
            logger.log(Level.WARNING, "Error for url " + request.getRequestURI(), errorException);
        } else {
            errorException = (Throwable) request.getAttribute(RequestDispatcher.ERROR_EXCEPTION);
            if (errorException != null) {
                logger.log(Level.WARNING, "Error for url " + request.getRequestURI(), errorException);
            } else {
                logger.log(Level.WARNING, "Error for url " + request.getRequestURI() + ". No stacktrace");
            }
        }

        return "error/default";
    }
}
