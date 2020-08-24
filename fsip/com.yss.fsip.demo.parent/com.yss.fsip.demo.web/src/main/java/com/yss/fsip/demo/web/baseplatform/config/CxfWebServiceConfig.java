package com.yss.fsip.demo.web.baseplatform.config;//package com.yss.fsip.demo.web.config;

import com.yss.fsip.demo.api.cxf.DemoWebService;
import com.yss.fsip.demo.api.cxf.DemoWebServiceImpl;
import org.apache.cxf.Bus;
import org.apache.cxf.bus.spring.SpringBus;
import org.apache.cxf.jaxws.EndpointImpl;
import org.apache.cxf.transport.servlet.CXFServlet;
import org.springframework.boot.web.servlet.ServletRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import javax.xml.ws.Endpoint;

/**
 * cxf配置类
 * @author oKong
 *
 */
@Configuration
public class CxfWebServiceConfig {

    //这里需要注意  由于springmvc 的核心类 为DispatcherServlet
    //此处若不重命名此bean的话 原本的mvc就被覆盖了。可查看配置类：DispatcherServletAutoConfiguration
    //一种方法是修改方法名称 或者指定bean名称
    //这里需要注意 若beanName命名不是 cxfServletRegistration 时，会创建两个CXFServlet的。
    //具体可查看下自动配置类：Declaration org.apache.cxf.spring.boot.autoconfigure.CxfAutoConfiguration
    //也可以不设置此bean 直接通过配置项 cxf.path 来修改访问路径的
    @Bean("cxfServletRegistration")
    public ServletRegistrationBean dispatcherServlet() {
        //注册servlet 拦截/ws 开头的请求 不设置 默认为：/services/*
        return new ServletRegistrationBean(new CXFServlet(), "/ws/*");
    }

    /**
     * 申明业务处理类 当然也可以直接 在实现类上标注 @Service
     * @author oKong
     */
    @Bean
    public DemoWebService demoWebService() {
        return new DemoWebServiceImpl();
    }

    /*
     * 非必要项
     */
    @Bean(name = Bus.DEFAULT_BUS_ID)
    public SpringBus springBus() {
        SpringBus springBus = new SpringBus();
        return springBus;
    }

    /*
     * 发布endpoint
     */
    @Bean
    public Endpoint endpoint(DemoWebService demoWebService) {
        EndpointImpl endpoint = new EndpointImpl(springBus(), demoWebService);
        endpoint.publish("/demoweb");//发布地址

        //打印报文日志拦截器
        //endpoint.getInInterceptors().add(new LoggingInInterceptor());
        //endpoint.getInInterceptors().add(new LoggingOutInterceptor());

        //通过拦截器校验用户名与密码
//        endpoint.getInInterceptors().add(new AuthInterceptor());
        return endpoint;
    }
}