package com.gump.spring.annotation.conditional.conditionalonbean;

import org.springframework.beans.BeansException;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;

/**
 * @program: Learn.demo
 * @description:
 * @author: gumpliu
 * @create: 2019-06-12 11:59
 **/
@SpringBootApplication
public class ConditionalOnBeanSpringAppTestMain implements ApplicationContextAware {

    private static ApplicationContext applicationContext;

    public static void main(String []args){

        SpringApplication.run(ConditionalOnBeanSpringAppTestMain.class, args);

        UserLSP userLSP = applicationContext.getBean(UserLSP.class);
        System.out.println(userLSP);
        UserGump userGump = applicationContext.getBean(UserGump.class);
        System.out.println(userGump );


    }

    @Override
    public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
        this.applicationContext = applicationContext;
    }
}
