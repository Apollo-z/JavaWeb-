package com.ysw.web.service;

import com.ysw.web.dao.AdminDao;
import com.ysw.web.dao.UserDao;
import com.ysw.web.entity.Admin;
import com.ysw.web.entity.PageBeanUser;
import com.ysw.web.entity.User;

import java.util.List;

public class AdminService {

    AdminDao adminDao = new AdminDao();
    UserDao userDao = new UserDao();

    /**
     * 根据用户名和密码登录管理员
     *
     * @param adminname
     * @param adminpassword
     * @return
     */
    public Admin login(String adminname,String adminpassword){
        return adminDao.login(adminname,adminpassword);
    }

    /**
     * 查询所有用户
     * @return
     */
    public PageBeanUser findAll(String name, Integer currentPage, Integer pageSize){
        PageBeanUser pageBeanUser = new PageBeanUser();

        //设置当前的页码数
        pageBeanUser.setCurrentPage(currentPage);
        //设置每一页的数据条数
        pageBeanUser.setPageSize(pageSize);
        //设置存储的list集合进去
        List<User> users = userDao.findAll(name,currentPage,pageSize);
        pageBeanUser.setUsers(users);
        //设置总记录数
        Integer count = userDao.countAllUser(name);
        pageBeanUser.setCount(count);
        //总页数 = 总记录数 / 每一页的记录数,有余数就向上取整
        pageBeanUser.setTotalPage((int)(Math.ceil(count*1.0/pageSize)));
        //返回一个带有数据的pageBean对象
        return pageBeanUser;
    }

    /**
     * 根据id删除用户
     *
     * @param id
     */
    public void deleteUser(Integer id){
        userDao.deleteUser(id);
    }

    /**
     * 根据传进来的user进行更新操作
     *
     * @param user
     */
    public void adminUpdateUser(User user){
        userDao.adminUpdateUser(user);
    }

}
