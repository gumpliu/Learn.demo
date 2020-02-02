package com.yss.fsip.demo.web.domain.user.service;

import com.yss.fsip.common.FSIPRuntimeException;
import com.yss.fsip.demo.web.domain.user.entity.TUser;
import com.yss.fsip.demo.web.domain.user.repository.UserRepository;
import com.yss.fsip.service.BaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService extends BaseService<TUser,String> {
	
	@Autowired
	UserRepository userRepository;
	
	public void delete(String id) {
		userRepository.deleteById(id);	
		throw new FSIPRuntimeException("error msg！ ");
	}
}
