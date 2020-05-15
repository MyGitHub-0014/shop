package com.aishang.controller;

import com.aishang.po.*;
import com.aishang.service.OrderService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

/**
 * 订单控制器
 * @author yc950710
 */
@Controller
@RequestMapping("/order")
public class OrderController {
    @Resource
    OrderService orderService;
    @Resource
    HttpSession session;

    /**
     * 跳转到确认订单界面
     * @return
     */
    @RequestMapping("/toConfirmOrder")
    public String toConfirmOrder(){
        //校验登录
        User user = (User)session.getAttribute("user");
        if(user==null){
            return "login";
        }else{
            return "confirmOrder";
        }
    }

    /**
     * 跳转到支付页面
     * @return
     */
    @RequestMapping("toPay")
    public String toPay(Order order, Model model){
        //获取购物车
        Cart cart = (Cart)session.getAttribute("cart");
        //生成待支付订单
        Integer oid = orderService.addOrder(order,cart);
        model.addAttribute("oid",oid);
        return "pay";
    }

    /**
     * 从我的订单跳转到支付页面
     * @return
     */
    @RequestMapping("toPays")
    public String toPays(Integer oid,Model model){
        model.addAttribute("oid",oid);
        return "pay";
    }

    /**
     * 支付校验
     */
    @RequestMapping("/toPaySuccess")
    public String toPaySuccess(Order order,Model model){
        order.setState(1);
        //改为已支付状态
        orderService.changeOrderState(order);
        //回显订单详情信息
        OrderExt orderExt = orderService.getOrderDetail(order.getOid());
        model.addAttribute("orderExt",orderExt);
        return "paySuccess";
    }

    /**
     * 跳转到我的订单界面
     */
    @RequestMapping("/toMyOrders")
    public String toMyOrders(OrderForPageBean orderForPageBean,Model model){
        orderForPageBean.setPageSize(3);
        // 根据用户id查询订单列表
        OrderForPageBean result = orderService.getOrderExtsByUid(orderForPageBean);
        model.addAttribute("orderForPageBean",result);
        return "myOrders";
    }

    /**
     * 修改state
     */
    @RequestMapping("/updateMyOrders")
    public String updateMyOrders(OrderForPageBean orderForPageBean,Order order){
        User user = (User)session.getAttribute("user");
        orderService.changeOrderState(order);
        return "redirect:/order/toMyOrders.do?uid="+user.getUid()+"&pageNow="+orderForPageBean.getPageNow()+"";
    }

    /**
     * 确认收货
     */
    @RequestMapping("/toConfirmReceipt")
    public String toConfirmReceipt(OrderExt order,Model model){
        System.out.println(order.getOid());
        OrderExt orderExt = orderService.getOrderDetail(order.getOid());
        model.addAttribute("orderExt",orderExt);
        model.addAttribute("order",order);
        return "confirmReceipt";
    }

}
