package com.aishang.controller;

import com.aishang.po.CategoryExt;
import com.aishang.po.Product;
import com.aishang.service.CategoryService;
import com.aishang.service.ProductService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * @author yc950710
 */
@Controller
@RequestMapping("index")
public class IndexController {
    /**
     * 注入一级类目service
     */
    @Resource
    private CategoryService categoryService;

    /**
     * 注入商品service
     */
    @Resource
    private ProductService productService;

    /**
     * 跳转主页
     */
    @RequestMapping("/toIndex")
    public String toIndex(Model model){
    // 查询一二级类目
        List<CategoryExt> allCategory = categoryService.getAllCategory();
    // 根据csid查询商品返回map<csid,商品们>
        Map<Integer,List<Product>> products = productService.getFloor(allCategory);
    //将查询结果放入model
        model.addAttribute("allCategory",allCategory);
        model.addAttribute("products",products);
        return "index";
    }
}
