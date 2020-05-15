package com.aishang.po;

import java.util.List;

/**
 * @author yc950710
 */
public class OrderExt extends Order {
    List<OrderItemExt> orderItemExts;
    /**
     * 商品详情判断
     */
    Integer details;

    public Integer getDetails() {
        return details;
    }

    public void setDetails(Integer details) {
        this.details = details;
    }

    public List<OrderItemExt> getOrderItemExts() {
        return orderItemExts;
    }

    public void setOrderItemExts(List<OrderItemExt> orderItemExts) {
        this.orderItemExts = orderItemExts;
    }

    @Override
    public String toString() {
        return "OrderExt{" +
                "orderItemExts=" + orderItemExts +
                ", details=" + details +
                '}';
    }
}
