package com.ysw.web.servlet;

import com.ysw.web.entity.User;
import com.ysw.web.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //设置编码格式
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=utf-8");

        PrintWriter out = response.getWriter();

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String telephone = request.getParameter("telephone");
        String number = request.getParameter("number");     //用户输入的验证码
        System.out.println("用户输入的验证码是：" + number);

        //创建一个userService实体对象
        UserService userService = new UserService();
        //判断用户名是否存在,如果存在的话返回true,否则返回false
        Boolean isExist = userService.checkUsername(username);
        //如果用户名已经存在的话就无法进行注册
        if (isExist == true) {
            //如果注册失败了的话就返回error
            out.write("error");
        } else {
            //获取我们所发送的验证码(这个验证码是保存到session域中的)
            String number1 = (String)(request.getSession().getAttribute("num"));

            request.setAttribute("username",username);
            request.setAttribute("password",password);
            request.setAttribute("telephone",telephone);

            //首先判断验证码是否有误
            if (!number1.equals(number)) {
                //如果验证码出错就重新返回reister.jsp
                request.getRequestDispatcher("register.jsp").forward(request,response);
                return;
            }

            //设置user对象，封装具体的信息内容
            User user = new User();
            user.setUsername(username);
            user.setPassword(password);
            user.setTelephone(telephone);

            //将这个user发送给service层
            Boolean isRegisterSuccess = userService.register(user);

            if (isRegisterSuccess) {
                //如果成功注册就跳转到go.jsp
                out.write("OK");
            } else {
                //如果失败就重新注册
                request.getRequestDispatcher("register.jsp").forward(request,response);
            }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
