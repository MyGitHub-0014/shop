package com.aishang.service.impl;

import com.aishang.dao.CategoryDao;
import com.aishang.po.CategoryExt;
import com.aishang.service.CategoryService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * 一级类目service实现类
 * @author yc950710
 */
@Service
public class CategoryServiceImpl implements CategoryService {
    /**
     * 注入一级类目dao
     */
    @Resource
    private CategoryDao categoryDao;

    @Override
    public List<CategoryExt> getAllCategory() {
        return categoryDao.getAllCategory();
    }
}
