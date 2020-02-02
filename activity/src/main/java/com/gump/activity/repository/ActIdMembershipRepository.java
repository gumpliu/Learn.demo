package com.gump.activity.repository;

import com.gump.activity.entity.ActIdMembership;
import com.gump.activity.entity.UserGroupMultiKeysClass;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @program: com.yss.sofa.simpleflow
 * @description: ActIdMembership db操作
 * @author: gumpliu
 * @create: 2019-06-03 17:29
 **/
@Repository
public interface ActIdMembershipRepository extends CrudRepository<ActIdMembership, UserGroupMultiKeysClass>  {


    List<ActIdMembership> findByUserId(String userId);
}
