package com.gump.activity.entity;

import javax.persistence.*;
/**
 * @program: com.yss.sofa.simpleflow
 * @description: order_task
 * @author: gumpliu
 * @create: 2019-06-05 13:15
 **/
@Entity
@Table(name = "t_order_task")
public class OrderTask {

    @Id
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    private Long id;

    private String taskId;

    private String orderName;

    private String creater;

    public OrderTask(){}

    public OrderTask(String taskId, String orderName, String creater){
        this.taskId = taskId;
        this.orderName = orderName;
        this.creater = creater;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTaskId() {
        return taskId;
    }

    public void setTaskId(String taskId) {
        this.taskId = taskId;
    }

    public String getOrderName() {
        return orderName;
    }

    public void setOrderName(String orderName) {
        this.orderName = orderName;
    }

    public String getCreater() {
        return creater;
    }

    public void setCreater(String creater) {
        this.creater = creater;
    }
}
