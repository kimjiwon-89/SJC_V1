package com.sjc.SJC_V1;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;


@SpringBootApplication
public class RunApplication extends SpringBootServletInitializer {
	private static final Logger logger = LogManager.getLogger(RunApplication.class);
	
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
