package com.gump.btrace;

import com.sun.btrace.annotations.*;

import static com.sun.btrace.BTraceUtils.println;

/**
 * @program: Learn.demo
 * @description: Btrace demo
 * @author: gumpliu
 * @create: 2019-04-22 11:23
 **/
@BTrace
public class BTraceMain {


//    @OnMethod(clazz = "com.lsp.spring.aop.web.HelloController", method = "hello")
//    public static void bTranceController1(){
//        println("11111111111111111111111111111111111");
//
//    }

    @OnMethod(clazz = "com.lsp.spring.aop.web.HelloController", method = "hello", location=@Location(Kind.RETURN))
    public static void bTranceController(@Return String retls){
        println("11111111111111111111111111111111111");
//        println("param = " + name );

        println("Return = " + retls );

    }




}
