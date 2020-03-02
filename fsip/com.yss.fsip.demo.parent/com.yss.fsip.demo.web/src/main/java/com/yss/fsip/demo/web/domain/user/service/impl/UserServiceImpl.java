package com.yss.fsip.demo.web.domain.user.service.impl;

import com.yss.fsip.exception.FSIPRuntimeException;
import com.yss.fsip.generic.repository.BaseRepository;
import com.yss.fsip.demo.web.domain.user.entity.TUser;
import com.yss.fsip.generic.service.BaseServiceImpl;
import com.yss.fsip.demo.web.domain.user.repository.UserRepository;
import com.yss.fsip.demo.web.domain.user.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @Author: gumpLiu
 * @Date: 2019-12-03 13:42
 */
@Service
public class UserServiceImpl extends BaseServiceImpl<TUser, String> implements UserService {

    @Autowired
    UserRepository userRepository;

    public void delete(String id) {
        userRepository.deleteById(id);
        throw new FSIPRuntimeException("error msg！ ");
    }

    public TUser findByUserName(String userName){
        return userRepository.findByUserName(userName);
    }

    @Override
    public BaseRepository<TUser, String> getBaseRepository() {
        return userRepository;
    }
}