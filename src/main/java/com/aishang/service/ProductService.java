package com.aishang.service;

import com.aishang.po.CategoryExt;
import com.aishang.po.Product;
import com.aishang.po.ProductForPageBean;

import java.util.List;
import java.util.Map;

/**
 * 商品service
 * @author yc950710
 */
public interface ProductService {
    /**
     * 根据csid查询商品返回map<csid,商品们>
     * @param allCategory
     * @return
     */
    Map<Integer, List<Product>> getFloor(List<CategoryExt> allCategory);

    /**
     * 商品复合查询分页
     * @param productForPageBean
     * @return
     */
    ProductForPageBean getProductForPage(ProductForPageBean productForPageBean);

    /**
     * 热门查询
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
