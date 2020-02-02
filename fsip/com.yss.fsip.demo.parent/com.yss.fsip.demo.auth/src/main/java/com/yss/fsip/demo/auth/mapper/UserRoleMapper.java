package com.yss.fsip.demo.auth.mapper;

import java.util.List;

import org.springframework.stereotype.Component;

import com.yss.fsip.demo.auth.entity.User;

import tk.mybatis.mapper.common.Mapper;

@Component
public interface UserRoleMapper extends Mapper<User>{

	public List getUserRoleById(String fid);
}
