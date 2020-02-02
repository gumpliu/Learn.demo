package com.gump.spring.annotation.conditional.conditionalonbean;

import org.springframework.boot.autoconfigure.condition.ConditionalOnBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * @program: Learn.demo
 * @description: conditionalOnBean test
 * @author: gumpliu
 * @create: 2019-06-12 11:53
 **/
@Configuration
public class ConditionalOnBeanAppConfig {

    @Bean
    @ConditionalOnBean(value = UserLSP.class)
    public UserGump userGump(){
        return new UserGump();
    }

}
