package com.aishang.po;

/**
 * @author yc950710
 */
public class OrderForPageBean extends PageBean<OrderExt> {
    private Integer uid;

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    @Override
    public String toString() {
        return "OrderForPageBean{" +
                "uid=" + uid +
                '}';
    }
}
