package com.ysw.web.servlet;

import com.ysw.web.entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/toPingLun")
public class TooPingLunServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //设置请求和响应的格式
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=utf-8");

        HttpSession session = request.getSession();

        //获取订单号
        String msoid = request.getParameter("msoid_span");
        //获取产品的id
        String proid = request.getParameter("proid");
        //获取user对象的userid
        User user = (User)session.getAttribute("user");
        //当用户不为空的时候才能进行操作，就是一定要先登录才能进行操作
        if (user != null) {
            //获取用户的id号
            Integer userid = user.getId();
            //三个参数一定要有,这里我们短暂地传给下一个jsp界面即可
            if (msoid != null && proid != null && userid != 0) {
                request.setAttribute("msoid",msoid);
                request.setAttribute("proid",proid);
                request.setAttribute("userid",userid);
                //请求转发到下一个评论页面
                request.getRequestDispatcher("addPinglun.jsp").forward(request,response);
            }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
