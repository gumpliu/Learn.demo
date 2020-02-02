package com.gump.spring.annotation.aimport;

import org.springframework.context.annotation.Import;

import java.lang.annotation.*;

/**
 * @program: Learn.demo
 * @description: EnableUserService 注解
 * @author: gumpliu
 * @create: 2019-06-11 12:03
 **/
@Retention(value = RetentionPolicy.RUNTIME)
@Documented
@Target(ElementType.TYPE)
@Import(value = UserImportSelector.class)
public @interface EnableUserService {

    String name() default "";
}
