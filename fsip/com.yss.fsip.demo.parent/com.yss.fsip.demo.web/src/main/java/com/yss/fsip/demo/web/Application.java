package com.yss.fsip.demo.web;

import com.yss.fsip.generic.repository.BaseJpaRepositoryFactoryBean;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import springfox.documentation.swagger2.annotations.EnableSwagger2;
//需要扫描com.yss.fsip.common，否则统一返回结果不生效
@SpringBootApplication(scanBasePackages= {"com.yss.fsip","com.yss.fsip.demo.web"})
@EnableJpaRepositories(repositoryFactoryBeanClass = BaseJpaRepositoryFactoryBean.class)
@EnableSwagger2
@EnableCaching
public class Application extends SpringBootServletInitializer {

	public static void main(String[] args) {
		SpringApplication.run(Application.class, args);
	}
//	
//    @Override
//    protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) {
//        // 注意这里要指向原先用main方法执行的Application启动类
//        return builder.sources(Application.class);
//    }
}