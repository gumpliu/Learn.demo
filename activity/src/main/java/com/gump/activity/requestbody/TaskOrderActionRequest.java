package com.gump.activity.requestbody;

/**
 * @program: com.yss.sofa.simpleflow
 * @description: TaskOrderAction 请求信息
 * @author: gumpliu
 * @create: 2019-06-06 08:57
 **/
public class TaskOrderActionRequest extends CommentRequest {

    /**
     * 订单名称
     */
    private String orderName;

    /**
     * 订单创建人
     */
    private String creater;

    public String getOrderName() {
        return orderName;
    }

    public void setOrderName(String orderName) {
        this.orderName = orderName;
    }

    public String getCreater() {
        return creater;
    }

    public void setCreater(String creater) {
        this.creater = creater;
    }
}
