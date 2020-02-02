package com.yss.fsip;

import org.springframework.boot.context.properties.ConfigurationProperties;

/**
 * fsip配置
 *
 *
 * @author gumpliu
 * @create 2019-07-07 21:45
 */
@ConfigurationProperties("spring.datasource.fsip")
public class FSIPProperties{

  private String factory;

  public String getFactory() {
    return factory;
  }

  public void setFactory(String factory) {
    this.factory = factory;
  }
}
