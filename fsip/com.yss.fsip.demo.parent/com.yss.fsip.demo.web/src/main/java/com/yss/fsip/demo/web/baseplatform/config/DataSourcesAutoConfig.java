package com.yss.fsip.demo.web.baseplatform.config;//package com.yss.fsip.demo.web.config;
//import javax.annotation.Resource;
//
//import org.springframework.boot.autoconfigure.condition.ConditionalOnBean;
//import org.springframework.context.annotation.Configuration;
//import org.springframework.data.transaction.ChainedTransactionManager;
//import org.springframework.transaction.PlatformTransactionManager;
//import org.springframework.transaction.annotation.EnableTransactionManagement;
//import org.springframework.transaction.annotation.TransactionManagementConfigurer;
//
//
//@Configuration
//@EnableTransactionManagement
//@ConditionalOnBean({SofaDataSourcesConfig.class,AcsDataSourcesConfig.class})
//public class DataSourcesAutoConfig  implements TransactionManagementConfigurer{
//
//    @Resource
//    private SofaDataSourcesConfig sofaDataSourcesConfig;
//
//    @Resource
//    private AcsDataSourcesConfig acsDataSourcesConfig;
//
////  配置分布式事务管理 
//    @Override
//    public PlatformTransactionManager annotationDrivenTransactionManager() {
//
//        return  new  ChainedTransactionManager(sofaDataSourcesConfig.masterTransactionManager(),acsDataSourcesConfig.customTransactionManager());
//    }
//
//}