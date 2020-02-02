package com.gump.activity.vo;

/**
 * @program: com.yss.sofa.simpleflow
 * @description: vacation 表单
 * @author: gumpliu
 * @create: 2019-06-06 13:28
 **/
public class VacationVo {
	
    private String taskId;//任务id
    private String createTaskDate;//任务创建时间
    private String endDate;
    private String assigenee; //认领人
    private String taskName;//任务名称
    private String procInstId;//实例id
    private String procDefId;//流程定义id
    private String proDefName;//流程定义名称
    private String fcode;
    private String fname;
    private String fapplyuser;
    private String fapplytype;
    private String fbegindate;
    private String fenddate;
    private String fapplyreason;


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

    public String getEndDate() {
        return endDate;
    }

    public void setEndDate(String endDate) {
        this.endDate = endDate;
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

    public String getFcode() {
        return fcode;
    }

    public void setFcode(String fcode) {
        this.fcode = fcode;
    }

    public String getFname() {
        return fname;
    }

    public void setFname(String fname) {
        this.fname = fname;
    }

    public String getFapplyuser() {
        return fapplyuser;
    }

    public void setFapplyuser(String fapplyuser) {
        this.fapplyuser = fapplyuser;
    }

    public String getFapplytype() {
        return fapplytype;
    }

    public void setFapplytype(String fapplytype) {
        this.fapplytype = fapplytype;
    }

    public String getFbegindate() {
        return fbegindate;
    }

    public void setFbegindate(String fbegindate) {
        this.fbegindate = fbegindate;
    }

    public String getFenddate() {
        return fenddate;
    }

    public void setFenddate(String fenddate) {
        this.fenddate = fenddate;
    }

    public String getFapplyreason() {
        return fapplyreason;
    }

    public void setFapplyreason(String fapplyreason) {
        this.fapplyreason = fapplyreason;
    }
}
