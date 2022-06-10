package com.ysw.web.servlet.Admin;

import com.ysw.web.entity.User;
import com.ysw.web.service.AdminService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/adminUpdateUser")
public class AdminUpdateUserServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //设置请求和响应的格式
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=utf-8");

        Integer userid = Integer.parseInt(request.getParameter("userid"));
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String telephone = request.getParameter("telephone");
        String name = request.getParameter("name");

//        System.out.println(userid + "a" + username + "a" + password  + "a" + telephone + "a" + name);

        User user = new User();
        user.setId(userid);
        user.setUsername(username);
        user.setPassword(password);
        user.setTelephone(telephone);
        user.setName(name);

        //执行更新操作
        AdminService adminService = new AdminService();
        adminService.adminUpdateUser(user);

        //重新发送到index.jsp页面进行展示
        response.sendRedirect("admin/index.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
