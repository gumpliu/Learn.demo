package com.gump.activity.bean;

import java.util.Collection;

/**
 * 分页数据对象，用于转换为json的中间对象
 * @see
 * @author jiangjin
 * @version 1.0, 2011-7-19
 * @since 1.0, 2011-7-19
 */
public class PageVo<T> {

    private int startRow;

    private int rowCount;

    private int total;

    private Collection<T> data = null;

    public PageVo() {
    }

    public PageVo(int startRow, int rowCount) {
        this.startRow = startRow;
        this.rowCount = rowCount;
    }

    public PageVo(Collection<T> data) {
        this.total = data.size();
        this.data = data;
    }

    public PageVo(int total, Collection<T> data) {
        this.total = total;
        this.data = data;
    }

    /**
     * 数据总行数
     * @return 数据总行数
     */
    public int getTotal() {
        return total;
    }

    /**
     * 数据总行数
     * @param total 数据总行数
     */
    public void setTotal(int total) {
        this.total = total;
    }

    /**
     * 当前页数据
     * @return 当前页数据
     */
    public Collection<T> getData() {
        return data;
    }

    /**
     * 当前页数据
     * @param data 当前页数据
     */
    public void setData(Collection<T> data) {
        this.data = data;
    }

    public int getStartRow() {
        return startRow;
    }

    public void setStartRow(int startRow) {
        this.startRow = startRow;
    }

    public int getRowCount() {
        return rowCount;
    }

    public void setRowCount(int rowCount) {
        this.rowCount = rowCount;
    }

}
