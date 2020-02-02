package com.yss.fsip.demo.web.interfaces.controller;

import com.yss.fsip.demo.web.domain.user.entity.TUser;
import com.yss.fsip.demo.web.domain.user.service.UserService;
import com.yss.fsip.web.controller.BaseController;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;

@Controller
public class UserController extends BaseController<TUser, String> {
	
	private Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Autowired
	UserService userService;
	

    @ApiOperation(value="用户查询分页接口", notes="从url中获取当前页数及页面显示条数")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "pageNumber", value = "当前页", required = true, dataType = "Integer"),
            @ApiImplicitParam(name = "pageSize", value = "每页显示条数", required = true, dataType = "Integer")
    })
	@ResponseBody
    @RequestMapping(value="/user/page", method = RequestMethod.GET, produces="application/json")
	public Page<TUser> findUserPage() {
	   
	   return findPage(0);
	}
    
    @ResponseBody
    @RequestMapping(value="/user/delete/{id}", method = RequestMethod.GET, produces="application/json")
	public void delete(@PathVariable String id) {
	   
    	userService.delete(id);
	}
    
}
