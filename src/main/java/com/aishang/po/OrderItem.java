package com.aishang.po;

/**
 * 订单项实体类
 * @author yc950710
 */
public class OrderItem {
    private Integer itemId;
    private Integer count;
    private Double subTotal=0.0;
    private Integer pid;
    private Integer oid;

    public Integer getItemId() {
        return itemId;
    }

    public void setItemId(Integer itemId) {
        this.itemId = itemId;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    public Double getSubTotal() {
        return subTotal;
    }

    public void setSubTotal(Double subTotal) {
        this.subTotal = subTotal;
    }

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public Integer getOid() {
        return oid;
    }

    public void setOid(Integer oid) {
        this.oid = oid;
    }

    @Override
    public String toString() {
        return "OrderItem{" +
                "itemId=" + itemId +
                ", count=" + count +
                ", subTotal=" + subTotal +
                ", pid=" + pid +
                ", oid=" + oid +
                '}';
    }
}
