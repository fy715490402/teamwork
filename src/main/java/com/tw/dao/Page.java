package com.tw.dao;

import java.util.ArrayList;
import java.util.List;

/**
 * 分页抽象
 */
public class Page<T> {

    private int pageSize;   //每页显示条数
    private int count;  //记录总数
    private int pageCurrent;    //当前页
    private List<T> list = new ArrayList<>();

    /**
     * 根据分页信息获得总页数
     * @return
     */
    public int getPageCount(){
        return (count-1)/pageSize+1 ;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public int getPageCurrent() {
        return pageCurrent;
    }

    public void setPageCurrent(int pageCurrent) {
        this.pageCurrent = pageCurrent;
    }

    public List<T> getList() {
        return list;
    }

    public void setList(List<T> list) {
        this.list = list;
    }
}
