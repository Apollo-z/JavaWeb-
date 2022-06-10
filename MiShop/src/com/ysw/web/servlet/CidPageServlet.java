package com.ysw.web.servlet;

import com.ysw.web.entity.PageBean;
import com.ysw.web.service.ProService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

//根据cid分页
@WebServlet("/cidPageServlet")
public class CidPageServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //获取前端传过来的currentPage当前页面
        String currentPage = request.getParameter("currentPage");
        int pageNo = 1;     //默认一开始的pageNo = 1
        //暂定cid到时候根据前端传过来
        Integer cid = Integer.parseInt(request.getParameter("cid"));

        request.setAttribute("cid",cid);

        //当我们前端传入一个currentPage过来时,currentPage不为空
        if (currentPage != null) {
            //给我们的pageNo进行赋值,赋值为我们当前的页码数
            pageNo = Integer.parseInt(currentPage);
        }

        //我们自行定义每一页显示的记录条数为5
        int pageSize = 10;

        ProService proService = new ProService();
        //调用我们的service层,因为pageBean对象里面包含了所有的分页信息了
        PageBean pageBean = proService.findProsByCid(cid,pageNo,pageSize);

        //共享数据出去
        request.setAttribute("pageBean",pageBean);
        request.getRequestDispatcher("liebiao.jsp").forward(request,response);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
