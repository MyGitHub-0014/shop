package com.aishang.service.impl;

import com.aishang.dao.ProductDao;
import com.aishang.po.CategoryExt;
import com.aishang.po.CategorySecond;
import com.aishang.po.Product;
import com.aishang.po.ProductForPageBean;
import com.aishang.service.ProductService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * ProductService的实现类
 * @author yc950710
 */
@Service
public class ProductServiceImpl implements ProductService {
    @Resource
    private ProductDao productDao;
    /**
     * 根据csid查询商品返回map<csid,商品们>
     * @param allCategory
     * @return
     */
    @Override
    public Map<Integer, List<Product>> getFloor(List<CategoryExt> allCategory) {
        Map<Integer, List<Product>> map = new HashMap<>();
        //遍历一级类目,找到里面的二级类目
        for (CategoryExt categoryExt : allCategory) {
            //遍历二级类目
            for (CategorySecond categorySecond : categoryExt.getCategorySeconds()) {
                //获取到csid，并查询商品
                List<Product> products = productDao.getProductsByCsid(categorySecond.getCsid());
                map.put(categorySecond.getCsid(),products);
            }
        }

        return map;
    }

    /**
     * 商品复合查询分页
     * @param productForPageBean
     * @return
     */
    @Override
    public ProductForPageBean getProductForPage(ProductForPageBean productForPageBean) {
        System.out.println(productForPageBean.getPageNow());
        // 1.查询结果集
        List<Product> products = productDao.getProductsByPage(productForPageBean);
        // 2.查询总记录数
        Integer rowCount = productDao.getRowCount(productForPageBean);
        // 3.封装参数
        productForPageBean.setRowCount(rowCount);
        productForPageBean.setList(products);
        // 4.返回结果
        return productForPageBean;
    }

    /**
     * 热门查询
     * @return
     */
    @Override
    public List<Product> isHots(ProductForPageBean productForPageBean) {
        return productDao.isHots(productForPageBean);
    }

    /**
     * 查询商品信息
     * @param pid
     * @return
     */
    @Override
    public Product getProductByPid(Integer pid) {
        return productDao.getProductByPid(pid);
    }

}
