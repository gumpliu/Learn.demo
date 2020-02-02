package com.gump.spring.annotation;

import org.springframework.beans.BeansException;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.context.annotation.ImportResource;
import org.springframework.core.env.MapPropertySource;
import org.springframework.core.env.MutablePropertySources;
import org.springframework.core.env.PropertiesPropertySource;

import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

/**
 * @program: parent
 * @description: 启动类
 * @author: gumpliu
 * @create: 2019-04-19 10:08
 **/
@SpringBootApplication
@ImportResource("classpath:aop-config.xml")
public class Application implements ApplicationContextAware {

    private static ApplicationContext applicationContext;

    public static void main(String [] args){

//        SpringApplication.run(Application.class, args);
//
//        applicationContext.getBean("helloController");

        MutablePropertySources mutablePropertySources = new MutablePropertySources();
        Map<String, Object> map = new HashMap<>(8);
        map.put("name", "throwable");
        map.put("age", 25);
        MapPropertySource mapPropertySource = new MapPropertySource("map", map);
        mutablePropertySources.addLast(mapPropertySource);
        Properties properties = new Properties();
        PropertiesPropertySource propertiesPropertySource = new PropertiesPropertySource("prop", properties);
        properties.put("name", "doge");
        properties.put("gourp", "group-a");
        mutablePropertySources.addBefore("map", propertiesPropertySource);
        System.out.println(mutablePropertySources);



    }

    @Override
    public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
        this.applicationContext = applicationContext;
    }
}
