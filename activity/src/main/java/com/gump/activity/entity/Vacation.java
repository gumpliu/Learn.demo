package com.gump.activity.entity;

import javax.persistence.*;
/**
 * @program: com.yss.sofa.simpleflow
 * @description: 请假单 流程业务表
 * @author: gumpliu
 * @create: 2019-06-06 13:18
 **/
@Entity
@Table(name = "t_vacation")
public class Vacation {

    @Id
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    private Long id;
    private String taskId;
    private String fcode;
    private String fname;
    private String fapplyuser;
    private String fapplytype;
    private String fbegindate;
    private String fenddate;
    private String fapplyreason;

    public Vacation(){}
    public Vacation(String taskId, String fcode, String fname, String fapplyuser,
                    String fapplytype, String fbegindate, String fenddate, String fapplyreason){
        this.taskId = taskId;
        this.fapplyreason = fapplyreason;
        this.fapplytype = fapplytype;
        this.fcode = fcode;
        this.fname = fname;
        this.fbegindate = fbegindate;
        this.fenddate = fenddate;
        this.fapplyuser = fapplyuser;
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
