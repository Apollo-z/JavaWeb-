package com.ysw.web.servlet;

import com.ysw.web.service.MsoService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/deleteByMsoid")
public class DeleteByMsoidServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //根据msoid进行订单的删除
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=utf-8");

        //前端只需要获取msoid即可进行删除了
        String msoid = request.getParameter("msoid_delete");

        MsoService msoService = new MsoService();
        //只有获取到msoid才能进行操作
        if (msoid != null || !"".equals(msoid)) {
            //删除返回的值
            int deleteNum1 = msoService.deleteMsoByMsoid(msoid);
            int deleteNum2 = msoService.deleteMsoxqByMsoid(msoid);

                //请求转发到展示订单页面
                request.getRequestDispatcher("showDingdan").forward(request,response);
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
