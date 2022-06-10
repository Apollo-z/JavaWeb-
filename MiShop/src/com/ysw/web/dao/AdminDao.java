package com.ysw.web.dao;

import com.ysw.web.entity.Admin;
import com.ysw.web.utils.JDBCUtils;
import com.ysw.web.utils.Md5Utils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AdminDao extends JDBCUtils {

    /**
     * 管理员登陆方法
     *
     * @param adminname
     * @param adminpassword
     * @return
     */
    public Admin login(String adminname,String adminpassword){

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        Admin admin = null;

        try {
            //创建资源连接对象
            conn = getConnection();
            //定义sql
            String sql = "select * from admin where AdminName = ? and AdminPwd = ?";
            //创建sql执行对象
            pstmt = conn.prepareStatement(sql);

            //给？参数赋值
            pstmt.setString(1,adminname);
            pstmt.setString(2,Md5Utils.getMD5(adminpassword));
            //执行sql
            rs = pstmt.executeQuery();
            while (rs.next()) {
                //如果查询到了admin对象，就可以new出来了，最后返回一个带有参数的admin
                admin = new Admin();

                admin.setAdminid(rs.getInt("AdminId"));
                admin.setAdminname(rs.getString("AdminName"));
                admin.setAdminpassword(rs.getString("AdminPwd"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close(rs,pstmt,conn);
        }
        return admin;
    }

}
