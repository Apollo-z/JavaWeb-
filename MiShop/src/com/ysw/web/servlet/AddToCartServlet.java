package com.ysw.web.servlet;

import com.ysw.web.entity.Pro;
import com.ysw.web.service.ProService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

//这里主要是获取到我们的id之后跳转到我们的cart
@WebServlet("/addToCart")
public class AddToCartServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //设置请求和响应的格式
        response.setContentType("text/html;charset=utf-8");
        request.setCharacterEncoding("UTF-8");

        PrintWriter out = response.getWriter();

        //获取我们的前端id
        Integer id = Integer.parseInt(request.getParameter("id"));

        //调用service层
        ProService proService = new ProService();
        //定义一个pro对象
        Pro pro = proService.findById(id);

        //如果pro对象中的库存没有了，就返回false
        if (pro.getpNum() == 0) {
            //没有库存了
            out.print("false");
            return;
        }

        //使用session实现购物车功能
        HttpSession session = request.getSession();

        //重写hashCode和equals方法
        //hashMap的键用于存储pro对象，值用于存储商品的购买数量
        Map<Pro,Integer> cart = (Map<Pro,Integer>)session.getAttribute("cart");

        int num = 1;
        //如果我们第一次访问的话是没有cart的hashMap对象的，故此需要构建
        if (cart == null) {
            //这里创建了一个hashMap对象
            cart = new HashMap<Pro,Integer>();
        }

        //查看当前集合中是否存在编号为id的商品，如果有就把值取出来+1
        if (cart.containsKey(pro)) {
            if (cart.get(pro) == pro.getpNum()) {
                out.print("false");
                return;
            }
            //如果库存中已经存在此商品的话就直接数量+1
            num = cart.get(pro) + 1;    //库存+1
        }

        //把商品存入购物车
        cart.put(pro,num);
        //进行数据的共享
        session.setAttribute("cart",cart);
        out.print("true");

//        //把pro对象放入request域进行共享
//        request.setAttribute("pro",pro);
//        //请求转发到购物车页面
//        request.getRequestDispatcher("gouwuche.jsp").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
