package com.gump.spring.annotation.conditional;

import org.springframework.context.annotation.Conditional;
import org.springframework.stereotype.Component;

/**
 * ServiceBean one
 *
 * @author gumpliu
 * @create 2019-06-11 21:57
 */
@Component
@Conditional(value = LocaleConditionUSA.class)
public class ServiceBeanImpl1 implements  ServiceBean {
}
