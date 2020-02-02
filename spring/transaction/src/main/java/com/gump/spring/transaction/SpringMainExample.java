package com.gump.spring.transaction;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;

@SpringBootApplication(scanBasePackages={"com.gump.spring"})
@EntityScan("com.gump.spring.transaction.entity")
public class SpringMainExample {
	
	public static void main(final String[] args) {
		//1.初始化
		SpringApplication application=  new SpringApplication(SpringMainExample.class);

//		//2.添加数据源
//		Map<String,Object> map = new HashMap<String,Object>();
//		map.put("spring.datasource.url","jdbc:mysql://localhost:3306/learnDemo?useSSL=false");
//		map.put("spring.datasource.username","root");
//		map.put("spring.datasource.password","123456");
//		//3.开启驼峰映射 (Such as account_id ==> accountId)
//		map.put("mybatis.configuration.map-underscore-to-camel-case",true);
//		application.setDefaultProperties(map);

		//4.启动应用
		application.run(args);
	}
}