package com.yss.fsip.demo.auth.api.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.yss.fsip.demo.auth.mapper.UserDataMapper;
import com.yss.fsip.demo.auth.mapper.UserFunMapper;
import com.yss.fsip.demo.auth.mapper.UserMapper;
import com.yss.fsip.demo.auth.mapper.UserRoleMapper;

@RestController
@RequestMapping("auth")
public class AuthController{

	@Autowired
	private UserRoleMapper userRoleMapper;
	@Autowired
	private UserMapper userMapper;
	@Autowired
	private UserFunMapper userFunMapper;
	@Autowired
	private UserDataMapper userDataMapper;
	
    @RequestMapping(value="getUserRoleById/{id}", method = RequestMethod.GET, produces="application/json")
    public List getUserRoleById(@PathVariable String id) {
    	return userRoleMapper.getUserRoleById(id);
    }
    
    @RequestMapping(value="getUserById/{id}", method = RequestMethod.GET, produces="application/json")
    public Map getUserById(@PathVariable String id) {
    	return userMapper.getUserById(id);
    }
    
    @RequestMapping(value="getUserFunById/{id}", method = RequestMethod.GET, produces="application/json")
    public List getUserFunById(@PathVariable String id) {
    	return userFunMapper.getUserFunById(id);
    }
    
    @RequestMapping(value="getUserDataById/{id}", method = RequestMethod.GET, produces="application/json")
    public List getUserDataById(@PathVariable String id) {
    	return userDataMapper.getUserDataById(id);
    }
}
