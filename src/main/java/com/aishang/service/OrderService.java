package com.aishang.service;

import com.aishang.po.Cart;
import com.aishang.po.Order;
import com.aishang.po.OrderExt;
import com.aishang.po.OrderForPageBean;

/**
 * @author yc950710
 */
public interface OrderService {

    /**
     * 添加订单到数据库
     * @param order
     * @param cart
     * @return
     */
    Integer addOrder(Order order, Cart cart);

    /**
     * 支付校验
     * @param order
     */
    void changeOrderState(Order order);

    /**
     * 回显订单详情
     * @param oid
     */
    OrderExt getOrderDetail(Integer oid);

    /**
     * 根据用户id查询订单列表
     * @param orderForPageBean
     * @return
     */
    OrderForPageBean getOrderExtsByUid(OrderForPageBean orderForPageBean);
}
