package com.gump.spring.annotation.aimport;

import org.springframework.context.annotation.Import;

/**
 * @program: Learn.demo
 * @description: Config测试第一种
 * @author: gumpliu
 * @create: 2019-06-11 11:53
 **/
@Import(value = UserServiceImpli.class)
public class ConfigTest1 {
}
