package com.meliora.web;

import com.meliora.service.SystemService;
import lombok.Getter;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.ApplicationContext;
import org.springframework.context.event.ApplicationContextEvent;
import org.springframework.stereotype.Repository;
import org.springframework.web.context.ServletContextAware;

import javax.servlet.ServletContext;

@Repository
@Slf4j
public class ServletContextInit implements InitializingBean ,ServletContextAware {

    private ServletContext context;

    @Autowired
    private SystemService systemService;

    @Override
    public void afterPropertiesSet() throws Exception {
        log.info("cache initialize ...");
        systemService.initCache();
        log.info("cache initialize finished");
    }

    @Override
    public void setServletContext(ServletContext servletContext) {
        this.context=servletContext;
    }
}
