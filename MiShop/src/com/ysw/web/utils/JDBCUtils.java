package com.ysw.web.utils;

import java.sql.*;

public class JDBCUtils {

    //链接数据库
    private static String url = "jdbc:mysql:///mishop?useSSL=false";
    private static String username = "root";
    private static String password = "123456";

    public static Connection getConnection() {

        //创建资源链接对象
        Connection conn = null;
        if (conn == null) {
            try {
                //加载驱动
                Class.forName("com.mysql.jdbc.Driver");
                //链接数据库
                conn = DriverManager.getConnection(url, username, password);

                System.out.print("数据库成功！11111");
            } catch (Exception e) {
                e.printStackTrace();

            }
        }
        //返回一个资源链接对象
        return conn;
    }

    //关闭资源
    public static void close(ResultSet rs, PreparedStatement pstmt, Connection conn) {

        //如果不为空，才释放相对应的资源
        if (rs != null) {
            try {
                rs.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        if (pstmt != null) {
            try {
                pstmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

    }

    /**
     * executeUpdate方法
     *
     * @param sql
     * @param parameter
     * @return
     */
    public static int myExecuteUpdate(String sql, Object[] parameter) {

        //获取资源连接对象
        Connection conn = getConnection();
        //sql执行对象
        PreparedStatement pstmt = null;
        int num = 0;

        try {
            pstmt = conn.prepareStatement(sql);
            //判断输入sql语句中的预编译参数是否为空
            if (parameter != null) {
                //如果sql语句中的预编译参数不为空
                for (int i = 0; i < parameter.length; i++) {
                    //为预编译sql设置参数,第一个是指你SQL语句中的第几个参数(也就是?，从1开始)，第二个是要设置的值（从0开始）
                    pstmt.setObject(i + 1, parameter[i]);
                }
            }
            //执行sql
            num = pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            //释放资源
            close(null, pstmt, conn);
        }
        return num;
    }
}