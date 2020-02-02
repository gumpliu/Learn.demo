package com.gump.activity.repository.vacation;

import com.gump.activity.entity.Vacation;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

/**
 * @program: com.yss.sofa.simpleflow
 * @description: orderTask db
 * @author: gumpliu
 * @create: 2019-06-05 13:19
 **/
@Repository
public interface VacationRepositry extends CrudRepository<Vacation, Long> {


    public void deleteByTaskId(String taskId);

    public Vacation findByTaskId(String taskId);


}
