package com.aishang.controller;

import com.aishang.po.Product;
import com.aishang.po.ProductForPageBean;
import com.aishang.service.ProductService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import java.io.UnsupportedEncodingException;
import java.util.List;

/**
 * 商品controller
 * @author yc950710
 */
@Controller
@RequestMapping("/product")
public class ProductController {

    /**
     * 注入ProductService
     */
    @Resource
    ProductService productService;

    @RequestMapping("/toSearchProducts")
    public String toSearchProducts(ProductForPageBean productForPageBean, Model model){
        String name = productForPageBean.getpName();
        try {
            if(name!=null){
                name = new String(name.getBytes("iso-8859-1"),"utf-8");
                productForPageBean.setpName(name);
            }
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        // 封装
        productForPageBean.setPageSize(12);
        // 调用service查询结果
        ProductForPageBean productForPage = productService.getProductForPage(productForPageBean);
        // 热门查询
        List<Product> isHots = productService.isHots(productForPageBean);
        // 返回查询结果给前台
        model.addAttribute("productForPageBean",productForPage);
        model.addAttribute("isHots",isHots);
        return "searchProducts";
    }

    /**
     * 跳转商品详情页
     */
    @RequestMapping("/toProductDetail")
    public String toProductDetail(Integer pid,Model model){
        // 查询商品信息
        Product product = productService.getProductByPid(pid);
        model.addAttribute("product",product);
        return "productDetail";
    }

}
