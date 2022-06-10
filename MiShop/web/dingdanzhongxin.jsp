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
    <title>小米商城-订单中心</title>
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
    <a href="./index.html" target="_blank"><div class="logo fl"></div></a>
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
                       class="shuru" placeholder="">
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
<div class="grzxbj">
    <div class="selfinfo center">
        <div class="lfnav fl">
            <div class="ddzx">订单中心</div>
            <div class="subddzx">
                <ul>
                    <li><a href="./dingdanzhongxin.jsp" style="color:#ff6700;font-weight:bold;">我的订单</a></li>
                </ul>
            </div>
            <div class="ddzx">个人中心</div>
            <div class="subddzx">
                <ul>
                    <li><a href="./self_info.jsp">我的个人中心</a></li>
                </ul>
            </div>
        </div>
        <div class="rtcont fr">
            <div class="ddzxbt">交易订单</div>

            <%--只有当用户已经登陆的时候，user才不为空，这个时候才能进行展示操作，否则无法进行展示--%>
            <c:if test="${!empty user}">
                <%--<div class="ddxq">--%>
                <table border="1" cellspacing="0">

                    <th>序号</th>
                    <th>订单号</th>
                    <th>付款状态</th>
                    <th>单品价 / 总价</th>
                    <th>购买时间</th>
                    <th>发货状态</th>

                    <c:forEach items="${userMsos}" var="userMso" varStatus="vs">

                            <tr>
                                <td>
                                        <%--<img src="./image/gwc_xiaomi6.jpg" alt="">--%>
                                    <span>${vs.count}</span>
                                </td>

                                <td id="msoid_spans">
                                        <span id="msoid_span" value="${userMso.msoid}">${userMso.msoid}</span>
                                </td>

                                <%--判断用户是否已经支付，如果未付款的话可以立即去支付--%>
                                <c:if test="${userMso.paystate == '已付款'}">
                                    <td>
                                        <font style="color: red;">【${userMso.paystate}】</font>
                                        <br>
                                        <%--此处放的是产品的id  style="display: none"--%>
                                        <button id="proid_button" style="display: none;">${userMso.proid}</button>
                                        <a onclick="topinglun(this)" style="color: blue;font-size: 13px;cursor: pointer;">评价</a>
                                    </td>
                                </c:if>

                                <c:if test="${userMso.paystate != '已付款'}">
                                    <td>
                                        <font style="color: red;">【${userMso.paystate}】</font>
                                        <br>
                                        <font style="color: red;">
                                            <a onclick="topay(this)" style="color: blue;font-size: 13px;cursor: pointer;">立即付款</a>
                                        </font>
                                    </td>
                                </c:if>

                                <td>
                                    ￥${userMso.singleprototal}&nbsp;/
                                    ￥<span id="totalmoney">${userMso.subtotal}</span>
                                </td>

                                <td>
                                        ${userMso.msoTime}
                                </td>

                                <c:if test="${userMso.deliveryState == '已收货'}">
                                    <td>
                                        <font style="color: red;">${userMso.deliveryState}</font><br>
                                        <button id="delete_msoid" style="display: none;">${userMso.msoid}</button>
                                        <a style="color: blue;font-size: 13px;cursor: pointer;" onclick="deleteMsoid(this)">删除订单</a>
                                    </td>
                                </c:if>

                                <%--如果订单状态为未发货的话，就需要从管理端进行发货处理--%>
                                <c:if test="${userMso.deliveryState == '未发货'}">
                                    <td>
                                        <font style="color: red;">${userMso.deliveryState}</font>
                                    </td>
                                </c:if>

                                <c:if test="${userMso.deliveryState == '已发货'}">
                                    <td>
                                        <font style="color: red;">${userMso.deliveryState}</font><br>
                                        <%--<button id="delete_msoid" style="display: none;">${userMso.msoid}</button>--%>
                                        <button id="msoid_update" style="display: none;">${userMso.msoid}</button>
                                        <a style="color: blue;font-size: 13px;cursor: pointer;" onclick="querenShouhuo(this)">确认收货</a>
                                    </td>
                                </c:if>
                            </tr>
                    </c:forEach>
                </table>
                    <br>
                    <br>
                    <br>
                    <br>
                    </c:if>

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
                    <div class="clear"></div>

                <%--</div>--%>
            </div>
        <%--<div class="clear"></div>--%>
    </div>
</div>
<!-- self_info -->

<%--<footer class="mt20 center">--%>
    <%--<div class="mt20">小米商城|MIUI|米聊|多看书城|小米路由器|视频电话|小米天猫店|小米淘宝直营店|小米网盟|小米移动|隐私政策|Select Region</div>--%>
    <%--<div>©mi.com 京ICP证110507号 京ICP备10046444号 京公网安备11010802020134号 京网文[2014]0059-0009号</div>--%>
    <%--<div>违法和不良信息举报电话：185-0130-1238，本网站所列数据，除特殊说明，所有数据均出自我司实验室测试</div>--%>
<%--</footer>--%>

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

    // var current_msoid_span = $(this).text();
    // $(this).attr("value");

    //这里是跳转到支付页面的
    function topay(dom) {
        var current_msoid_span = $(dom).parent().parent().prev().find("span").text();
        //获取单笔总价
        // var current_msoid_span = $(dom).parent().parent().prev().find("span").text();
        var totalMoney = $(dom).parent().parent().next().find("span").text()
        window.location.href = "findDingdanById?msoid_span=" + current_msoid_span + "&totalMoney=" + totalMoney;
    }

    //用户评论函数
    function topinglun(dom) {
        //获取订单编号
        var msoid_span = $(dom).parent().prev().find("span").text();
        // alert(msoid_span);   //输出测试
        var proid = $(dom).prev().text();
        // alert(proid);    //输出测试
        window.location.href = "toPingLun?msoid_span=" + msoid_span + "&proid=" + proid;
    }

    //删除订单
    function deleteMsoid(dom) {
        var msoid = $(dom).prev().text();
        // alert(msoid);        //测试
        if(confirm("确定要删除该订单信息？")){
            window.location.href = "deleteByMsoid?msoid_delete=" + msoid;
        }
    }

    //根据点击的情况，把已发货的商品收到之后就确认收货
    function querenShouhuo(dom) {
        var msoid = $(dom).prev().text();
        // alert(msoid);        //测试
        if(confirm("是否确定已经收货？")){
            window.location.href = "querenShouhuo?msoid_update=" + msoid;
        }
    }

</script>

</body>
</html>