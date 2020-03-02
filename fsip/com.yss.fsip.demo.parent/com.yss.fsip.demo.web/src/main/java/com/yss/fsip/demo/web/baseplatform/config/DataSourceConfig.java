package com.yss.fsip.demo.web.baseplatform.config;

import com.zaxxer.hikari.HikariDataSource;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.jdbc.DataSourceBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;

import javax.sql.DataSource;

@Configuration
public class DataSourceConfig {

    private static Logger logger = LoggerFactory.getLogger(DataSourceConfig.class);


    @Bean(name = "masterDataSource")
    @Primary
    @ConfigurationProperties(prefix = "spring.datasource.master")
    public DataSource primaryDataSource() {
        return DataSourceBuilder.create().build();
    }

    @Bean(name = "slaveDataSource")
    @ConfigurationProperties(prefix = "spring.datasource.slave")
    public DataSource secondaryDataSource() {
        return DataSourceBuilder.create().build();
    }


    /**
     * 显示数据库连接池信息
     *
     * @param dataSource
     */
    public static void logDS(DataSource dataSource) {
        HikariDataSource hds = (HikariDataSource) dataSource;
        String info = "\n\n\tHikariCP连接池配置\n\t连接池名称：" +
                hds.getPoolName() +
                "\n\t最小空闲连接数：" +
                hds.getMinimumIdle() +
                "\n\t最大连接数：" +
                hds.getMaximumPoolSize() +
                "\n\t连接超时时间：" +
                hds.getConnectionTimeout() +
                "ms\n\t空闲连接超时时间：" +
                hds.getIdleTimeout() +
                "ms\n\t连接最长生命周期：" +
                hds.getMaxLifetime() +
                "ms\n";
        logger.info(info);
    }
}