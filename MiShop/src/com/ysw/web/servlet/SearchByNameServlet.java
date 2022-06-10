package com.ysw.web.servlet;

import com.google.gson.Gson;
import com.ysw.web.entity.Pro;
import com.ysw.web.service.ProService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/searchNames")
public class SearchByNameServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //设置请求格式
        request.setCharacterEncoding("UTF-8");
        //获取产品名
        String pName = request.getParameter("pName");
        ProService proService = new ProService();
        System.out.println(pName);
        //设置响应格式为json
        response.setContentType("application/json;charset=UTF-8");
        //根据产品名返回一个集合
        List<Pro> pros = proService.findProsByName(pName);

        Gson gson = new Gson();
        //将pros集合转为json格式进行返回
        String json = gson.toJson(pros);
        //返回给前端ajax
        response.getWriter().write(json);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
