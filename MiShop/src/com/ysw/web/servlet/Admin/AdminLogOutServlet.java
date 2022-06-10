package com.ysw.web.servlet.Admin;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/adminLogout")
public class AdminLogOutServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //设置请求和响应的格式
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=utf-8");

        HttpSession session = request.getSession();
        //清除管理员对象
        session.removeAttribute("adminList");
        //清除所有的用户信息
        session.removeAttribute("users");
        //清除订单的分页信息
        session.removeAttribute("pageBeanMso");
        //清除查询的订单号
        session.removeAttribute("msoid_mso");

        response.sendRedirect("admin/index.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
