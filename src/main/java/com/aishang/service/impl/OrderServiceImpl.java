package com.aishang.service.impl;

import com.aishang.dao.OrderDao;
import com.aishang.po.*;
import com.aishang.service.OrderService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

/**
 * @author yc950710
 */
@Service
public class OrderServiceImpl implements OrderService {
    @Resource
    OrderDao orderDao;
    @Resource
    HttpSession session;

    /**
     * 添加订单到数据库
     * @param order
     * @param cart
     * @return
     */
    @Override
    public Integer addOrder(Order order, Cart cart) {
        //添加订单
        order.setOrderTime(new Date());
        order.setTotal(cart.getTotal());
        //获取登陆人id
        User user = (User)session.getAttribute("user");
        order.setUid(user.getUid());
        orderDao.addOrder(order);
        //添加订单项
        for (CartItem cartItem : cart.getCartItems()) {
            OrderItem orderItem = new OrderItem();
            orderItem.setCount(cartItem.getCount());
            orderItem.setPid(cartItem.getProduct().getPid());
            orderItem.setSubTotal(cartItem.getSubTotal());
            orderItem.setOid(order.getOid());
            orderDao.addOrderItem(orderItem);
        }
        //生成待支付订单后，清空购物车
        cart.clear();
        return order.getOid();
    }

    /**
     * 支付校验
     * @param order
     */
    @Override
    public void changeOrderState(Order order) {
        orderDao.changeOrderState(order);
    }

    /**
     * 回显订单详情
     * @param oid
     */
    @Override
    public OrderExt getOrderDetail(Integer oid) {
        return orderDao.getOrderDetail(oid);
    }

    /**
     * 根据用户id查询订单列表
     * @param orderForPageBean
     * @return
     */
    @Override
    public OrderForPageBean getOrderExtsByUid(OrderForPageBean orderForPageBean) {
        // 查询我的订单列表
        List<OrderExt> orderExtList = orderDao.getOrderExtsByUid(orderForPageBean);
        // 查询订单总数
        Integer rowCount = orderDao.getRowCount(orderForPageBean);
        // 封装参数
        orderForPageBean.setList(orderExtList);
        orderForPageBean.setRowCount(rowCount);
        // 返回参数
        return orderForPageBean;
    }

}
