package com.ysw.web.servlet.Admin;

import com.ysw.web.entity.PageBeanMso;
import com.ysw.web.service.MsoService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/adminFindMso")
public class AdminFindMsoServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //初始化请求格式
        response.setContentType("text/html;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");

        HttpSession session = request.getSession();

        PrintWriter out = response.getWriter();
        //获取当前页数，如果currentPage为空的话就直接使用pageNo
        String currentPage = request.getParameter("currentPage");
        int pageNo = 1;     //默认一开始的pageNo = 1
        //当我们前端传入一个currentPage过来时,currentPage不为空
        if (currentPage != null && !"".equals(currentPage)) {
            //给我们的pageNo进行赋值,赋值为我们当前的页码数
            pageNo = Integer.parseInt(currentPage);
        }

        //我们自行定义每一页显示的记录条数为10
        Integer pageSize = 10;

        //获取前端传过来的msoid，只能从前一个页面获取msoid
        String msoid = request.getParameter("msoid");

        MsoService msoService = new MsoService();
        //返回一个分页对象
        PageBeanMso pageBeanMso = msoService.searchMsoPage(msoid,pageNo,pageSize);

        //共享分页数据
        session.setAttribute("pageBeanMso",pageBeanMso);
        session.setAttribute("msoid_mso",msoid);

        response.sendRedirect("getAllPro");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
