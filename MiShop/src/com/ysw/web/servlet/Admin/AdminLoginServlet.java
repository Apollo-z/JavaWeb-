package com.ysw.web.servlet.Admin;

import com.ysw.web.entity.Admin;
import com.ysw.web.entity.User;
import com.ysw.web.service.AdminService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/adminLogin")
public class AdminLoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //设置请求和响应的格式
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=utf-8");

        String adminname = request.getParameter("aname");
        String adminpassword = request.getParameter("apassword");

        HttpSession session = request.getSession();

        //调用service层的登录方法
        AdminService adminService = new AdminService();
        Admin admin = adminService.login(adminname,adminpassword);
        //如果登录成功，则说明找到admin对象
        if (admin != null) {
            //共享admin对象
            session.setAttribute("adminList",admin);
            //重定向到用户查询的索引页面
            response.sendRedirect("adminGetUser");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
