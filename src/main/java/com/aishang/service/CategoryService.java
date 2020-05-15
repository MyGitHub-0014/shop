package com.aishang.service;

import com.aishang.po.CategoryExt;

import java.util.List;

/**
 * 一级类目service
 * @author yc950710
 */
public interface CategoryService {
    /**
     * 查询一二级类目
     * @return
     */
    List<CategoryExt> getAllCategory();
}
