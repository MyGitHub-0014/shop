package com.aishang.po;

import java.util.Collection;
import java.util.LinkedHashMap;
import java.util.Map;

/**
 * 购物车实体类
 * @author yc950710
 */
public class Cart {
    // 购物项集合 Map<pid,CartItem>
    private Map<Integer,CartItem> cartItems = new LinkedHashMap<>();
    // 总计价格
    private Double total=0.0;

    /**
     * 获取购物项列表集合
     * @return
     */
    public Collection<CartItem> getCartItems() {
        return cartItems.values();
    }

    public Double getTotal() {
        return total;
    }

    @Override
    public String toString() {
        return "Cart{" +
                "cartItems=" + cartItems +
                ", total=" + total +
                '}';
    }

    /**
     * 添加购物项
     * @param cartItem
     */
    public void addCartItem(CartItem cartItem) {
        Integer pid = cartItem.getProduct().getPid();
        if(!cartItems.containsKey(pid)){
        // 购物车中不存在该购物项，直接添加
            cartItems.put(pid,cartItem);
        }else{
        // 购物车中存在该购物项，数量累加
            CartItem old = cartItems.get(pid);
            old.setCount(old.getCount()+cartItem.getCount());
        }
        total = total + cartItem.getSubTotal();
    }

    /**
     * 更改购物项中商品数量
     * @param pid
     * @param count
     */
    public void chageCount(Integer pid, Integer count) {
        CartItem cartItem = cartItems.get(pid);
        total=total-cartItem.getSubTotal();
        cartItem.setCount(count);
        total=total+cartItem.getSubTotal();
        //维护总计
    }

    /**
     * 删除购物项
     * @param pid
     */
    public void delCartItem(Integer pid) {
        CartItem remove = cartItems.remove(pid);
        //减去小计
        total=total-remove.getSubTotal();
    }

    /**
     * 清空购物车
     */
    public void clear() {
        cartItems.clear();
        total = 0.0;
    }
}
