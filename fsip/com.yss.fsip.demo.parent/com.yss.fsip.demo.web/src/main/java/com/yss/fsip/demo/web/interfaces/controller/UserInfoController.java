//package com.yss.fsip.demo.web.interfaces.controller;
//
//import java.util.List;
//
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.data.domain.Page;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.PathVariable;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.bind.annotation.ResponseBody;
//
//import com.alibaba.fastjson.JSON;
//import com.yss.fsip.demo.web.baseplatform.context.FSIPContextFactory;
//import com.yss.fsip.demo.web.entity.TUserInfo;
//import com.yss.fsip.demo.web.model.QueryUserInfo;
//import com.yss.fsip.demo.web.service.UserInfoService;
//
//@Controller
//public class UserInfoController {
//	
//	private Logger logger = LoggerFactory.getLogger(UserInfoController.class);
//	
//	@Autowired
//	private UserInfoService userInfoService;
//	
//	@ResponseBody
//    @RequestMapping(value="/userInfo/page", method = RequestMethod.POST, produces="application/json")
//	public Page<QueryUserInfo> findUserPage( Integer pageNumber, Integer pageSize ) {
//	   
//	   PageHelper.startPage(pageNumber, pageSize);
//	   List<QueryUserInfo> list = userInfoService.sQueryUserInfos();
//	   
//	   logger.info("UserController.findUserPage listAll={}", JSON.toJSONString(list));
//	   
//	   PageInfo<QueryUserInfo> pageInfo = new PageInfo<QueryUserInfo>(list);
//	   
//	   logger.info("UserController.findUserPage pageInfo={}", JSON.toJSONString(pageInfo));
//	    System.out.println("sdddds");
//
//		return pageInfo;
//	}  
//	
//	
//	@ResponseBody
//    @RequestMapping(value="/userInfo", method = RequestMethod.GET, produces="application/json")
//	public List<TUserInfo> findUserInfo() {
//	    
//		return userInfoService.findTUserInfo("1");
//	} 
//}
