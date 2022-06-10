package com.ysw.web.dao;

import com.ysw.web.entity.User;
import com.ysw.web.utils.JDBCUtils;
import com.ysw.web.utils.Md5Utils;
import com.ysw.web.utils.TimeUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserDao extends JDBCUtils {

    //注册方法，向数据库插入数据
    public Integer register(User user){
        //定义sql，插入到数据库
        String sql = "insert into user(username,password,telephone,regTime) values (?,?,?,?)";
        //设置参数
        Object[] param = {user.getUsername(), Md5Utils.getMD5(user.getPassword()),
                user.getTelephone(), TimeUtils.getTime()};
        //返回影响的行数，如果影响的行数大于0则说明插入成功，否则插入失败
        return myExecuteUpdate(sql,param);
    }

    //根据用户名查询，返回一个对象
    public User findByName(String username){

        User user = null;
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            //获取资源连接对象
            conn = getConnection();
            //定义sql
            String sql = "select * from user where username = ?";
            //创建sql执行对象
            pstmt = conn.prepareStatement(sql);

            //给sql语句中的参数进行赋值,赋值为我们的username
            pstmt.setString(1,username);

            //执行sql
            rs = pstmt.executeQuery();
            while (rs.next()) {

                //如果真的有这个user对象的话，就直接new出来实例化，如果没有的话就为空
                user = new User();

                user.setId(rs.getInt("id"));
                user.setUsername(rs.getString("username"));
                user.setPassword(rs.getString("password"));
                user.setTelephone(rs.getString("telephone"));
                user.setName(rs.getString("name"));
                user.setRegTime(rs.getString("regTime"));
                user.setGexing(rs.getString("gexing"));
                user.setHobby(rs.getString("hobby"));
                user.setAddress(rs.getString("address"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            //关闭资源链接对象
            close(rs,pstmt,conn);
        }
        //如果有数据的话,就返回一个带有数据的user，如果没有的话，就返回null
        return user;
    }

    /**
     * 登录方法
     *
     * @param username
     * @param password
     * @return
     */
    public User findUserByUserNameAndPassword(String username,String password){

        User user = null;
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            //获取资源连接对象
            conn = getConnection();
            //定义sql
            String sql = "select * from user where username = ? and password = ?";
            //创建sql执行对象
            pstmt = conn.prepareStatement(sql);

            //给sql语句中的参数进行赋值,赋值为我们的username
            pstmt.setString(1,username);
            pstmt.setString(2,password);
            //执行sql
            rs = pstmt.executeQuery();
            while (rs.next()) {

                //如果真的有这个user对象的话，就直接new出来实例化，如果没有的话就为空
                user = new User();

                user.setId(rs.getInt("id"));
                user.setUsername(rs.getString("username"));
                user.setPassword(rs.getString("password"));
                user.setTelephone(rs.getString("telephone"));
                user.setName(rs.getString("name"));
                user.setRegTime(rs.getString("regTime"));
                user.setGexing(rs.getString("gexing"));
                user.setHobby(rs.getString("hobby"));
                user.setAddress(rs.getString("address"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            //关闭资源链接对象
            close(rs,pstmt,conn);
        }
        //如果有数据的话,就返回一个带有数据的user，如果没有的话，就返回null
        return user;
    }

    /**
     * 根据用户传进来的user来设置
     *
     * @param user
     * @return
     */
    public Integer updateUser(User user){
        String sql = "update user set password = ?,telephone = ?,name = ?,gexing = ?,hobby = ?,address = ? where id = ?";
        Object[] params = {user.getPassword(),user.getTelephone(),user.getName(),user.getGexing(),user.getHobby(),
                    user.getAddress(),user.getId()};
        return myExecuteUpdate(sql,params);
    }

    /**
     * 查询所有用户的方法
     *
     * @return
     */
    public List<User> findAll(String name,Integer currentPage,Integer pageSize){

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        //这个集合用于存储数据
        List<User> users = new ArrayList<>();
        //这个集合用于存储条件
        List list = new ArrayList();

        try {
            //创建资源链接对象
            conn = getConnection();
            //定义sql
            String sql = "select * from user where 1 = 1 ";

            //如果用户名不为空的话，就作条件查询
            if (name != null  && !"".equals(name)) {
                sql = sql + " and name like ?";
                list.add("%" + name + "%");
            }
            //排序并分页
            sql = sql + " ORDER BY id ASC limit ? , ?";
            list.add((currentPage - 1)*pageSize);       //当前页码
            list.add(pageSize);     //每一页的记录条数

            //创建sql执行对象
            pstmt = conn.prepareStatement(sql);

            //这里要给我们 ? 进行赋值,当我们集合里面有参数的时候
            if (list.size() > 0) {
                //遍历集合
                for (int i = 0; i < list.size(); i++) {
                    //给我们的第 i + 1 个参数赋值,赋值为集合里面存储的数据
                    pstmt.setObject(i + 1, list.get(i));
                }
            }

            rs = pstmt.executeQuery();
            while (rs.next()){
                User user = new User();
                user.setId(rs.getInt("id"));
                user.setUsername(rs.getString("username"));
//                user.setPassword(); //不要显示password
                user.setTelephone(rs.getString("telephone"));
                user.setName(rs.getString("name"));
                user.setRegTime(rs.getString("regTime"));
                user.setGexing(rs.getString("gexing"));
                user.setHobby(rs.getString("hobby"));
                user.setAddress(rs.getString("address"));

                //把user对象添加到users集合中去
                users.add(user);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close(rs,pstmt,conn);
        }
        //返回一个封装好数据的list集合
        return users;
    }

    /**
     * 动态查询所有的用户数
     *
     * @param name
     * @return
     */
    public Integer countAllUser(String name){

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        Integer num = 0;

        //这个集合用于存储条件
        List list = new ArrayList();

        try {
            //创建资源链接对象
            conn = getConnection();
            //定义sql
            String sql = "select count(*) from user where 1 = 1 ";

            //如果用户名不为空的话，就作条件查询
            if (name != null  && !"".equals(name)) {
                sql = sql + " and name like ?";
                list.add("%" + name + "%");
            }

            //创建sql执行对象
            pstmt = conn.prepareStatement(sql);

            //这里要给我们 ? 进行赋值,当我们集合里面有参数的时候
            if (list.size() > 0) {
                //遍历集合
                for (int i = 0; i < list.size(); i++) {
                    //给我们的第 i + 1 个参数赋值,赋值为集合里面存储的数据
                    pstmt.setObject(i + 1, list.get(i));
                }
            }

            rs = pstmt.executeQuery();
            while (rs.next()){
               num = rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close(rs,pstmt,conn);
        }
        //返回一个数量集合
        return num;
    }

    /**
     * 根据id删除用户
     *
     * @param id
     */
    public void deleteUser(Integer id){
        String sql = "delete from user where id = ?";
        Object[] params = {id};
        //执行sql
        myExecuteUpdate(sql,params);
    }

    /**
     * 管理员根据用户id进行更新操作
     *
     * @param user
     */
    public void adminUpdateUser(User user){
        String sql = "update user set username = ?,password = ?,telephone = ?,name = ? where id = ?";
        Object[] param = {user.getUsername(),Md5Utils.getMD5(user.getPassword()),user.getTelephone(),user.getName(),user.getId()};
        myExecuteUpdate(sql,param);
    }

}

