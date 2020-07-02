package com.leecheck;

import com.leecheck.appListener.ApplicationClosedListener;
import com.leecheck.appListener.ApplicationReadyListener;
import com.leecheck.appListener.ApplicationStartedListener;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletComponentScan;
import org.springframework.context.ConfigurableApplicationContext;

@SpringBootApplication
@ServletComponentScan
public class AppApplication {

    public static ConfigurableApplicationContext context;

    public static void main(String[] args) {
        SpringApplication application = new SpringApplication(AppApplication.class);
        application.addListeners(new ApplicationStartedListener());
        application.addListeners(new ApplicationReadyListener());
        application.addListeners(new ApplicationClosedListener());
        application.run(args);
    }
}
