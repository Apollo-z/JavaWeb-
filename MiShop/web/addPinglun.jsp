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
    <title>小米商城-添加评论</title>
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

        table tr td input {
            text-align: center;
            font-size: 15px;
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
            <div class="gouwuche fr"><a href="./dingdanzhongxin.jsp">我的订单</a></div>
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


<%--pinglun start--%>

<%--<br>--%>
<center>
    <h2 id="tab1" class="selected" name="tab" style="font-weight: 900;">【新  增  评  论】</h2>
</center>
<br>

<%--新增评论--%>
<form action="addPinglun" method="get">

    <%--如果评论对象不为空的话才能显示--%>
    <c:if test="${!empty user}">
        <%--<div class="ddxq">--%>
        <table border="1" cellspacing="0">

            <th>用户名</th>
            <th>用户ID</th>
            <th>产品PROID</th>
            <th>订单号</th>
            <th>评论内容</th>
            <th>产品打分</th>
            <tr>
                <td>
                    <%--用户名，只读--%>
                    <input name="name" type="text" value="${user.name}" readonly="readonly">
                </td>

                <td>
                        <%--用户id，只读--%>
                    <input name="userid" type="text" value="${userid}" readonly="readonly">
                </td>

                <td>
                        <%--产品编号，只读--%>
                    <input name="proid" type="text" value="${proid}"  readonly="readonly">
                </td>

                <td>
                        <%--订单号，只读--%>
                    <input name="msoid" type="text" value="${msoid}" readonly="readonly">
                </td>

                <td>
                        <%--评论内容--%>
                    <input name="comments" type="text">
                </td>

                <td>
                        <%--打分--%>
                    <%--<input name="score" type="text">--%>
                    <select name="score" style="width: 70px;">
                           <option value="1">1</option>
                           <option value="2">2</option>
                           <option value="3">3</option>
                           <option value="4">4</option>
                           <option value="5">5</option>
                           <option value="6">6</option>
                           <option value="7">7</option>
                           <option value="8">8</option>
                           <option value="9">9</option>
                           <option value="10">10</option>
                    </select>
                </td>
            </tr>

            <tr>
                <td colspan="6">
                    <center>
                        <input style="
                            width: 90px;height: 40px;background-color: orangered;color: whitesmoke;
                            font-weight: bolder;border-radius: 10px;
                            " type="submit" value="提交评论">
                    </center>
                </td>
            </tr>

            <tr>
                <td colspan="6">
                        <%--这里不变--%>
                    <font style="color: darkolivegreen;font-weight: bolder">【小米商城】</font>
                    <font style="color: red;font-weight: bolder">版权所有</font>
                </td>
            </tr>
        </table>
    </c:if>
</form>


<%--pinglun end！--%>

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
