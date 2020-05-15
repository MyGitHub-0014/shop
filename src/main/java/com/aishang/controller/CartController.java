package com.aishang.controller;

import com.aishang.po.Cart;
import com.aishang.po.CartItem;
import com.aishang.po.Product;
import com.aishang.service.ProductService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

/**
 * @author yc950710
 */
@RequestMapping("/cart")
@Controller
public class CartController {
    @Resource
    ProductService productService;
    @Resource
    HttpSession session;

    /**
     * 跳转购物车页面
     */
    @RequestMapping("/toCart")
    public String toCart(){
        return "cart";
    }

    /**
     * 添加购物项到购物车
     * @return
     */
    @RequestMapping("/addCart")
    @ResponseBody
    public String addCart(Integer pid,Integer count){
        //封装购物项
        CartItem cartItem = new CartItem();
        cartItem.setCount(count);
        Product product = productService.getProductByPid(pid);
        cartItem.setProduct(product);
        //添加购物项到购物车
        Cart cart = (Cart) session.getAttribute("cart");
        if(cart!=null){
            // 改用户有购物车，直接用
            cart.addCartItem(cartItem);
        }else{
            // 改用户没有购物车
            cart = new Cart();
            cart.addCartItem(cartItem);
            session.setAttribute("cart",cart);
        }
        return "success";
    }

    /**
     * 更改商品数量
     */
    @RequestMapping("/changeCount")
    @ResponseBody
    public String changeCount(Integer pid,Integer count){
        //获取购物车
        Cart cart = (Cart) session.getAttribute("cart");
        if(cart!=null){
            cart.chageCount(pid,count);
        }
        return cart.getTotal().toString();
    }

    /**
     * 删除购物项
     */
    @RequestMapping("/delCartItem")
    @ResponseBody
    public String delCartItem(Integer pid){
        Cart cart = (Cart) session.getAttribute("cart");
        if(cart!=null){
            cart.delCartItem(pid);
        }
        return cart.getTotal().toString();
    }

    /**
     * 清空购物车
     */
    @RequestMapping("/clear")
    @ResponseBody
    public String clear(){
        Cart cart = (Cart) session.getAttribute("cart");
        if(cart!=null){
            cart.clear();
        }
        return "0.0";
    }
}
