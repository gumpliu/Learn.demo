package com.gump.activity.repository;

import com.gump.activity.entity.OrderTask;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

/**
 * @program: com.yss.sofa.simpleflow
 * @description: orderTask db
 * @author: gumpliu
 * @create: 2019-06-05 13:19
 **/
@Repository
public interface OrderTaskRepositry extends CrudRepository<OrderTask, Long> {


    public void deleteByTaskId(String taskId);


}
