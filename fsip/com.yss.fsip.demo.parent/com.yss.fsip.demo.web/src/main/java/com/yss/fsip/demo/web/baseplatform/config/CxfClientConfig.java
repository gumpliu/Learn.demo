package com.yss.fsip.demo.web.baseplatform.config;

import com.yss.fsip.demo.api.cxf.DemoWebService;
import org.apache.cxf.jaxws.JaxWsProxyFactoryBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * 配置类
 * 
 * @author oKong
 *
 */
@Configuration
public class CxfClientConfig {

    
    /**
     *  以接口代理方式进行调用 AuthorPortType接口
     */
    @Bean("cxfDemoWebServiceProxy")
    public DemoWebService createAuthorPortTypeProxy() {
        JaxWsProxyFactoryBean jaxWsProxyFactoryBean = new JaxWsProxyFactoryBean();
        jaxWsProxyFactoryBean.setServiceClass(DemoWebService.class);
        jaxWsProxyFactoryBean.setAddress("http://127.0.0.1:8080/ws/demoweb?wsdl");//服务地址：http://127.0.0.1:8080/ws/autho

        return (DemoWebService) jaxWsProxyFactoryBean.create();
    }
}