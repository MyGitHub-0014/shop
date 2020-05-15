package com.aishang.po;

/**
 * @author yc950710
 */
public class OrderItemExt extends OrderItem {
    private Product product;

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    @Override
    public String toString() {
        return "OrderItemExt{" +
                "product=" + product +
                '}';
    }
}
