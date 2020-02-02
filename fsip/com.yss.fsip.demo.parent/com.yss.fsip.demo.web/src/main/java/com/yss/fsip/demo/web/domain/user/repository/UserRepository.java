package com.yss.fsip.demo.web.domain.user.repository;

import com.yss.fsip.demo.web.domain.user.entity.TUser;
import com.yss.fsip.repository.BaseRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRepository extends BaseRepository<TUser, String> {}
