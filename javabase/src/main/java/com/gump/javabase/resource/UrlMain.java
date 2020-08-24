package com.gump.javabase.resource;

import java.net.URI;
import java.net.URISyntaxException;

/**
 * @Description: TODO
 * @Author gumpLiu
 * @Date 2020-07-08
 * @Version V1.0
 **/
public class UrlMain {

    public static void main(String[] args) {
        try {
            URI uri = new URI("../../../demo/jfc/SwingSet2/src/SwingSet2.java");
            System.out.println(uri.getScheme());
            System.out.println(uri.getPath());
            System.out.println(uri.getUserInfo());
            System.out.println(uri.getAuthority());
            System.out.println(uri.getHost());
            System.out.println(uri.getPort());

        } catch (URISyntaxException e) {
            e.printStackTrace();
        }
    }
}
