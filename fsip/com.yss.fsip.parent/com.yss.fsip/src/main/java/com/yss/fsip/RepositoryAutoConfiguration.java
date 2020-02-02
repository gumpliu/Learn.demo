package com.yss.fsip;

import org.springframework.context.annotation.Configuration;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

import com.yss.fsip.repository.BaseRepositoryFactoryBean;

@Configuration
@EnableJpaRepositories(repositoryFactoryBeanClass = BaseRepositoryFactoryBean.class)
public class RepositoryAutoConfiguration {
}