package com.aishang.dao;

import com.aishang.po.User;

/**
 * @author yc950710
 */
public interface UserDao {

    /**
     * 执行添加
     * @param user
     */
    void addUser(User user);

    /**
     * 检测用户名是否可用
     * @param userName
     */
    Integer checkUserName(String userName);

    /**
     * 登录校验
     * @param user
     * @return
     */
    User doLogin(User user);

    /**
     * 修改个人资料
     * @param user
     */
    void updatePersonalData(User user);
}
