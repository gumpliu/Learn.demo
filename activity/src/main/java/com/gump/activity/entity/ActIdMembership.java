package com.gump.activity.entity;

import javax.persistence.*;
import java.io.Serializable;

/**
 * @program: com.yss.sofa.simpleflow
 * @description: act_id_membership entity
 * @author: gumpliu
 * @create: 2019-06-03 17:22
 **/
@Entity
@Table(name = "act_id_membership")
@IdClass(UserGroupMultiKeysClass.class)
public class ActIdMembership implements Serializable {

    @Id
    @Column(name = "USER_ID_")
    private String userId;

    @Id
    @Column(name = "GROUP_ID_")
    private String groupId;


    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getGroupId() {
        return groupId;
    }

    public void setGroupId(String groupId) {
        this.groupId = groupId;
    }
}
