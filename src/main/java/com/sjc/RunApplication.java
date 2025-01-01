package com.sjc;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

@SpringBootApplication
public class RunApplication extends SpringBootServletInitializer {
    private static final Logger logger = LoggerFactory.getLogger(RunApplication.class);

    /** RUN
     * @param args
     */
    public static void main(String[] args) {
        logger.info("@@@@ SAJU PROGRAM START @@@");
        SpringApplication.run(RunApplication.class, args);
        logger.info("@@@@ @@SAJU PROGRAM STARTED @@@");
    }

    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
        return application.sources(RunApplication.class);
    }
}
