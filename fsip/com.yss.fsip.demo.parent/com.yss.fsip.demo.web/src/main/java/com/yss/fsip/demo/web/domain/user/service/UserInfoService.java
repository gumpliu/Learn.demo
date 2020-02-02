package com.yss.fsip.demo.web.domain.user.service;//package com.yss.fsip.demo.web.service;
//
//import java.util.List;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Service;
//
//import com.yss.fsip.demo.web.entity.TUser;
//import com.yss.fsip.demo.web.entity.TUserInfo;
//import com.yss.fsip.demo.web.repository.TUserInfoMapper;
//import com.yss.fsip.demo.web.model.QueryUserInfo;
//
//import tk.mybatis.repository.entity.Example;
//import tk.mybatis.repository.entity.Example.Criteria;
//
//@Service
//public class UserInfoService{
//	
//	@Autowired
//	private TUserInfoMapper tUserInfoMapper;
//	
//	public List<QueryUserInfo> sQueryUserInfos(){
//		
//		return tUserInfoMapper.selectUserInfoPage();
//	}
//	
//	public List<TUserInfo> findTUserInfo(String id){
//		
//		Example example = new Example(TUser.class);
//		Criteria criteria = example.createCriteria();
//		criteria.andEqualTo("id", id);
//		return tUserInfoMapper.selectByExample(example);
//	}
//	
//	
//}