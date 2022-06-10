<%--
  Created by IntelliJ IDEA.
  User: Simon
  Date: 2020/2/11
  Time: 23:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>小米商城-个人中心</title>
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
                <li><a href="">loT</a></li>
                <li>|</li>
                <li><a href="">云服务</a></li>
                <li>|</li>
                <li><a href="">金融</a></li>
                <li>|</li>
                <li><a href="">有品</a></li>
                <li>|</li>
                <li><a href="">企业团购</a></li>
                <li>|</li>
                <li><a href="">下载app</a></li>
                <li>|</li>
                <li><a href="">问题反馈</a></li>
                <li>|</li>
                <li><a href="">Select Region</a></li>
                <div class="clear"></div>
            </ul>
        </div>
        <div class="right fr">
            <div class="gouwuche fr"><a href="showDingdan">我的订单</a></div>
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
                    <li><a href="showDingdan" >我的订单</a></li>

                </ul>
            </div>
            <div class="ddzx">个人中心</div>
            <div class="subddzx">
                <ul>
                    <li><a href="./self_info.jsp" style="color:#ff6700;font-weight:bold;">我的个人中心</a></li>
                </ul>
            </div>
        </div>
        <div class="rtcont fr">
            <div class="grzlbt ml40">我的资料</div>
            <c:if test="${!empty user}">
                <div class="subgrzl ml40"><span>昵称</span><span>${user.name}</span><span><a href="./self_update.jsp">编辑资料</a></span></div>
                <div class="subgrzl ml40"><span>手机号</span><span>${user.telephone}</span></div>
                <div class="subgrzl ml40"><span>密码</span><span>************</span></div>
                <div class="subgrzl ml40"><span>个性签名</span><span>${user.gexing}</span></div>
                <div class="subgrzl ml40"><span>我的爱好</span><span>${user.hobby}</span></div>
                <div class="subgrzl ml40"><span>收货地址</span><span>${user.address}</span></div>
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

            </div>
        </div>
        <div class="clear"></div>
    </div>
</div>
<!-- self_info -->

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

</script>

</body>
</html>
