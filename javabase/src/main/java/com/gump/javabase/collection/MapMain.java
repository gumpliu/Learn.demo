package com.gump.javabase.collection;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * @Description: map 测试
 * @Author gumpLiu
 * @Date 2020-07-02
 * @Version V1.0
 **/
public class MapMain {

    public static void main(String[] args) {

        Map<String, String> map = new ConcurrentHashMap<String, String>(4);

        map.put("lsp0", "lsp0");
        map.put("lsp1", "lsp1");
        map.put("lsp2", "lsp2");
        map.put("lsp3", "lsp3");
        map.put("lsp4", "lsp4");
        map.put("lsp5", "lsp5");
        map.put("lsp6", "lsp6");


        System.out.println(map.toString());



    }

}
