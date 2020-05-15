package com.aishang.dao;

import com.aishang.po.Product;
import com.aishang.po.ProductForPageBean;

import java.util.List;

/**
 * 商品dao
 * @author yc950710
 */
public interface ProductDao {
    /**
     * 查询商品
     * @param csid
     * @return
     */
    List<Product> getProductsByCsid(Integer csid);

    /**
     * 复合查询分页
     * @param productForPageBean
     * @return
     */
    List<Product> getProductsByPage(ProductForPageBean productForPageBean);

    /**
     *查询总记录数
     * @param productForPageBean
     * @return
     */
    Integer getRowCount(ProductForPageBean productForPageBean);

    /**
     * 热门查询
     * @param productForPageBean
     * @return
     */
    List<Product> isHots(ProductForPageBean productForPageBean);

    /**
     * 查询商品信息
     * @param pid
     * @return
     */
    Product getProductByPid(Integer pid);
}
