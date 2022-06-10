package com.ysw.web.servlet;

import com.ysw.web.entity.Pro;
import com.ysw.web.entity.User;
import com.ysw.web.service.ProService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet("/orderCart")
public class OrderCartServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //一定要首先判断我们用户是否登录
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        //判断我们用户是否已经登录，否则无法跳转到支付页面
        if (user == null) {
            //给我们的path设置cart购物车
            session.setAttribute("path","cart");
            //重新返回到登录界面
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }

        //获取前端传过来的ids
        String ides = request.getParameter("ids");
        //根据","进行字符串切割,获得一个数组
        String[] ids = ides.split(",");
        ProService proService = new ProService();

        //将cart对象的购物车内容进行筛选
        Map<Pro,Integer> cart = (Map<Pro,Integer>)session.getAttribute("cart");
        //创建一个购物车选中商品进行支付的子集
        Map<Pro,Integer> orderCart = new HashMap<Pro,Integer>();

        //判断cart是否为空，如果不为空的话则说明购物车中有数据
        if (cart != null) {
            //将ids[]数组中的每一个id都提取出来，赋值给id
            for (String id : ids) {
                //根据id查询出每一个商品出来
                Pro pro = proService.findById(Integer.parseInt(id));
                //将我们重新筛选得到的商品放入新的map集合,key存对象，value存number数量
                orderCart.put(pro,cart.get(pro));
            }
        }

        //共享数据
        session.setAttribute("orderCart",orderCart);
        //获取总的价格
        Double amount = Double.parseDouble(request.getParameter("amount"));
        session.setAttribute("amount",amount);
        //重新跳转到订单页面
        response.sendRedirect("dingdan.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
