package com.aishang.dao;

import com.aishang.po.CategoryExt;

import java.util.List;

/**
 * @author yc950710
 */
public interface CategoryDao {

    /**
     * 查询一二级类目
     * @return
     */
    List<CategoryExt> getAllCategory();
}
