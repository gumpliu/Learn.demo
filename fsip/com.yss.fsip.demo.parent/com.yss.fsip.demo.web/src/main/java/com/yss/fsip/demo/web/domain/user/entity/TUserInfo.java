package com.yss.fsip.demo.web.domain.user.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "t_user_info")
public class TUserInfo {
    @Id
    private String id;

    @Column(name = "user_id")
    private Long userId;

    private String adress;

    private String phone;

    /**
     * @return id
     */
    public String getId() {
        return id;
    }

    /**
     * @param id
     */
    public void setId(String id) {
        this.id = id;
    }

    /**
     * @return user_id
     */
    public Long getUserId() {
        return userId;
    }

    /**
     * @param userId
     */
    public void setUserId(Long userId) {
        this.userId = userId;
    }

    /**
     * @return adress
     */
    public String getAdress() {
        return adress;
    }

    /**
     * @param adress
     */
    public void setAdress(String adress) {
        this.adress = adress;
    }

    /**
     * @return phone
     */
    public String getPhone() {
        return phone;
    }

    /**
     * @param phone
     */
    public void setPhone(String phone) {
        this.phone = phone;
    }
}