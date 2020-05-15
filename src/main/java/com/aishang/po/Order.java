package com.aishang.po;

import java.util.Date;

/**
 * 订单实体
 * @author yc950710
 */
public class Order {
    private Integer oid;
    private Double total=0.0;
    private Date orderTime;
    private Integer state=0;
    private String name;
    private String phone;
    private String addr;
    private Integer uid;

    public Double getTotal() {
        return total;
    }

    public void setTotal(Double total) {
        this.total = total;
    }

    public Integer getOid() {
        return oid;
    }

    public void setOid(Integer oid) {
        this.oid = oid;
    }

    public Date getOrderTime() {
        return orderTime;
    }

    public void setOrderTime(Date orderTime) {
        this.orderTime = orderTime;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddr() {
        return addr;
    }

    public void setAddr(String addr) {
        this.addr = addr;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    @Override
    public String toString() {
        return "Order{" +
                "oid=" + oid +
                ", total=" + total +
                ", orderTime=" + orderTime +
                ", state=" + state +
                ", name='" + name + '\'' +
                ", phone='" + phone + '\'' +
                ", addr='" + addr + '\'' +
                ", uid=" + uid +
                '}';
    }
}
