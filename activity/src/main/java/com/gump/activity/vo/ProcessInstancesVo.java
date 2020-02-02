package com.gump.activity.vo;

/**
 * @program: com.yss.sofa.simpleflow
 * @description: 流程实例列表VO
 * @author: gumpliu
 * @create: 2019-06-04 14:57
 **/
public class ProcessInstancesVo {

    private String procInstId;//流程实例id
    private String procDefId;//流程定义id
    private String processName;//流程定义名称
    private String startTime;//流程实例开始时间
    private String endTime;//流程实例结束时间
    private String startUserId;//流程实例开始人
    private String isActive;//流程实例是否存活
    private String suspensionState;//挂起状态 1-激活，2-挂起

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

    public String getProcessName() {
        return processName;
    }

    public void setProcessName(String processName) {
        this.processName = processName;
    }

    public String getStartTime() {
        return startTime;
    }

    public void setStartTime(String startTime) {
        this.startTime = startTime;
    }

    public String getEndTime() {
        return endTime;
    }

    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }

    public String getStartUserId() {
        return startUserId;
    }

    public void setStartUserId(String startUserId) {
        this.startUserId = startUserId;
    }

    public String getIsActive() {
        return isActive;
    }

    public void setIsActive(String isActive) {
        this.isActive = isActive;
    }

    public String getSuspensionState() {
        return suspensionState;
    }

    public void setSuspensionState(String suspensionState) {
        this.suspensionState = suspensionState;
    }
}
