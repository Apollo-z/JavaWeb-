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
    <title>立即购买-小米商城</title>
    <link rel="stylesheet" type="text/css" href="./css/style.css">
    <script src="./js/jquery-3.3.1.min.js"></script>
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
            <div class="gouwuche fr"><a href="./gouwuche.jsp" target="_blank">购物车</a></div>
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
                       class="shuru" placeholder="小米11&nbsp;">
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

<!-- xiangqing -->
<form action="post" method="">
    <div class="xiangqing">
        <div class="neirong w">
            <%--产品名--%>
            <div class="xiaomi6 fl">${pro.pName}</div>
            <nav class="fr">
                <li><a href="">概述</a></li>
                <li>|</li>
                <li><a href="">设计</a></li>
                <li>|</li>
                <li><a href="">参数</a></li>
                <li>|</li>
                <li><a href="getCommentByProid?proid=${pro.id}">用户评价</a></li>
                <li>|</li>
                <li><a href="./index.jsp">返回首页</a></li>
                <div class="clear"></div>
            </nav>
            <div class="clear"></div>
        </div>
    </div>

    <div class="jieshao mt20 w">
        <div class="left fl"><img style="width: 562px;height: 562px;"
                                  src="${pageContext.request.contextPath}/${pro.pImg}">
        </div>
        <div class="right fr">
            <div class="h3 ml20 mt20">${pro.pName}</div>
            <div class="jianjie mr40 ml20 mt10">${pro.pSn}</div>
<%--            <div class="jiage ml20 mt10">一流的品质，一流的服务，一流的保障</div>--%>
            <div class="ft20 ml20 mt20">市场原价</div>
            <div class="xzbb ml20 mt10">
                <div class="banben fl">
                    <a style="text-align: center">
                        <span style="text-decoration:line-through;">中介渠道&nbsp;&nbsp;市场原价</span>
                        <span style="color: #ff6700;text-decoration:line-through;">${pro.mPrice}元</span>
                    </a>
                </div>
                <div class="clear"></div>
            </div>
            <div class="ft20 ml20 mt20">商城价格</div>
            <div class="xzbb ml20 mt10">
                <div class="banben">
                    <a style="text-align: center">
                        <span>限时秒杀&nbsp;&nbsp;尽享折扣</span>
                        <span style="color: #ff6700;">${pro.iPrice}元</span>
                    </a>
                </div>

            </div>
            <div class="xqxq mt20 ml20">
                <div class="top1 mt10">
                    <div class="left1 fl">${pro.pName} ${pro.pSn}</div>
                    <div class="right1 fr">${pro.iPrice}元</div>
                    <div class="clear"></div>
                </div>
                <div class="bot mt20 ft20 ftbc">总计：${pro.iPrice}元</div>
            </div>
            <div class="xiadan ml20 mt20">
                <a href="http://localhost:8080/MiShop/gouwuche.jsp"><input class="jrgwc" onclick="addToCart(${pro.id})" type="button" name="jrgwc" value="立即选购" /></a>
                <%--这里要把商品传过去购物车--%>
                <input class="jrgwc" onclick="addToCart(${pro.id})" type="button" name="jrgwc" value="加入购物车" />
            </div>
        </div>
        <div class="clear"></div>
    </div>
</form>
<!-- footer -->
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

    //把当前的id传到购物车
    function addToCart(id) {
        // alert(id);//测试一下id是否传正确
        $.ajax({
            url : "addToCart",
            type : "get",
            data : "id=" + id,
            success : function (data) { //回调函数
                if ("true" == data){
                    alert("添加购物车成功！");
                } else {
                    alert("库存不足");
                }
            },
            error : function () {
                alert("ajax执行失败！");
            }
        });
        <%--window.location.href = "addToCart?id=" + ${pro.id};--%>
    }

</script>

</body>
</html>