package com.ysw.web.service;

import com.ysw.web.dao.UserDao;
import com.ysw.web.entity.User;

public class UserService {

    UserDao userDao = new UserDao();

    /**
     * 校验是否注册成功的方法
     *
     * @param user
     * @return
     */
    public Boolean register(User user){
        int num = 0;
        try {
            num = userDao.register(user);
        } catch (Exception e) {
            e.printStackTrace();
        }
        //判断我们的影响行数是否大于0? 是的话返回true,否则返回false
        return num > 0 ? true : false;
    }

    /**
     * 用户判断我们是否真的存在这个对象,如果存在的话返回true,否则返回false
     *
     * @param username
     * @return
     */
    public Boolean checkUsername(String username){
        User user = null;
        //用于校验我们是否存在这个username
        user = userDao.findByName(username);
        if (user == null) {
            return false;
        } else {
            return true;
        }
    }

    /**
     * 登录方法
     *
     * @param username
     * @param password
     * @return
     */
    public User login(String username,String password){
        //返回一个对象,根据用户名和密码查找到的对象
        return userDao.findUserByUserNameAndPassword(username,password);
    }

    /**
     * 根据用户信息更新user表
     *
     * @param user
     * @return
     */
    public Integer updateUser(User user){
        return userDao.updateUser(user);
    }
}
