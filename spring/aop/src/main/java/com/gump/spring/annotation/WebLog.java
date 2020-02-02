package com.gump.spring.annotation;

import org.aspectj.lang.JoinPoint;

/**
 * @program: parent
 * @description: web日志接口
 * @author: gumpliu
 * @create: 2019-04-19 13:39
 **/
public interface WebLog {
    public void doBefore(JoinPoint joinPoint)throws Throwable;
    public void doAfterReturning(Object ret) throws Throwable;
}
