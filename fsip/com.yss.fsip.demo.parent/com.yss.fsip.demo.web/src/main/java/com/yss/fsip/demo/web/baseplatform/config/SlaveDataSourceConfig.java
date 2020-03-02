package com.yss.fsip.demo.web.baseplatform.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.autoconfigure.orm.jpa.HibernateProperties;
import org.springframework.boot.autoconfigure.orm.jpa.HibernateSettings;
import org.springframework.boot.autoconfigure.orm.jpa.JpaProperties;
import org.springframework.boot.orm.jpa.EntityManagerFactoryBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.orm.jpa.JpaTransactionManager;
import org.springframework.orm.jpa.LocalContainerEntityManagerFactoryBean;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import javax.persistence.EntityManager;
import javax.sql.DataSource;
import java.util.Map;

@Configuration
@EnableTransactionManagement
@EnableJpaRepositories(
        entityManagerFactoryRef="slaveEntityManager",
        transactionManagerRef="slaveEntityManagerFactory",
        basePackages= { "com.yss.fsip.demo.web.domain.user.repository1" }) //设置Repository所在位置

public class SlaveDataSourceConfig {

    @Autowired
    @Qualifier("slaveDataSource")
    private DataSource slaveDataSource;

    @Bean(name = "slaveEntityManager")
    public EntityManager entityManager(EntityManagerFactoryBuilder builder) {
        return slaveEntityManagerFactory(builder).getObject().createEntityManager();
    }

    @Bean(name = "slaveEntityManagerFactory")
    public LocalContainerEntityManagerFactoryBean slaveEntityManagerFactory (EntityManagerFactoryBuilder builder) {
        return builder
                .dataSource(slaveDataSource)
                .properties(getVendorProperties())
                .packages("com.yss.fsip.demo.web.domain.user.entity1") //设置实体类所在位置
                .persistenceUnit("slavePersistenceUnit")
                .build();
    }

    @Autowired
    private JpaProperties jpaProperties;
    @Autowired HibernateProperties hibernateProperties;


    private Map<String, Object> getVendorProperties() {
        return hibernateProperties.determineHibernateProperties(jpaProperties.getProperties(), new HibernateSettings());
    }

    /**
     * 事务管理器
     * @param builder
     * @return
     */
    @Bean(name = "slaveTransactionManager")
    public PlatformTransactionManager slaveTransactionManager(EntityManagerFactoryBuilder builder) {
        return new JpaTransactionManager(slaveEntityManagerFactory(builder).getObject());
    }

}