package com.ysw.web.servlet;

import com.ysw.web.entity.PageBean;
import com.ysw.web.entity.Pro;
import com.ysw.web.service.ProService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet("/search")
public class SeachServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //初始化请求格式
        response.setContentType("text/html;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");

        PrintWriter out = response.getWriter();
        //获取当前页数
        String currentPage = request.getParameter("currentPage");
        int pageNo = 1;     //默认一开始的pageNo = 1
        //当我们前端传入一个currentPage过来时,currentPage不为空
        if (currentPage != null && !"".equals(currentPage)) {
            //给我们的pageNo进行赋值,赋值为我们当前的页码数
            pageNo = Integer.parseInt(currentPage);
        }

        //我们自行定义每一页显示的记录条数为10
        Integer pageSize = 10;

        //最高价格
        String current_maxprice = request.getParameter("maxprice");
        Double maxprice = 0.0;
        //判断是否为空
        if (!"".equals(current_maxprice) & current_maxprice != null) {
            //赋值给我们的maxprice
            maxprice = Double.parseDouble(current_maxprice);
        }

        //最低价格
        String current_minprice = request.getParameter("minprice");
        Double minprice = 0.0;
        //判断是否为空
        if (!"".equals(current_minprice) & current_minprice != null) {
            //赋值给我们的minprice
            minprice = Double.parseDouble(current_minprice);
        }

        //类别编号
        String current_cid = request.getParameter("cid");
        Integer cid = 0;
        //判断是否为空
        if (!"".equals(current_cid) & current_cid != null) {
            //赋值给我们的cid
            cid = Integer.parseInt(current_cid);
        }

        //获取商品名,如果商品名不为空的时候就可以直接用，否则就为空
        String pName = request.getParameter("pName");

        ProService proService = new ProService();
        PageBean pageBean = proService.searchProsPage(maxprice,minprice,cid,pName,pageNo,pageSize);

        //共享数据
        request.setAttribute("pageBean",pageBean);
        request.setAttribute("maxprice",maxprice);
        request.setAttribute("minprice",minprice);
        request.setAttribute("cid",cid);
        request.setAttribute("pName",pName);

        request.getRequestDispatcher("liebiao.jsp").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
