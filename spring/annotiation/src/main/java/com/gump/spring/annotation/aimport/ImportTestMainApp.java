package com.gump.spring.annotation.aimport;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

/**
 * @program: Learn.demo
 * @description: import注解测试
 * @author: gumpliu
 * @create: 2019-06-12 09:55
 **/
@SpringBootApplication
public class ImportTestMainApp {

    public static void main(String [] args){

        SpringApplication.run(ImportTestMainApp.class, args);

//        AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext(ConfigTest1.class);
//        AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext(ConfigTest2Registrar.class);
        AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext(ConfigTest3Selector.class);
//
//
        UserService userService = (UserService)context.getBean(UserServiceImpli.class);
        userService.save(null);
        context.close();

    }

}
