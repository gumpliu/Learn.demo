package com.yss.fsip.demo.web.domain.user.service;

import com.yss.fsip.generic.service.BaseService;
import com.yss.fsip.demo.web.domain.user.entity.TUser;

/**
 * @Author: gumpLiu
 * @Date: 2019-12-03 13:43
 */
public interface UserService extends BaseService<TUser, String> {

    /***
     * 根据id删除用户
     *
     * @param id
     * @return void
     */
    public void delete(String id);

    /**
     * 根据userName查询用户信息
     * @param userName
     * @return
     */
    public TUser findByUserName(String userName);


}
