package com.ysw.web.servlet;

import com.ysw.web.entity.*;
import com.ysw.web.service.MsoService;
import com.ysw.web.utils.TimeUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

@WebServlet("/submitOrder")
public class SubmitOrderServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=utf-8");

        //封装Mso对象传递给service
        Mso mso = new Mso();

        //生成订单号
        mso.setMsoid(TimeUtils.getDingdanNumber());
        session.setAttribute("current_msoid",mso.getMsoid());
        //--------- 这里一定要同步设置 ---------

        //设置下单时间
        mso.setMsoTime(TimeUtils.getTime());

        /**
         * 注意：
         *      mso中的单笔交易总价是来自于前端计算的
         *      而msoxq中每一个商品的总价，是自己通过orderCart来进行计算得到的
         */

        //获取购物车的总价
        Double amount = (Double)session.getAttribute("amount");
        mso.setSubtotal(amount);

        //支付状态
        String state = "未付款";
        mso.setPayState(state);

        //用一个user接收我们的user对象
        User user = (User) session.getAttribute("user");

        //如果用户不为空的话则说明登录成功
        if (user != null){

            //设置收货人姓名
            mso.setMsoname(user.getName());

            //设置收货人id
            mso.setUserid(user.getId());
//            System.out.println("当前用户名为" + mso.getMsoname());  //测试用户名
            //设置收货地址
            mso.setAddress(user.getAddress());

            //设置联系电话
            mso.setTelephone(user.getTelephone());


        } else {
            //如果用户为空的话就直接跳转到登陆界面
            response.sendRedirect("login.jsp");
        }

        //用一个map集合来接收orderCart，这个是我们筛选好的商品集合
        Map<Pro,Integer> orderCart = (Map<Pro,Integer>) session.getAttribute("orderCart");
        //遍历，创建订单明细表，一对多关系，一个订单对应多个订单明细
        for (Map.Entry<Pro,Integer> entry : orderCart.entrySet()) {
            Msoxq msoxq = new Msoxq();
            msoxq.setPro(entry.getKey());   //获取每一个pro对象
            msoxq.setCount(entry.getValue());   //获取每一个pro对象的商品数量
            msoxq.setMso(mso);
            msoxq.setpImg("aaaa");  //图片暂时自定义

            //将该订单项添加到订单的订单项集合中
            mso.getMsoxqs().add(msoxq);
        }

        //提交到service层
        MsoService msoService = new MsoService();
        msoService.submitMso(mso);  //保存到数据库

        //清空购物车（只清除已购买的部分）,重新获取我们的cart对象
        Map<Pro,Integer> cart = (Map<Pro,Integer>)session.getAttribute("cart");
        for (Pro pro : orderCart.keySet()) {
            //如果cart中包含了这个orderCart集合中的pro对象的话，就直接移除
            if (cart.containsKey(pro)) {
                //移除已经支付了的cart对象
                cart.remove(pro);
            }
        }

        //通过msoid获取一个订单集合
        List<UserMso> list = msoService.findMsoByMsoId(mso.getMsoid());

        //重新更新购物车,覆盖旧的cart对象
        session.setAttribute("cart",cart);
        session.removeAttribute("orderCart");
        session.setAttribute("list",list);  //根据当前订单号返回的订单集合
        session.setAttribute("mso",mso);
        //跳转到支付页面
        response.sendRedirect("pay.jsp");

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
