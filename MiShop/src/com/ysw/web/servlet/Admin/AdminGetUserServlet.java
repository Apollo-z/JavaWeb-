package com.ysw.web.servlet.Admin;

import com.ysw.web.entity.PageBeanUser;
import com.ysw.web.entity.User;
import com.ysw.web.service.AdminService;
import com.ysw.web.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet("/adminGetUser")
public class AdminGetUserServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //初始化请求格式
        response.setContentType("text/html;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");

        HttpSession session = request.getSession();

        PrintWriter out = response.getWriter();
        //获取当前页数
        String currentPage = request.getParameter("currentPage");
        int pageNo = 1;     //默认一开始的pageNo = 1
        //当我们前端传入一个currentPage过来时,currentPage不为空
        if (currentPage != null && !"".equals(currentPage)) {
            //给我们的pageNo进行赋值,赋值为我们当前的页码数
            pageNo = Integer.parseInt(currentPage);
        }

        //我们自行定义每一页显示的记录条数为5
        Integer pageSize = 5;

        //获取商品名,如果商品名不为空的时候就可以直接用，否则就为空
        String name = request.getParameter("user_name");
//        System.out.println(name);       //测试
        //获取分页对象
        AdminService adminService = new AdminService();
        PageBeanUser pageBeanUser = adminService.findAll(name,pageNo,pageSize);
//        System.out.println(pageBeanUser);   //测试
        //获取所有用户，进行数据共享
        session.setAttribute("users",pageBeanUser);
        session.setAttribute("name",name);
        //重定向到订单查询页面
        response.sendRedirect("adminFindMso");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
