package com.yss.fsip.demo.auth.mapper;

import java.util.Map;

import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Component;

import com.yss.fsip.demo.auth.entity.User;

import tk.mybatis.mapper.common.Mapper;

@Primary
@Component
public interface UserMapper extends Mapper<User> {
	
	Map getUserById(String fid);
}