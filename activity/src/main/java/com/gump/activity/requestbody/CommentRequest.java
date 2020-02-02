package com.gump.activity.requestbody;

import org.activiti.rest.service.api.runtime.task.TaskActionRequest;

/**
 * @program: com.yss.sofa.simpleflow
 * @description: 添加评论信息
 * @author: gumpliu
 * @create: 2019-06-06 15:31
 **/
public class CommentRequest extends TaskActionRequest {

    //评论相关信息
    private String message;
    private boolean saveProcessInstanceId;


    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public boolean isSaveProcessInstanceId() {
        return saveProcessInstanceId;
    }

    public void setSaveProcessInstanceId(boolean saveProcessInstanceId) {
        this.saveProcessInstanceId = saveProcessInstanceId;
    }
}
