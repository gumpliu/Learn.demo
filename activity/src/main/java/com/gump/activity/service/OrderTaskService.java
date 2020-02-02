package com.gump.activity.service;

import com.gump.activity.entity.HiOrderTask;
import com.gump.activity.entity.OrderTask;
import com.gump.activity.repository.HiOrderTaskRepositry;
import com.gump.activity.repository.OrderTaskRepositry;
import org.activiti.engine.RuntimeService;
import org.activiti.engine.TaskService;
import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.engine.task.Task;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @program: com.yss.sofa.simpleflow
 * @description: 业务相关操作
 * @author: gumpliu
 * @create: 2019-06-05 13:14
 **/
@Service
public class OrderTaskService {

    Logger logger = LoggerFactory.getLogger(OrderTaskService.class);

    @Autowired
    OrderTaskRepositry orderTaskRepositry;

    @Autowired
    HiOrderTaskRepositry hiOrderTaskRepositry;

    @Autowired
    RuntimeService runtimeService;

    @Autowired
    TaskService taskService;

    /**
     * flow complete 业务关联表相关操作
     *
     * @param processInstanceId
     */
    @Transactional
    public void completeOrderTask(String processInstanceId, String taskId, String creater, String orderName){

        ProcessInstance processInstance = runtimeService.createProcessInstanceQuery()
                .processInstanceId(processInstanceId).singleResult();
        deleteOrderTask(taskId);

        if(processInstance != null){
            List<Task> taskList = taskService.createTaskQuery().processInstanceId(processInstanceId).list();
            for(Task task : taskList){
                inserHiOrderTask(task.getId(), orderName, creater);
                inserOrderTask(task.getId(), orderName, creater);
            }

        }

    }

    /**
     * 保存业务数据
     *
     * @param taskId
     * @param orderName
     * @param creater
     */
    public void inserOrderTask(String taskId, String orderName, String creater){

        logger.info("OrderTaskService.inserOrderTask start params taskId={},orderName={},creater={}", taskId, orderName, creater);

        OrderTask orderTask = new OrderTask(taskId, orderName, creater);

        orderTaskRepositry.save(orderTask);
    }

    /**
     * 删除业务数据
     *
     * @param taskId
     */
    public void deleteOrderTask(String taskId){
        logger.info("OrderTaskService.deleteOrderTask start params taskId={}", taskId);

        orderTaskRepositry.deleteByTaskId(taskId);
    }

    /**
     * 保存历史业务数据
     *
     * @param taskId
     * @param orderName
     * @param creater
     */
    public void inserHiOrderTask(String taskId, String orderName, String creater){

        logger.info("OrderTaskService.inserHiOrderTask start params taskId={},orderName={},creater={}", taskId, orderName, creater);

        HiOrderTask hiOrderTask = new HiOrderTask(taskId, orderName, creater);

        hiOrderTaskRepositry.save(hiOrderTask);
    }

}
