package com.ysw.web.servlet;

import com.ysw.web.service.CommentService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/addPinglun")
public class AddCommentsServleta extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //设置请求和响应格式
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=utf-8");

        Integer userid = Integer.parseInt(request.getParameter("userid"));  //用户id
        Integer proid = Integer.parseInt(request.getParameter("proid"));    //产品id
        String comments = request.getParameter("comments");                 //评论内容
        Double score = Double.parseDouble(request.getParameter("score"));   //打分

        //将评论内容插入数据库
        CommentService commentService = new CommentService();
        commentService.addComment(proid,score,userid,comments);

        //重定向到个人信息中心
        response.sendRedirect("self_info.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
