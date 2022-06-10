package com.ysw.web.servlet.Admin;

import com.ysw.web.service.AdminService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/adminDeleteUser")
public class AdminDeleteUserServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //设置请求和响应的格式
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=utf-8");

        AdminService adminService = new AdminService();

        //获取前端传过来的userid后直接执行删除操作
        String userid = request.getParameter("userid");
        adminService.deleteUser(Integer.parseInt(userid));

        //重新发送到index.jsp页面进行展示
        response.sendRedirect("admin/index.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
