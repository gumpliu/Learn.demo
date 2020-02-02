package com.gump.activity.requestbody;

/**
 * @program: com.yss.sofa.simpleflow
 * @description: 分页
 * @author: gumpliu
 * @create: 2019-06-05 14:55
 **/
public class Page {

    private int pageNumber;
    private int pageSize;

    public Page(int pageNumber, int pageSize){
        this.pageNumber = pageNumber;
        this.pageSize = pageSize;
    }

    public int getPageNumberSize(){
        return (this.pageNumber - 1) * pageSize;
    }

    public int getPageNumber() {
        return pageNumber;
    }

    public void setPageNumber(int pageNumber) {
        this.pageNumber = pageNumber;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }
}
