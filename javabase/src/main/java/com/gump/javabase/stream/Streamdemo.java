package com.gump.javabase.stream;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

/**
 * @Description:  1.8 stream 使用
 * @Author gumpLiu
 * @Date 2020-10-14
 * @Version V1.0
 **/
public class Streamdemo {

    public static void main(String []args){
        List<String> strs = Arrays.asList("lsp", "sxj", "lyf");
        strs.forEach(System.out::println);

        strs.stream().map(str -> str.length()).collect(Collectors.toList()).forEach(System.out::println);

    }
}
