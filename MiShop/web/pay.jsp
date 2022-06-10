<%--
  Created by IntelliJ IDEA.
  User: Simon
  Date: 2020/2/11
  Time: 23:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="author" content="order by dede58.com"/>
    <title>小米商城-支付页面</title>
    <link rel="stylesheet" type="text/css" href="./css/style.css">
    <script src="./js/jquery-3.3.1.min.js"></script>
    <style type="text/css">
        table
        {
            width: 978px;
            border-collapse: collapse;
            margin: 0 auto;
            text-align: center;
        }
        table td, table th
        {
            border: 1px solid #cad9ea;
            color: #666;
            height: 30px;
        }
        table th
        {
            background-color: #CCE8EB;
            width: 100px;
        }
        table tr:nth-child(odd)
        {
            background: #fff;
        }
        table tr:nth-child(even)
        {
            background: #F5FAFA;
        }

        /*-------------------------------*/
        button {
            border: none;
            outline: none;
        }
        .ant-btn {
            line-height: 1.499;
            position: relative;
            display: inline-block;
            font-weight: 400;
            white-space: nowrap;
            text-align: center;
            background-image: none;
            border: 1px solid transparent;
            -webkit-box-shadow: 0 2px 0 rgba(0,0,0,0.015);
            box-shadow: 0 2px 0 rgba(0,0,0,0.015);
            cursor: pointer;
            -webkit-transition: all .3s cubic-bezier(.645, .045, .355, 1);
            transition: all .3s cubic-bezier(.645, .045, .355, 1);
            -webkit-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            user-select: none;
            -ms-touch-action: manipulation;
            touch-action: manipulation;
            height: 32px;
            padding: 0 15px;
            font-size: 14px;
            border-radius: 4px;
            color: rgba(0,0,0,0.65);
            background-color: #fff;
            border-color: #d9d9d9;
        }
        .ant-btn-red {
            color: #fff;
            background-color: #FF5A44;
            border-color: #FF5A44;
            text-shadow: 0 -1px 0 rgba(0,0,0,0.12);
            -webkit-box-shadow: 0 2px 0 rgba(0,0,0,0.045);
            box-shadow: 0 2px 0 rgba(0,0,0,0.045);
        }

    </style>
</head>
<body>
<!-- start header -->
<header>
    <div class="top center">
        <div class="left fl">
            <ul>
                <li><a href="./index.jsp" target="_blank">小米商城</a></li>
                <li>|</li>
                <li><a href="">MIUI</a></li>
                <li>|</li>
                <li><a href="">米聊</a></li>
                <li>|</li>
                <li><a href="">游戏</a></li>
                <li>|</li>
                <li><a href="">多看阅读</a></li>
                <li>|</li>
                <li><a href="">云服务</a></li>
                <li>|</li>
                <li><a href="">金融</a></li>
                <li>|</li>
                <li><a href="">小米商城移动版</a></li>
                <li>|</li>
                <li><a href="">问题反馈</a></li>
                <li>|</li>
                <li><a href="">Select Region</a></li>
                <div class="clear"></div>
            </ul>
        </div>
        <div class="right fr">
            <div class="gouwuche fr"><a href="">我的订单</a></div>
            <div class="fr">
                <c:if test="${empty user}">
                    <a href="${pageContext.request.contextPath}/login.jsp" style="color:lightgray"
                       class="login" target="_self">[登录]</a>
                    <span style="color:white">|</span>
                    <a href="${pageContext.request.contextPath}/register.jsp" style="color:lightgray"
                       class="register" target="_self">[注册]</a>
                </c:if>
                <c:if test="${!empty user }">
                    <a style="color:white" href="./self_info.jsp">欢迎您，${user.name}</a>
                    <a style="color:red"
                       href="${pageContext.request.contextPath}/logout">[安全退出]</a>
                </c:if>
            </div>
            <div class="clear"></div>
        </div>
        <div class="clear"></div>
    </div>
</header>
<!--end header -->
<!-- start banner_x -->
<div class="banner_x center">
    <a href="./index.jsp" target="_blank"><div class="logo fl"></div></a>
    <a href=""><div class="ad_top fl"></div></a>
    <div class="nav fl">
        <ul>
            <li class="menu_li" control="xiaomiphone">
                <a style="color: black;" href="search?cid=1">小米手机</a>
            </li>
            <li class="menu_li" control="hongmiphone">
                <a style="color: black;" href="search?cid=2">Redmi</a>
            </li>
            <li class="menu_li" control="pingban">
                <a style="color: black;" href="search?cid=6">平板</a>
            </li>
            <li class="menu_li" control="tv">
                <a style="color: black;" href="search?cid=5">笔记本</a>
            </li>
            <li class="menu_li" control="luyou">
                <a style="color: black;" href="search?cid=3">智能硬件</a>
            </li>
            <li class="menu_li" control="yingjian">
                <a style="color: black;" href="search?cid=4">音乐耳机</a>
            </li>
            <li><a>服务</a></li>
            <li><a>社区</a></li>
        </ul>
    </div>

    <div class="search fr">

        <%--这里是搜索框--%>
        <form method="post">
            <div class="text fl">
                <%-- 这个是用户输入用户名的输入框 --%>
                <input type="text" name="name" id="searchName" autocomplete="off"
                       class="shuru" placeholder="小米6&nbsp;小米MIX现货">
            </div>

            <div class="submit fl">
                <%--搜索按钮--%>
                <input type="button" class="sousuo" onclick="getByName()" value="搜索"/>
            </div>
            <div class="clear"></div>
        </form>

        <div class="clear"></div>
    </div>
</div>
<!-- end banner_x -->

<%--这里是提供给用户选择用的--%>
<div id="context1" style="
              height:130px;
              display:none ;
              width:250px;
              background-color:white;
              position:absolute;
              overflow:scroll;
              right: 203px;
              top: 116px;
              z-index:100;
              border: 1px #ccc solid">
</div>

<!-- self_info -->
<div>
    <%--<br>--%>
    <center>
        <h2 id="tab1" class="selected" name="tab" style="font-weight: 900;">交  易  付  款</h2>
    </center>
    <br>
    <%--只有当用户已经登陆的时候，user才不为空，这个时候才能进行展示操作，否则无法进行展示--%>
    <c:if test="${!empty user}">
        <%--<div class="ddxq">--%>
    <table border="1" cellspacing="0">

        <th>序号</th>
        <th>订单号</th>
        <th>付款状态</th>
        <th>下单时间</th>
        <th>发货状态</th>
        <th>付款用户</th>

        <c:forEach items="${list}" var="mso" varStatus="vs">

            <tr>
                <td>
                    <%--<img src="./image/gwc_xiaomi6.jpg" alt="">--%>
                    ${vs.count}
                </td>

                <td>
                    <%--当前产品的订单号--%>
                    <span id="msoid_span">${current_msoid}</span>
                </td>

                <td>
                    <%--付款状态--%>
                    <font style="color: red;">${mso.paystate}</font>
                </td>

                <td>
                    <%--下单时间--%>
                    ${mso.msoTime}
                </td>

                <td>
                    <%--发货状态--%>
                    <font style="color: red;">${mso.deliveryState}</font>
                </td>

                <td>
                    <%--付款用户名--%>
                    ${mso.msoname}
                </td>
            </tr>
        </c:forEach>

        <tr>
            <td colspan="6">
                    <%--这里不变--%>
                <font style="color: darkolivegreen;font-weight: bolder">合计：</font><font style="color: red;font-weight: bolder">${amount}元</font>
            </td>
        </tr>
    </table>

    </c:if>

    <%--如果用户没有登陆的话--%>
    <c:if test="${empty user}">
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <center>系统检测到您暂未登录！请登录后在进行此操作！</center>
    <center>请点击此处进行<a href="login.jsp" style="color: blue">登录</a></center>
    </c:if>
<!-- self_info -->
        <br>
        <center>
            <div style="width: 60px;display: inline-block;margin-right: 70px">
                <button onclick="toAlipay()" class="ant-btn ant-btn-red">支付宝支付</button>
            </div>

            <div style="width: 60px;display: inline-block;margin-left: 70px">
                <button class="ant-btn ant-btn-red" id="fakePay" onclick="fakePay(${amount})">模拟支付</button>
            </div>
        </center>

<footer class="mt20 center">
    <div class="mt20">小米商城|MIUI|米聊|多看书城|小米路由器|视频电话|小米天猫店|小米淘宝直营店|小米网盟|小米移动|隐私政策|Select Region</div>
    <div>©mi.com 京ICP证110507号 京ICP备10046444号 京公网安备11010802020134号 京网文[2014]0059-0009号</div>
    <div>违法和不良信息举报电话：185-0130-1238，本网站所列数据，除特殊说明，所有数据均出自我司实验室测试</div>
</footer>

<script>

    $("#searchName").keyup(function() {
        //获取content输入框的内容
        var content =$(this).val();
        //如果输入框为空的话
        if(content=="")
        {
            //就不显示提示框
            $("#context1").css("display","none");
            return;
        }

        var time = new Date().getTime();
        $.ajax({
            url:'searchNames',
            type:'get',
            data:{pName:content,time:time},
            dataType:'json',
            success:function(data){
                var html="";
                for(var i =0;i<data.length;i++) {
                    html += "<div onclick='setSearch_onclick(this)' onmouseout='changeBackColor_out(this)'  " +
                        "onmouseover='changeBackColor_over(this)'>" + data[i].pName + "</div>";
                }
                $("#context1").html(html);
                $("#context1").css("display","block");
            },
            error:function()
            {
                alert('ajax执行失败');
            }
        });
    });

    function changeBackColor_over(div) {
        $(div).css("background-color","#CCCCCC");
    }

    function changeBackColor_out(div) {
        $(div).css("background-color","")
    }

    function setSearch_onclick(div) {
        $("#searchName").val(div.innerText);
        $("#context1").css("display","none");
    }

    //通过pName返回所有商品
    function getByName() {
        //获取pName的内容
        var pName = $("#searchName").val();
        //把pName传给后台
        window.location.href = "search?pName=" + pName;
    }

    //模拟支付
    function fakePay(money) {
        var msoid_pay = $("#msoid_span").text();

        if (confirm("是否确定要支付" + money + "元？")){
            window.location.href = "fakePay?msoid_pay=" + msoid_pay;
        }
    }

    //支付宝支付
    function toAlipay() {
        window.location.href = "alipayPage.jsp";
    }

</script>

</body>
</html>