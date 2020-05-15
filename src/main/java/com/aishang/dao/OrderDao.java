package com.aishang.dao;

import com.aishang.po.Order;
import com.aishang.po.OrderExt;
import com.aishang.po.OrderForPageBean;
import com.aishang.po.OrderItem;

import java.util.List;

/**
 * @author yc950710
 */
public interface OrderDao {

    /**
     * 添加订单
     * @param order
     */
    void addOrder(Order order);

    /**
     * 添加订单项
     * @param orderItem
     */
    void addOrderItem(OrderItem orderItem);

    /**
     * 修改订单状态
     * @param order
     */
    void changeOrderState(Order order);

    /**
     * 回显订单详情
     * @param oid
     */
    OrderExt getOrderDetail(Integer oid);

    /**
     * 查询我的订单列表
     * @param orderForPageBean
     * @return
     */
    List<OrderExt> getOrderExtsByUid(OrderForPageBean orderForPageBean);

    /**
     * 查询订单总数
     * @param orderForPageBean
     * @return
     */
    Integer getRowCount(OrderForPageBean orderForPageBean);
}
