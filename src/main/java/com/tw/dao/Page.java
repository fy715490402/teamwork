package com.tw.dao;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * 分页抽象
 */
public class Page<T> {

    private static final int DEFAULT_PAGE_SIZE=20;
    private int pageSize;   //每页显示条数
    private int count;  //记录总数
    private int pageNo; //页码
    private int pageCount; //总共多少页
    private List<T> list;

    public Page() {
        this(DEFAULT_PAGE_SIZE,0,0,new ArrayList<>());
    }

    public Page(int pageSize, int count, int pageNo, List<T> list) {
        this.pageSize = pageSize;
        this.count = count;
        this.pageNo = pageNo;
        this.list = list;
    }

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

    public int getPageNo() {
        return pageNo;
    }

    public void setPageNo(int pageNo) {
        this.pageNo = pageNo;
    }

    public List<T> getList() {
        return list;
    }

    public void setList(List<T> list) {
        this.list = list;
    }
}
