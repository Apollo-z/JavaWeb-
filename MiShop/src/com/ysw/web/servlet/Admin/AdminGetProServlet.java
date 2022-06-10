package com.ysw.web.servlet.Admin;

import com.ysw.web.entity.PageBean;
import com.ysw.web.service.ProService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/getAllPro")
public class AdminGetProServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //初始化请求格式
        response.setContentType("text/html;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");

        HttpSession session = request.getSession();

        //获取当前页码
        String currentPage = request.getParameter("currentPage");
        //一开始默认pageNo为1
        Integer pageNo = 1;
        //判断前端传入的currentPage是否为空
        if (currentPage != null && !"".equals(currentPage)) {
            //如果不为空的话就可以把currentPage的值给pageNo
            pageNo = Integer.parseInt(currentPage);
        }

        //我们自行定义每一页显示的记录条数为10
        Integer pageSize = 10;

        //获取商品名,如果商品名不为空的时候就可以直接用，否则就为空
        String pName = request.getParameter("pName");

        ProService proService = new ProService();
        PageBean pageBeanPro = proService.adminSearchProPage(pName,pageNo,pageSize);

        session.setAttribute("pageBeanPro",pageBeanPro);
        session.setAttribute("pName",pName);

        //重新发送到index.jsp页面进行展示
        response.sendRedirect("admin/index.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
