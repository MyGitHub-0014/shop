package com.aishang.service;

import com.aishang.dao.UserDao;
import com.aishang.po.User;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * UserServiceImpl
 * @author yc950710
 */
@Service
public class UserServiceImpl implements UserService {

    /**
     * 调用dao
     */
    @Resource
    UserDao userDao;

    /**
     * 执行添加
     */
    @Override
    public void addUser(User user) {
        userDao.addUser(user);
    }

    /**
     * 检测用户名是否可用
     * @param userName
     */
    @Override
    public Integer checkUserName(String userName) {
        return userDao.checkUserName(userName);
    }

    /**
     * 登录校验
     * @param user
     * @return
     */
    @Override
    public User doLogin(User user) {
        return userDao.doLogin(user);
    }

    /**
     * 修改个人资料
     * @param user
     */
    @Override
    public void updatePersonalData(User user) {
        userDao.updatePersonalData(user);
    }
}
