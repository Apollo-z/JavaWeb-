package com.ysw.web.servlet;

import com.ysw.web.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/checkNameServlet")
public class CheckNameServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //设置编码格式
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=utf-8");

        //首先获取我们的前端用户输入的用户名
        String username = request.getParameter("username");
        //创建一个userService实体对象
        UserService userService = new UserService();
        //判断用户名是否存在,如果存在的话返回true,否则返回false
        Boolean isExist = userService.checkUsername(username);
        //重新返回ajax
        response.getWriter().print(isExist);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
