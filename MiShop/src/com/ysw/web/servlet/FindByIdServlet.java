package com.ysw.web.servlet;

import com.ysw.web.entity.Pro;
import com.ysw.web.service.ProService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/findById")
public class FindByIdServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        //获取我们的前端id
        Integer id = Integer.parseInt(request.getParameter("id"));

        //调用service层
        ProService proService = new ProService();
        //定义一个pro对象
        Pro pro = proService.findById(id);
        //把pro对象放入request域进行共享
        request.setAttribute("pro",pro);
        //请求转发到详情页面
        request.getRequestDispatcher("xiangqing.jsp").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
