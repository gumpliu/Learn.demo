package com.gump.spring.annotation.conditional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 * client
 *
 * @author gumpliu
 * @create 2019-06-11 22:00
 */
@Component
public class MyClientBean {

  @Autowired
  private ServiceBean serviceBean;

  public ServiceBean getServiceBean(){
    return this.serviceBean;
  }

}
