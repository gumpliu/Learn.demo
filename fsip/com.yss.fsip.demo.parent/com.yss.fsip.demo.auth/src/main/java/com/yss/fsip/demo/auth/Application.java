package com.yss.fsip.demo.auth;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cache.annotation.EnableCaching;

import tk.mybatis.spring.annotation.MapperScan;
//需要扫描com.yss.fsip.common，否则统一返回结果不生效
@SpringBootApplication(scanBasePackages= {"com.yss.fsip.demo.auth"})
@MapperScan("com.yss.fsip.demo.auth.mapper")
@EnableCaching
public class Application {

	public static void main(String[] args) {
		SpringApplication.run(Application.class, args);
	}
}