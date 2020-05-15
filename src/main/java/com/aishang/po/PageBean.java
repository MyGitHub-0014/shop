package com.aishang.po;

import java.util.List;

/**
 * 分页
 * @author yc950710
 */
public class PageBean<T> {
    /**
     * 复合查询分页的结果集,商品集合
     */
    private List<T> list;
    private Integer pageNow=1;
    private Integer pageSize;
    private Integer rowCount;
    private Integer pageCount;
    /**
     * 分页的起始记录数
     */
    private Integer start;

    public List<T> getList() {
        return list;
    }

    public void setList(List<T> list) {
        this.list = list;
    }

    public Integer getPageNow() {
        return pageNow;
    }

    public void setPageNow(Integer pageNow) {
        this.pageNow = pageNow;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }

    public Integer getRowCount() {
        return rowCount;
    }

    public void setRowCount(Integer rowCount) {
        this.rowCount = rowCount;
    }

    public Integer getPageCount() {
        if(rowCount%pageSize==0){
            pageCount=rowCount/pageSize;
        }else{
            pageCount=rowCount/pageSize+1;
        }
        return pageCount;
    }

    public Integer getStart() {
        start = (pageNow-1)*pageSize;
        return start;
    }

    @Override
    public String toString() {
        return "PageBean{" +
                "list=" + list +
                ", pageNow=" + pageNow +
                ", pageSize=" + pageSize +
                ", rowCount=" + rowCount +
                ", pageCount=" + pageCount +
                ", start=" + start +
                '}';
    }
}
