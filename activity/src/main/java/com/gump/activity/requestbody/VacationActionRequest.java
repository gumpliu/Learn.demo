package com.gump.activity.requestbody;

/**
 * @program: com.yss.sofa.simpleflow
 * @description: VacationActionRequest 请求信息
 * @author: gumpliu
 * @create: 2019-06-06 08:57
 **/
public class VacationActionRequest extends CommentRequest {

    private String fcode;
    private String fname;
    private String fapplyuser;
    private String fapplytype;
    private String fbegindate;
    private String fenddate;
    private String fapplyreason;

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
