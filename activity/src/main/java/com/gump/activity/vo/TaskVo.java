package com.gump.activity.vo;

/**
 * @program: com.yss.sofa.simpleflow
 * @description: Task显示信息
 * @author: gumpliu
 * @create: 2019-06-04 10:37
 **/
public class TaskVo {
    private String taskId;//任务id
    private String createTaskDate;//任务创建时间
    private String endDate;
    private String assigenee; //认领人
    private String taskName;//任务名称
    private String procInstId;//实例id
    private String procDefId;//流程定义id
    private String proDefName;//流程定义名称
    private String creater; //业务创建人
    private String orderName;//订单名称

    public String getTaskId() {
        return taskId;
    }

    public void setTaskId(String taskId) {
        this.taskId = taskId;
    }

    public String getCreateTaskDate() {
        return createTaskDate;
    }

    public void setCreateTaskDate(String createTaskDate) {
        this.createTaskDate = createTaskDate;
    }

    public String getAssigenee() {
        return assigenee;
    }

    public void setAssigenee(String assigenee) {
        this.assigenee = assigenee;
    }

    public String getTaskName() {
        return taskName;
    }

    public void setTaskName(String taskName) {
        this.taskName = taskName;
    }

    public String getProcInstId() {
        return procInstId;
    }

    public void setProcInstId(String procInstId) {
        this.procInstId = procInstId;
    }

    public String getProcDefId() {
        return procDefId;
    }

    public void setProcDefId(String procDefId) {
        this.procDefId = procDefId;
    }

    public String getProDefName() {
        return proDefName;
    }

    public void setProDefName(String proDefName) {
        this.proDefName = proDefName;
    }

    public String getCreater() {
        return creater;
    }

    public void setCreater(String creater) {
        this.creater = creater;
    }

    public String getOrderName() {
        return orderName;
    }

    public void setOrderName(String orderName) {
        this.orderName = orderName;
    }


    public String getEndDate() {
        return endDate;
    }

    public void setEndDate(String endDate) {
        this.endDate = endDate;
    }
}
