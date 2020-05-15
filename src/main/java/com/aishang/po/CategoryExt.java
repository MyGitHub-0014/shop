package com.aishang.po;

import java.util.List;

/**
 * 一级类目的扩展类
 * @author yc950710
 */
public class CategoryExt extends Category {
    private List<CategorySecond> categorySeconds;

    public List<CategorySecond> getCategorySeconds() {
        return categorySeconds;
    }

    public void setCategorySeconds(List<CategorySecond> categorySeconds) {
        this.categorySeconds = categorySeconds;
    }

    @Override
    public String toString() {
        return "CategoryExt{" +
                "categorySeconds=" + categorySeconds +
                '}';
    }
}
