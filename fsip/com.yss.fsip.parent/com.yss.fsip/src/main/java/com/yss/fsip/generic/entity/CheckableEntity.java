package com.yss.fsip.generic.entity;

import com.yss.fsip.constants.CheckableConstants;

import javax.persistence.Column;
import javax.persistence.MappedSuperclass;
import java.util.Date;

@MappedSuperclass
public class CheckableEntity extends BaseEntity{

    @Column(name = CheckableConstants.FCHECKER_ID)
    private String checkerId;
    @Column(name = CheckableConstants.FCHECK_STATE, nullable = false)
    private Boolean checkState;
    @Column(name = CheckableConstants.FCHECK_TIME)
    private Date checkTime;

    public String getCheckerId() {
        return checkerId;
    }

    public void setCheckerId(String checkerId) {
        this.checkerId = checkerId;
    }

    public Boolean getCheckState() {
        return checkState;
    }

    public void setCheckState(Boolean checkState) {
        this.checkState = checkState;
    }

    public Date getCheckTime() {
        return checkTime;
    }

    public void setCheckTime(Date checkTime) {
        this.checkTime = checkTime;
    }
}
