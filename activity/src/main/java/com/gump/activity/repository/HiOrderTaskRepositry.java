package com.gump.activity.repository;

import com.gump.activity.entity.HiOrderTask;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

/**
 * @program: com.yss.sofa.simpleflow
 * @description: hiOrderTask db
 * @author: gumpliu
 * @create: 2019-06-05 13:19
 **/
@Repository
public interface HiOrderTaskRepositry extends CrudRepository<HiOrderTask, Long> {
}
