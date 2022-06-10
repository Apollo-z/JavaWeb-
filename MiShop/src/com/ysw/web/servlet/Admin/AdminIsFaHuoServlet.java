package com.ysw.web.servlet.Admin;

import com.ysw.web.service.MsoService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/isFahuo")
public class AdminIsFaHuoServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //设置请求和响应的格式
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=utf-8");

        String msoid = request.getParameter("msoid");

        MsoService msoService = new MsoService();
        //如果影响的行数大于0则说明发货成功
        if (msoService.yiFahuo(msoid) > 0) {
            //重新展示已发货的数据
            response.sendRedirect("adminFindMso");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
