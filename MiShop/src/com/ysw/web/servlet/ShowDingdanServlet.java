package com.ysw.web.servlet;

import com.ysw.web.entity.User;
import com.ysw.web.entity.UserMso;
import com.ysw.web.service.MsoService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/showDingdan")
public class ShowDingdanServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        MsoService msoService = new MsoService();
        User user = (User)(session.getAttribute("user"));
        //设置一个集合用于存储该用户的订单详情
        if (user != null){
//            System.out.println(user.getId());
            List<UserMso> userMsos = msoService.findMsoByUserId(user.getId());
            //这里同时设置一个用户的订单情况进行共享
            session.setAttribute("userMsos",userMsos);
//            System.out.println(userMsos);
            request.getRequestDispatcher("dingdanzhongxin.jsp").forward(request,response);
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
