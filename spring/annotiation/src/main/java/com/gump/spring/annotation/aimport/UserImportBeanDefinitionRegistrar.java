package com.gump.spring.annotation.aimport;

import org.springframework.beans.factory.support.BeanDefinitionBuilder;
import org.springframework.beans.factory.support.BeanDefinitionRegistry;
import org.springframework.context.annotation.ImportBeanDefinitionRegistrar;
import org.springframework.core.type.AnnotationMetadata;

/**
 * @program: Learn.demo
 * @description: ImportBeanDefinitionRegistrar
 * @author: gumpliu
 * @create: 2019-06-11 11:57
 **/
public class UserImportBeanDefinitionRegistrar implements ImportBeanDefinitionRegistrar {

    @Override
    public void registerBeanDefinitions(AnnotationMetadata annotationMetadata, BeanDefinitionRegistry registry) {
        BeanDefinitionBuilder userService  =  BeanDefinitionBuilder.rootBeanDefinition(UserServiceImpli.class);
        registry.registerBeanDefinition("userService", userService.getBeanDefinition());
    }
}
