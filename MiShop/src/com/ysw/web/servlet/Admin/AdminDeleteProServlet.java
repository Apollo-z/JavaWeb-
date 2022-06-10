package com.ysw.web.servlet.Admin;

import com.ysw.web.service.ProService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/deletePro")
public class AdminDeleteProServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //初始化请求格式
        response.setContentType("text/html;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");

        ProService proService = new ProService();

        //获取id
        String id = request.getParameter("id");
        if (id != null || !"".equals(id)) {
            proService.deletePro(Integer.parseInt(id));
            response.sendRedirect("admin/index.jsp");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
