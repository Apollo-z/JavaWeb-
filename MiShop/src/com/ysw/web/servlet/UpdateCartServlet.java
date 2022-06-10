package com.ysw.web.servlet;

import com.ysw.web.entity.Pro;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Map;

//修改购物车
@WebServlet("/updateCart")
public class UpdateCartServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //获取前端的id
        Integer id = Integer.parseInt(request.getParameter("id"));
        Integer quantity = Integer.parseInt(request.getParameter("quantity"));

        //注意，这里我们已经重写了id的hashCode
        Pro pro = new Pro();
        pro.setId(id);

        HttpSession session = request.getSession();
        //获取我们存在session中的cart对象
        Map<Pro,Integer> cart = (Map<Pro,Integer>)session.getAttribute("cart");
        //如果商品的数据number为0的话，就直接删除对象
        if (quantity == 0) {
            //因为前端中是通过foreach来获取每一个商品的，所以每一个商品也是唯一的一个cart对象
            cart.remove(pro);
        }
        //判断如果找到与id相同的商品
        if (cart.containsKey(pro)) {
            //如果相同的话就更新对象
           cart.put(pro,quantity);
        }
        //把cart对象重新放回session域，更新数据
        session.setAttribute("cart",cart);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
