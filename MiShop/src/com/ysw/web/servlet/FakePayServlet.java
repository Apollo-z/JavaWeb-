package com.ysw.web.servlet;

import com.ysw.web.service.MsoService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

//模拟付款
@WebServlet("/fakePay")
public class FakePayServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //设置请求和响应的格式
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=utf-8");

        //前端传一个msoid进来，进行修改,这个比较通用
        String msoid = request.getParameter("msoid_pay");
//        System.out.println(msoid);
        MsoService msoService = new MsoService();
        if (!"".equals(msoid) || msoid != null) {
            //只有msoid不为空的时候才执行修改操作,只有影响行数大于0的时候才成功
            if (msoService.updateMsoPayState(msoid) > 0) {
                response.sendRedirect("paysuccess.jsp");
                //这里要返回到支付成功节目，无论是路径还是返回到ajax都可以
            } else {
                //付款失败就跳转到付款失败页面
                response.sendRedirect("payerror.jsp");
            }

        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
