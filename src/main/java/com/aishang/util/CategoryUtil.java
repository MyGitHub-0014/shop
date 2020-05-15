package com.aishang.util;

import com.aishang.po.CategoryExt;
import com.aishang.service.CategoryService;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;
import javax.servlet.ServletContext;
import java.util.List;

/**
 * 项目启动查询一二级类目信息到内存中
 * @author yc950710
 */
@Component
public class CategoryUtil {
    @Resource
    private CategoryService categoryService;

    @Resource
    private ServletContext application;

    /**
     * 项目启动查询一二级类目信息到内存中
     * @PostConstruct 初始化bean的时候执行的方法
     */
    @PostConstruct
    public void loadCategories(){
        List<CategoryExt> allCategory = categoryService.getAllCategory();
        application.setAttribute("allCategory",allCategory);
    }
}
