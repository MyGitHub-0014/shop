package com.aishang.po;

/**
 * 购物项实体类
 * @author yc950710
 */
public class CartItem {
    /**
     * 商品信息
     */
    private Product product;
    /**
     * 购买商品的数量
     */
    private Integer count;
    /**
     * 小计金额
     */
    private Double subTotal = 0.0;

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    public Double getSubTotal() {
        return product.getShopPrice()*count;
    }

    @Override
    public String toString() {
        return "CartItem{" +
                "product=" + product +
                ", count=" + count +
                ", subTotal=" + subTotal +
                '}';
    }
}
