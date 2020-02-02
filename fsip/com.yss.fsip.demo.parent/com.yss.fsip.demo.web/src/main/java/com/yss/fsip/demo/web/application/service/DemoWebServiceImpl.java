//package com.yss.fsip.demo.web.webservice;
//
//import java.util.ArrayList;
//import java.util.List;
//
//import javax.jws.WebService;
//
//import com.yss.fsip.demo.api.cxf.DemoWebService;
//import com.yss.fsip.demo.api.vo.UserVo;
//import com.yss.fsip.demo.web.entity.TUser;
//import com.yss.fsip.service.BaseService;
//
//@WebService(
//         targetNamespace = "http://cxf.api.demo.fsip.yss.com", //命名空间,一般是接口的包名倒序
//         name = "DemoWebService",                 //portType名称 客户端生成代码时 为接口名称
//         serviceName = "DemoWebService",           //服务name名称
//         endpointInterface = "com.yss.fsip.demo.api.cxf.DemoWebService")//指定发布webservcie的接口类，此类也需要接入@WebService注解
//public class DemoWebServiceImpl extends BaseService<TUser> implements DemoWebService {
//
//	public List<UserVo> listUser() {
//		
//		List<TUser> tUsers = findAll();
//		List<UserVo> userVos = new ArrayList<UserVo>();
//		
//		for(TUser t : tUsers) {
//			UserVo userVo = new UserVo(t.getId(), t.getUserName(), t.getPwd(), t.getEmail());
//			userVos.add(userVo);
//		}
//	
//		return userVos;
//	}
//
//}
