package com.ysw.web.servlet;

import com.ysw.web.entity.User;
import com.ysw.web.service.UserService;
import com.ysw.web.utils.Md5Utils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/updateUser")
public class UpdateUserServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //设置编码格式
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=utf-8");

        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String telephone = request.getParameter("telephone");
        String password = request.getParameter("password");
        String gexing = request.getParameter("gexing");
        String hobby = request.getParameter("hobby");
        String address = request.getParameter("address");

        User user = new User();
        user.setId(Integer.parseInt(id));
        user.setName(name);
        user.setTelephone(telephone);
        user.setPassword(Md5Utils.MD5(password));
        user.setGexing(gexing);
        user.setHobby(hobby);
        user.setAddress(address);

        UserService userService = new UserService();
        //如果影响行数大于0则说明更新成功
        if (userService.updateUser(user) > 0){
//            response.getWriter().write("<script>alert('修改成功！即将重新登录！');</script>");

            //跳转到个人信息主页
            request.getRequestDispatcher("logout").forward(request,response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
