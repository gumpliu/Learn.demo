package com.yss.fsip.demo.web.webservice;

import com.yss.fsip.generic.repository.BaseRepository;
import com.yss.fsip.demo.api.cxf.DemoWebService;
import com.yss.fsip.demo.api.vo.UserVo;
import com.yss.fsip.demo.web.domain.user.entity.TUser;
import com.yss.fsip.generic.service.BaseServiceImpl;
import com.yss.fsip.demo.web.domain.user.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;

import javax.jws.WebService;
import java.util.ArrayList;
import java.util.List;

@WebService(
         targetNamespace = "http://cxf.api.demo.fsip.yss.com", //命名空间,一般是接口的包名倒序
         name = "DemoWebService",                 //portType名称 客户端生成代码时 为接口名称
         serviceName = "DemoWebService",           //服务name名称
         endpointInterface = "com.yss.fsip.demo.api.cxf.DemoWebService")//指定发布webservcie的接口类，此类也需要接入@WebService注解
public class DemoWebServiceImpl extends BaseServiceImpl<TUser,String> implements DemoWebService {
	@Autowired
	UserRepository userRepository;

	public List<UserVo> listUser() {

		List<TUser> tUsers = findAll();
		List<UserVo> userVos = new ArrayList<UserVo>();

		for(TUser t : tUsers) {
			UserVo userVo = new UserVo(t.getId(), t.getUserName(), t.getPwd(), t.getEmail());
			userVos.add(userVo);
		}

		return userVos;
	}

	@Override
	public BaseRepository<TUser, String> getBaseRepository() {
		return userRepository;
	}
}
