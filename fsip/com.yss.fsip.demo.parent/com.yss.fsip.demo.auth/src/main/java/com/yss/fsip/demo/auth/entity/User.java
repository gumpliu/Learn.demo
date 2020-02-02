package com.yss.fsip.demo.auth.entity;

import java.math.BigDecimal;
import java.util.Date;
import javax.persistence.*;

@Table(name = "T_USER")
public class User {
    @Id
    @Column(name = "FID")
    private BigDecimal fid;

    @Column(name = "FCODE")
    private String fcode;

    @Column(name = "FNAME")
    private String fname;

    @Column(name = "FGENDER")
    private Short fgender;

    @Column(name = "FTYPE")
    private Short ftype;

    @Column(name = "FLOGIN_CODE")
    private String floginCode;

    @Column(name = "FPWD")
    private String fpwd;

    @Column(name = "FACCOUNT_TYPE")
    private Short faccountType;

    @Column(name = "FORIGIN_TYPE")
    private Short foriginType;

    @Column(name = "FLOGIN_ACCOUNT_TYPE")
    private Short floginAccountType;

    @Column(name = "FBIRTHDAY")
    private Date fbirthday;

    @Column(name = "FEMAIL")
    private String femail;

    @Column(name = "FJOB")
    private String fjob;

    @Column(name = "FPOSTAL_ADDRESS")
    private String fpostalAddress;

    @Column(name = "FZIP_CODE")
    private String fzipCode;

    @Column(name = "FTELEPHONE")
    private String ftelephone;

    @Column(name = "FMOBILE")
    private String fmobile;

    @Column(name = "FREMARK")
    private String fremark;

    @Column(name = "FLOCK_STATE")
    private Short flockState;

    @Column(name = "FORIG_STATE")
    private Short forigState;

    @Column(name = "FSTART_DATE")
    private Date fstartDate;

    @Column(name = "FEND_DATE")
    private Date fendDate;

    @Column(name = "FCREATOR_ID")
    private BigDecimal fcreatorId;

    @Column(name = "FCREATE_TIME")
    private Date fcreateTime;

    @Column(name = "FLAST_EDITOR_ID")
    private BigDecimal flastEditorId;

    @Column(name = "FLAST_EDIT_TIME")
    private Date flastEditTime;

    @Column(name = "FDELETOR_ID")
    private BigDecimal fdeletorId;

    @Column(name = "FDELETE_TIME")
    private Date fdeleteTime;

    @Column(name = "FDELETE_STATE")
    private Short fdeleteState;

    @Column(name = "FCHECK_STATE")
    private Short fcheckState;

    @Column(name = "FCHECKER_ID")
    private BigDecimal fcheckerId;

    @Column(name = "FCHECK_TIME")
    private Date fcheckTime;

    @Column(name = "FPWD_EFF_DATE")
    private Date fpwdEffDate;

    @Column(name = "FACCOUNT_STATE")
    private Short faccountState;

    @Column(name = "FNAMEPY")
    private String fnamepy;

    @Column(name = "FSPECIAL_USER_STATE")
    private Short fspecialUserState;

    /**
     * @return FID
     */
    public BigDecimal getFid() {
        return fid;
    }

    /**
     * @param fid
     */
    public void setFid(BigDecimal fid) {
        this.fid = fid;
    }

    /**
     * @return FCODE
     */
    public String getFcode() {
        return fcode;
    }

    /**
     * @param fcode
     */
    public void setFcode(String fcode) {
        this.fcode = fcode;
    }

    /**
     * @return FNAME
     */
    public String getFname() {
        return fname;
    }

    /**
     * @param fname
     */
    public void setFname(String fname) {
        this.fname = fname;
    }

    /**
     * @return FGENDER
     */
    public Short getFgender() {
        return fgender;
    }

    /**
     * @param fgender
     */
    public void setFgender(Short fgender) {
        this.fgender = fgender;
    }

    /**
     * @return FTYPE
     */
    public Short getFtype() {
        return ftype;
    }

    /**
     * @param ftype
     */
    public void setFtype(Short ftype) {
        this.ftype = ftype;
    }

    /**
     * @return FLOGIN_CODE
     */
    public String getFloginCode() {
        return floginCode;
    }

    /**
     * @param floginCode
     */
    public void setFloginCode(String floginCode) {
        this.floginCode = floginCode;
    }

    /**
     * @return FPWD
     */
    public String getFpwd() {
        return fpwd;
    }

    /**
     * @param fpwd
     */
    public void setFpwd(String fpwd) {
        this.fpwd = fpwd;
    }

    /**
     * @return FACCOUNT_TYPE
     */
    public Short getFaccountType() {
        return faccountType;
    }

    /**
     * @param faccountType
     */
    public void setFaccountType(Short faccountType) {
        this.faccountType = faccountType;
    }

    /**
     * @return FORIGIN_TYPE
     */
    public Short getForiginType() {
        return foriginType;
    }

    /**
     * @param foriginType
     */
    public void setForiginType(Short foriginType) {
        this.foriginType = foriginType;
    }

    /**
     * @return FLOGIN_ACCOUNT_TYPE
     */
    public Short getFloginAccountType() {
        return floginAccountType;
    }

    /**
     * @param floginAccountType
     */
    public void setFloginAccountType(Short floginAccountType) {
        this.floginAccountType = floginAccountType;
    }

    /**
     * @return FBIRTHDAY
     */
    public Date getFbirthday() {
        return fbirthday;
    }

    /**
     * @param fbirthday
     */
    public void setFbirthday(Date fbirthday) {
        this.fbirthday = fbirthday;
    }

    /**
     * @return FEMAIL
     */
    public String getFemail() {
        return femail;
    }

    /**
     * @param femail
     */
    public void setFemail(String femail) {
        this.femail = femail;
    }

    /**
     * @return FJOB
     */
    public String getFjob() {
        return fjob;
    }

    /**
     * @param fjob
     */
    public void setFjob(String fjob) {
        this.fjob = fjob;
    }

    /**
     * @return FPOSTAL_ADDRESS
     */
    public String getFpostalAddress() {
        return fpostalAddress;
    }

    /**
     * @param fpostalAddress
     */
    public void setFpostalAddress(String fpostalAddress) {
        this.fpostalAddress = fpostalAddress;
    }

    /**
     * @return FZIP_CODE
     */
    public String getFzipCode() {
        return fzipCode;
    }

    /**
     * @param fzipCode
     */
    public void setFzipCode(String fzipCode) {
        this.fzipCode = fzipCode;
    }

    /**
     * @return FTELEPHONE
     */
    public String getFtelephone() {
        return ftelephone;
    }

    /**
     * @param ftelephone
     */
    public void setFtelephone(String ftelephone) {
        this.ftelephone = ftelephone;
    }

    /**
     * @return FMOBILE
     */
    public String getFmobile() {
        return fmobile;
    }

    /**
     * @param fmobile
     */
    public void setFmobile(String fmobile) {
        this.fmobile = fmobile;
    }

    /**
     * @return FREMARK
     */
    public String getFremark() {
        return fremark;
    }

    /**
     * @param fremark
     */
    public void setFremark(String fremark) {
        this.fremark = fremark;
    }

    /**
     * @return FLOCK_STATE
     */
    public Short getFlockState() {
        return flockState;
    }

    /**
     * @param flockState
     */
    public void setFlockState(Short flockState) {
        this.flockState = flockState;
    }

    /**
     * @return FORIG_STATE
     */
    public Short getForigState() {
        return forigState;
    }

    /**
     * @param forigState
     */
    public void setForigState(Short forigState) {
        this.forigState = forigState;
    }

    /**
     * @return FSTART_DATE
     */
    public Date getFstartDate() {
        return fstartDate;
    }

    /**
     * @param fstartDate
     */
    public void setFstartDate(Date fstartDate) {
        this.fstartDate = fstartDate;
    }

    /**
     * @return FEND_DATE
     */
    public Date getFendDate() {
        return fendDate;
    }

    /**
     * @param fendDate
     */
    public void setFendDate(Date fendDate) {
        this.fendDate = fendDate;
    }

    /**
     * @return FCREATOR_ID
     */
    public BigDecimal getFcreatorId() {
        return fcreatorId;
    }

    /**
     * @param fcreatorId
     */
    public void setFcreatorId(BigDecimal fcreatorId) {
        this.fcreatorId = fcreatorId;
    }

    /**
     * @return FCREATE_TIME
     */
    public Date getFcreateTime() {
        return fcreateTime;
    }

    /**
     * @param fcreateTime
     */
    public void setFcreateTime(Date fcreateTime) {
        this.fcreateTime = fcreateTime;
    }

    /**
     * @return FLAST_EDITOR_ID
     */
    public BigDecimal getFlastEditorId() {
        return flastEditorId;
    }

    /**
     * @param flastEditorId
     */
    public void setFlastEditorId(BigDecimal flastEditorId) {
        this.flastEditorId = flastEditorId;
    }

    /**
     * @return FLAST_EDIT_TIME
     */
    public Date getFlastEditTime() {
        return flastEditTime;
    }

    /**
     * @param flastEditTime
     */
    public void setFlastEditTime(Date flastEditTime) {
        this.flastEditTime = flastEditTime;
    }

    /**
     * @return FDELETOR_ID
     */
    public BigDecimal getFdeletorId() {
        return fdeletorId;
    }

    /**
     * @param fdeletorId
     */
    public void setFdeletorId(BigDecimal fdeletorId) {
        this.fdeletorId = fdeletorId;
    }

    /**
     * @return FDELETE_TIME
     */
    public Date getFdeleteTime() {
        return fdeleteTime;
    }

    /**
     * @param fdeleteTime
     */
    public void setFdeleteTime(Date fdeleteTime) {
        this.fdeleteTime = fdeleteTime;
    }

    /**
     * @return FDELETE_STATE
     */
    public Short getFdeleteState() {
        return fdeleteState;
    }

    /**
     * @param fdeleteState
     */
    public void setFdeleteState(Short fdeleteState) {
        this.fdeleteState = fdeleteState;
    }

    /**
     * @return FCHECK_STATE
     */
    public Short getFcheckState() {
        return fcheckState;
    }

    /**
     * @param fcheckState
     */
    public void setFcheckState(Short fcheckState) {
        this.fcheckState = fcheckState;
    }

    /**
     * @return FCHECKER_ID
     */
    public BigDecimal getFcheckerId() {
        return fcheckerId;
    }

    /**
     * @param fcheckerId
     */
    public void setFcheckerId(BigDecimal fcheckerId) {
        this.fcheckerId = fcheckerId;
    }

    /**
     * @return FCHECK_TIME
     */
    public Date getFcheckTime() {
        return fcheckTime;
    }

    /**
     * @param fcheckTime
     */
    public void setFcheckTime(Date fcheckTime) {
        this.fcheckTime = fcheckTime;
    }

    /**
     * @return FPWD_EFF_DATE
     */
    public Date getFpwdEffDate() {
        return fpwdEffDate;
    }

    /**
     * @param fpwdEffDate
     */
    public void setFpwdEffDate(Date fpwdEffDate) {
        this.fpwdEffDate = fpwdEffDate;
    }

    /**
     * @return FACCOUNT_STATE
     */
    public Short getFaccountState() {
        return faccountState;
    }

    /**
     * @param faccountState
     */
    public void setFaccountState(Short faccountState) {
        this.faccountState = faccountState;
    }

    /**
     * @return FNAMEPY
     */
    public String getFnamepy() {
        return fnamepy;
    }

    /**
     * @param fnamepy
     */
    public void setFnamepy(String fnamepy) {
        this.fnamepy = fnamepy;
    }

    /**
     * @return FSPECIAL_USER_STATE
     */
    public Short getFspecialUserState() {
        return fspecialUserState;
    }

    /**
     * @param fspecialUserState
     */
    public void setFspecialUserState(Short fspecialUserState) {
        this.fspecialUserState = fspecialUserState;
    }
}