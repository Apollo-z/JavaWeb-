package com.ysw.web.servlet;

import com.ysw.web.entity.User;
import com.ysw.web.entity.UserMso;
import com.ysw.web.service.MsoService;
import com.ysw.web.service.UserService;
import com.ysw.web.utils.Md5Utils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //设置编码格式
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=utf-8");

        PrintWriter out = response.getWriter();
        MsoService msoService = new MsoService();
        //初始化
        UserService userService = new UserService();

        String username = request.getParameter("username");
        String password = request.getParameter("password");
//        String url = request.getParameter("page");
//        System.out.println(url);

        User user = userService.login(username,Md5Utils.getMD5(password));
        if (user != null) {
            HttpSession session = request.getSession();
            //这个用于存储用户信息
            session.setAttribute("user",user);
            //如果用户名不为空的话，就直接返回OK，进行登录跳转
            //如果url是空的话，则说明是从首页登陆进来的，否则就跳转到执行的url
            out.write("OK");

//            if ("".equals(url) || url == null){
//            } else {
//                response.sendRedirect(url);
//            }

        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}