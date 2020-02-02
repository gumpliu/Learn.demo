package com.gump.spring.annotation.conditional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Conditional;

/**
 * conditional config
 *
 * @author gumpliu
 * @create 2019-06-11 21:52
 */
@Configurable
public class AppConfig {


  @Bean
  @Conditional(value = LocaleConditionUSA.class)
  public ServiceBean serviceBeanA(){
    return new ServiceBeanImpl1();
  }

  @Bean
  @Conditional(value = LocaleConditionCanada.class)
  public ServiceBean serviceBeanB(){
    return new ServiceBeanImpl2();
  }

  @Bean
  public MyClientBean myClientBean(){
    return new MyClientBean();
  }

}
