package com.yss.fsip.demo.web.domain.user.entity;

import javax.persistence.*;
import java.util.Arrays;
import java.util.Objects;

/**
 * @Author: gumpLiu
 * @Date: 2019-11-29 11:54
 */
@Entity
@Table(name = "act_id_info", schema = "test", catalog = "")
public class ActIdInfoEntity {
    private String id;
    private Integer rev;
    private String userId;
    private String type;
    private String key;
    private String value;
    private byte[] password;
    private String parentId;

    @Id
    @Column(name = "ID_", nullable = false, length = 64)
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    @Basic
    @Column(name = "REV_", nullable = true)
    public Integer getRev() {
        return rev;
    }

    public void setRev(Integer rev) {
        this.rev = rev;
    }

    @Basic
    @Column(name = "USER_ID_", nullable = true, length = 64)
    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    @Basic
    @Column(name = "TYPE_", nullable = true, length = 64)
    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    @Basic
    @Column(name = "KEY_", nullable = true, length = 255)
    public String getKey() {
        return key;
    }

    public void setKey(String key) {
        this.key = key;
    }

    @Basic
    @Column(name = "VALUE_", nullable = true, length = 255)
    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    @Basic
    @Column(name = "PASSWORD_", nullable = true)
    public byte[] getPassword() {
        return password;
    }

    public void setPassword(byte[] password) {
        this.password = password;
    }

    @Basic
    @Column(name = "PARENT_ID_", nullable = true, length = 255)
    public String getParentId() {
        return parentId;
    }

    public void setParentId(String parentId) {
        this.parentId = parentId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        ActIdInfoEntity that = (ActIdInfoEntity) o;
        return Objects.equals(id, that.id) &&
                Objects.equals(rev, that.rev) &&
                Objects.equals(userId, that.userId) &&
                Objects.equals(type, that.type) &&
                Objects.equals(key, that.key) &&
                Objects.equals(value, that.value) &&
                Arrays.equals(password, that.password) &&
                Objects.equals(parentId, that.parentId);
    }

    @Override
    public int hashCode() {
        int result = Objects.hash(id, rev, userId, type, key, value, parentId);
        result = 31 * result + Arrays.hashCode(password);
        return result;
    }
}
