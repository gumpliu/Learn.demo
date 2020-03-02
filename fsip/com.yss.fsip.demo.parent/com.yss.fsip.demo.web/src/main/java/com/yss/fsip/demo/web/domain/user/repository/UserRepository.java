package com.yss.fsip.demo.web.domain.user.repository;

import com.yss.fsip.generic.repository.BaseRepository;
import com.yss.fsip.demo.web.domain.user.entity.TUser;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRepository extends BaseRepository<TUser, String> {

    TUser findByUserName(String userName);
}
