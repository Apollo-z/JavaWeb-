package com.ysw.web.servlet;

import com.ysw.web.entity.UserMso;
import com.ysw.web.service.MsoService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/findDingdanById")
public class FindDingdanByIdServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //设置请求和响应的格式
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=utf-8");

        //获取当前的订单号，查询当前产品
        String msoid = request.getParameter("msoid_span");
        //设置共享数据的单笔总价
        request.setAttribute("msoid",msoid);
        //设置共享数据的单笔总价
        String totalMoney = request.getParameter("totalMoney");
        request.setAttribute("totalMoney",totalMoney);
        //根据id查询订单集合
        MsoService msoService = new MsoService();
        List<UserMso> list = msoService.findMsoByMsoId(msoid);
        if (list != null) {
            request.setAttribute("list",list);
            request.getRequestDispatcher("userinfo_pay.jsp").forward(request,response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
