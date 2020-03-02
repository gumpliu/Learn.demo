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
        entityManagerFactoryRef="masterEntityManager",
        transactionManagerRef="entityManagerFactory",
        basePackages= { "com.yss.fsip.demo.web.domain.user.repository" }) //设置Repository所在位置

public class MasterDataSourceConfig {

    @Autowired
    @Qualifier("masterDataSource")
    private DataSource masterDataSource;

    @Autowired
    private JpaProperties jpaProperties;
    @Autowired
    private HibernateProperties hibernateProperties;

    @Primary
    @Bean(name = "masterEntityManager")
    public EntityManager entityManager(EntityManagerFactoryBuilder builder) {
        return entityManagerFactory(builder).getObject().createEntityManager();
    }

    @Primary
    @Bean(name = "entityManagerFactory")
    public LocalContainerEntityManagerFactoryBean entityManagerFactory (EntityManagerFactoryBuilder builder) {
        return builder
                .dataSource(masterDataSource)
                .properties(getVendorProperties())
                .packages("com.yss.fsip.demo.web.domain.user.entity") //设置实体类所在位置
                .persistenceUnit("masterPersistenceUnit")
                .build();
    }




    private Map<String, Object> getVendorProperties() {
        return hibernateProperties.determineHibernateProperties(jpaProperties.getProperties(), new HibernateSettings());
    }

    /**
     * 事务管理器
     * @param builder
     * @return
     */
    @Primary
    @Bean(name = "transactionManager")
    public PlatformTransactionManager masterTransactionManager(EntityManagerFactoryBuilder builder) {
        return new JpaTransactionManager(entityManagerFactory(builder).getObject());
    }

}