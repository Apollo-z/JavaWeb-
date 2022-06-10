package com.ysw.web.servlet;

import com.ysw.web.service.MsoService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/querenShouhuo")
public class QuerenShouhuoServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //根据msoid进行订单的删除
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=utf-8");

        //前端只需要获取msoid即可进行删除了
        String msoid = request.getParameter("msoid_update");

        MsoService msoService = new MsoService();

        //如果影响行数大于0则说明确认收货修改成功
        if (msoService.querenShouhuo(msoid) > 0) {
            //请求转发到展示订单页面
            request.getRequestDispatcher("showDingdan").forward(request,response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
