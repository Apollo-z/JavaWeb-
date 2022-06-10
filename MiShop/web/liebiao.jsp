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
    <meta name="author" content="order by dede58.com"/>
    <title>小米手机列表</title>
    <link rel="stylesheet" type="text/css" href="./css/style.css">
    <link type="text/css" href="./css/style_select.css" rel="stylesheet" />
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

<!-- start banner_y -->
<!-- end banner -->

<!-- start danpin -->
<div class="danpin center">
    <div class="biaoti center" style="color: red;">
        共${pageBean.count}条相关商品信息
    </div>

    <div id="box" style="margin: auto;width: 1226px">
        <dl>
            <dt>价格：</dt>
            <%--这里可以直接指定价格传到servlet--%>
            <dd><a href="search?maxprice=200&minprice=1&cid=${cid}&pName=${pName}">1-200</a></dd>
            <dd><a href="search?maxprice=500&minprice=201&cid=${cid}&pName=${pName}">201-500</a></dd>
            <dd><a href="search?maxprice=1000&minprice=501&cid=${cid}&pName=${pName}">501-1000</a></dd>
            <dd><a href="search?maxprice=2000&minprice=1001&cid=${cid}&pName=${pName}">1001-2000</a></dd>
            <dd><a href="search?maxprice=5000&minprice=2001&cid=${cid}&pName=${pName}">2001-5000</a></dd>
            <dd><a href="search?maxprice=10000&minprice=5001&cid=${cid}&pName=${pName}">5001-10000</a></dd>
            <dd><a href="search?minprice=10001&cid=${cid}&pname=${pName}">10001以上</a></dd>
        </dl>

        <dl class="select" style="border-bottom-width: 0px;">
            <dt>已选条件：</dt>
        </dl>
    </div>

    <script src="./js/select.js"></script>
        <div class="main center">
            <c:forEach items="${pageBean.pros}" var="pro" varStatus="vs">
                <c:if test="${vs.count <= 5}">
                    <div class="mingxing fl mb20" style="border:2px solid #fff;width:230px;cursor:pointer;" onmouseout="this.style.border='2px solid #fff'" onmousemove="this.style.border='2px solid red'">
                        <%-- 这里放图片，通过点击图片的方式可以穿数据过去后台 --%>
                        <div class="sub_mingxing">
                            <a href="findById?id=${pro.id}" target="_blank">
                                <img src="${pageContext.request.contextPath}/${pro.pImg}" alt="">
                            </a>
                        </div>

                        <div class="pinpai"><a href="./xiangqing.jsp" target="_blank">${pro.pName}</a></div>
                        <div class="youhui">${pro.pSn}</div>
                        <div class="jiage">${pro.iPrice}</div>
                    </div>
                </c:if>
            </c:forEach>
        </div>
    <div class="clear"></div>
</div>

<div class="danpin center">
    <div class="main center">
        <c:forEach items="${pageBean.pros}" var="pro" varStatus="vs">
            <c:if test="${vs.count <= 10 and vs.count > 5}">
                <div class="mingxing fl mb20" style="border:2px solid #fff;width:230px;cursor:pointer;" onmouseout="this.style.border='2px solid #fff'" onmousemove="this.style.border='2px solid red'">
                    <div class="sub_mingxing">
                        <a href="findById?id=${pro.id}" target="_blank"><img src="${pageContext.request.contextPath}/${pro.pImg}" alt="">
                        </a>
                    </div>
                    <div class="pinpai"><a href="./xiangqing.jsp" target="_blank">${pro.pName}</a></div>
                    <div class="youhui">${pro.pSn}</div>
                    <div class="jiage">${pro.iPrice}</div>
                </div>
            </c:if>
        </c:forEach>
    </div>
    <div class="clear"></div>

    <%--分页组件--%>
    <div class="page" style="text-align: center">

        <a style="color: blue;" href="search?currentPage=${pageBean.currentPage==1?1:pageBean.currentPage-1}&maxprice=${maxprice}&minprice=${minprice}&cid=${cid}&pName=${pName}">
            上一页
        </a>
        &nbsp;&nbsp;

        <font style="color: black;">第${pageBean.currentPage}页 / 共${pageBean.totalPage}页&nbsp;&nbsp;</font>

        <a style="color: blue;" href="search?currentPage=${pageBean.currentPage == pageBean.totalPage?pageBean.totalPage:pageBean.currentPage+1}&maxprice=${maxprice}&minprice=${minprice}&cid=${cid}&pName=${pName}">
            下一页
        </a>

    </div>

</div>

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
