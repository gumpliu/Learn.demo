package com.gump.activity.entity;

import java.io.Serializable;

/**
 * @program: com.yss.sofa.simpleflow
 * @description: user group联合主键
 * @author: gumpliu
 * @create: 2019-06-04 09:29
 **/
public class UserGroupMultiKeysClass implements Serializable {

    private String userId;

    private String groupId;

    public String getUserId() {
        return userId;
    }

    public UserGroupMultiKeysClass(){}

    public UserGroupMultiKeysClass(String userId, String groupId){
        this.userId = userId;
        this.groupId = groupId;
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

    @Override
    public int hashCode() {
        final int PRIME = 31;
        int result = 1;
        result = PRIME * result + ((userId == null) ? 0 : userId.hashCode());
        result = PRIME * result + ((groupId == null) ? 0 : groupId.hashCode());
        return result;
    }

    @Override
    public boolean equals(Object obj){
        if(this == obj){
            return true;
        }
        if(obj == null){
            return false;
        }
        if(getClass() != obj.getClass()){
            return false;
        }

        final UserGroupMultiKeysClass other = (UserGroupMultiKeysClass)obj;
        if(userId == null){
            if(other.userId != null){
                return false;
            }
        }else if(!userId.equals(other.userId)){
            return false;
        }
        if(groupId == null){
            if(other.groupId != null){
                return false;
            }
        }else if(!groupId.equals(other.groupId)){
            return false;
        }

        return true;
    }

}
