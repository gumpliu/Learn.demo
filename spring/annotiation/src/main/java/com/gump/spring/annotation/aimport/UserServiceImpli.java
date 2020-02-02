package com.gump.spring.annotation.aimport;

/**
 * @program: Learn.demo
 * @description: UserService实现
 * @author: gumpliu
 * @create: 2019-06-11 11:52
 **/
public class UserServiceImpli implements UserService {

    @Override
    public void save(User user) {
        System.out.println("test config test1");
        return;
    }
}
