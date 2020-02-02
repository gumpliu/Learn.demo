package com.gump.spring.annotation;

import com.gump.spring.annotation.aimport.ConfigTest3Selector;
import com.gump.spring.annotation.aimport.UserService;
import com.gump.spring.annotation.aimport.UserServiceImpli;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.annotation.Configuration;

/**
 * @program: parent
 * @description: 启动类
 * @author: gumpliu
 * @create: 2019-04-19 10:08
 **/
@Configuration
@SpringBootApplication
public class Application {

    public static void main(String [] args){

        SpringApplication.run(Application.class, args);

//        AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext(ConfigTest1.class);
//        AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext(ConfigTest2Registrar.class);
//        AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext(ConfigTest3Selector.class);
//
//
//        UserService userService = (UserService)context.getBean(UserServiceImpli.class);
//        userService.save(null);
//        context.close();


    }

}
