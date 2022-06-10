package com.ysw.web.servlet;

import com.ysw.web.entity.Comment;
import com.ysw.web.service.CommentService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/getCommentByProid")
public class GetCommentByProidServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //设置请求和响应的格式
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=utf-8");

        //初始化comment集合
        CommentService commentService = new CommentService();
        //初始化session
        HttpSession session = request.getSession();

        //获取前端传过来的proid
        Integer proid = Integer.parseInt(request.getParameter("proid"));
        //如果proid存在的话就返回一个集合
        if (proid != null && proid != 0) {
            //根据产品id获取评论的集合
            List<Comment> comments = commentService.findByProid(proid);
            //设置comments集合数据共享
            session.setAttribute("comments",comments);
        }
        //跳转到评论的jsp页面
        response.sendRedirect("pinglun.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
