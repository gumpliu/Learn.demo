package com.gump.spring.annotation.conditional;

import org.springframework.context.annotation.Conditional;
import org.springframework.stereotype.Component;

/**
 * ServiceBean two
 *
 * @author gumpliu
 * @create 2019-06-11 21:57
 */
@Component
@Conditional(value = LocaleConditionCanada.class)
public class ServiceBeanImpl2 implements  ServiceBean {
}
