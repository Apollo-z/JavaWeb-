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
    <title>小米商城-确认订单</title>
    <link rel="stylesheet" type="text/css" href="./css/style.css">
    <script src="./js/jquery-3.3.1.min.js"></script>
    <link href="./css/public.css" type="text/css" rel="stylesheet"/>
    <link rel="stylesheet" type="text/css" href="./css/base.css"/>
    <script type="text/javascript" src="./js/jquery_cart.js"></script>
    <link rel="stylesheet" type="text/css" href="./css/checkOut.css"/>
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

<%------------------------------------------dingdan start-------------------------------%>

<!--收货地址body部分开始-->
<div class="border_top_cart">
    <script type="text/javascript">
        var checkoutConfig = {
            addressMatch: 'common',
            addressMatchVarName: 'data',
            hasPresales: false,
            hasBigTv: false,
            hasAir: false,
            hasScales: false,
            hasGiftcard: false,
            totalPrice: ${amount},
            postage: 10,//运费
            postFree: true,//活动是否免邮了
            bcPrice: 150,//计算界值
            activityDiscountMoney: 0.00,//活动优惠
            showCouponBox: 0,
            invoice: {
                NA: "0",
                personal: "1",
                company: "2",
                electronic: "4"
            }
        };
        var miniCartDisable = true;
    </script>
    <div class="container">
        <div class="checkout-box">
            <form id="checkoutForm" action="#" method="post">
                <div class="checkout-box-bd">
                    <!-- 地址状态 0：默认选择；1：新增地址；2：修改地址 -->
                    <input type="hidden" name="Checkout[addressState]" id="addrState" value="0">
                    <!-- 收货地址 -->
                    <div class="xm-box">
                        <div class="box-hd ">
                            <h2 class="title">收货地址</h2>
                        </div>
                        <div class="box-bd">
                            <div class="clearfix xm-address-list" id="checkoutAddrList">
                                <dl class="item">
                                    <font style="color: red;"><b>收货人：</b></font>
                                    <dt>
                                        <strong class="itemConsignee">${user.name}</strong>
                                        <span class="itemTag tag">地址</span>
                                    </dt>
                                    <dd>
                                        联系电话：<p class="tel itemTel">
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        ${user.telephone}</p>
                                        地址：<p class="itemRegion">
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        ${user.address}</p>
                                    </dd>

                                </dl>

                            </div>
                        </div>
                        <!-- 收货地址 END-->

                        <div id="checkoutPayment">

                            <!-- 支付方式 -->
                            <div class="xm-box">
                                <div class="box-hd ">
                                    <h2 class="title">支付配送</h2>
                                </div>
                                <div class="box-bd">
                                    <ul id="checkoutPaymentList" class="checkout-option-list clearfix J_optionList">
                                        <li class="item selected">
                                            <input type="radio" name="Checkout[pay_id]" checked="checked" value="1">
                                            <p>
                                                在线支付 <span></span>
                                            </p>
                                        </li>

                                        <li class="item selected">
                                            <input type="radio" data-price="0" name="Checkout[shipment_id]"
                                                   checked="checked" value="1">
                                            <p>
                                                快递配送（免运费） <span></span>
                                            </p>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <!-- 支付方式 END-->
                            <hr style="border: 1px solid red">
                        </div>

                    </div>
                    <div class="checkout-box-ft">
                        <!-- 商品清单 -->
                        <div id="checkoutGoodsList" class="checkout-goods-box">
                            <div class="xm-box">
                                <div class="box-hd">
                                    <h2 class="title">确认订单信息</h2>
                                </div>
                                <div class="box-bd">
                                    <dl class="checkout-goods-list">
                                        <dt class="clearfix">
                                            <span class="col col-1">商品名称</span>
                                            <span class="col col-2">购买价格</span>
                                            <span class="col col-3">购买数量</span>
                                            <span class="col col-4">小计（元）</span>
                                        </dt>

                                        <%--只有当cart不为空的时候才能进行foreach--%>
                                        <c:if test="${!empty orderCart}">
                                            <c:forEach items="${orderCart}" var="entry" varStatus="vs">
                                                <dd class="item clearfix">
                                                    <div class="item-row">
                                                        <div class="col col-1">
                                                            <%--<div class="g-pic">--%>
                                                                <%--<img src="http://i1.mifile.cn/a1/T11lLgB5YT1RXrhCrK!40x40.jpg"--%>
                                                                     <%--srcset="http://i1.mifile.cn/a1/T11lLgB5YT1RXrhCrK!80x80.jpg 2x"--%>
                                                                     <%--width="40" height="40"/>--%>
                                                            <%--</div>--%>
                                                            <div class="g-info">
                                                                <a href="#">
                                                                    ${entry.key.pName}&nbsp;&nbsp; ${entry.key.pSn}</a>
                                                            </div>
                                                        </div>

                                                        <div class="col col-2">${entry.key.iPrice}元</div>
                                                        <div class="col col-3">${entry.value}</div>
                                                        <div class="col col-4">${entry.key.iPrice*entry.value}元</div>
                                                    </div>
                                                </dd>
                                            </c:forEach>
                                        </dl>
                                    <div class="checkout-count clearfix">
                                        <!-- checkout-count-extend -->
                                        <div class="checkout-price">
                                            <p class="checkout-total">应付总额：<span><strong
                                                    id="totalPrice">${amount}</strong></span>元</p>
                                        </div>
                                        <!--  -->
                                    </div>

                                    </c:if>
                                </div>
                            </div>

                            <!--S 加价购 产品选择弹框 -->
                            <div class="modal hide modal-choose-pro" id="J_choosePro-664">
                                <div class="modal-header">
                                    <span class="close" data-dismiss='modal'><i class="iconfont">&#xe617;</i></span>
                                    <h3>选择产品</h3>
                                    <div class="more">
                                        <div class="xm-recommend-page clearfix">
                                            <a class="page-btn-prev   J_carouselPrev iconfont" href="javascript: void(0);">&#xe604;</a><a
                                                class="page-btn-next  J_carouselNext iconfont" href="javascript: void(0);">&#xe605;</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-body J_chooseProCarousel">
                                    <div class="J_carouselWrap modal-choose-pro-list-wrap">
                                        <ul class="clearfix J_carouselList">
                                        </ul>
                                    </div>
                                </div>
                            </div>

                        </div>
                        <!-- 商品清单 END -->
                        <input type="hidden" id="couponType" name="Checkout[couponsType]">
                        <input type="hidden" id="couponValue" name="Checkout[couponsValue]">
                        <div class="checkout-confirm">

                            <a href="./gouwuche.jsp" class="btn btn-lineDakeLight btn-back-cart">返回购物车</a>
                            <%--只有orderCart对象不为空的时候才能提交--%>
                            <c:if test="${!empty orderCart}">
                                <a onclick="checkoutToPay()" class="btn btn-primary">立即下单</a>
                            </c:if>

                            <c:if test="${empty orderCart}">
                                <a class="btn btn-primary">暂无订单</a>
                            </c:if>
                        </div>
                    </div>
                </div>

            </form>
        </div>

        <!-- 保险弹窗 -->
        <!-- 保险弹窗 -->

        <script src="js/base.min.js"></script>
        <script type="text/javascript" src="js/address_all.js"></script>
        <script type="text/javascript" src="js/checkout.min.js"></script>
    </div>


    <script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>
    <script src="js/unslider.min.js" type="text/javascript"></script>
    <%--<script src="js/index.js" type="text/javascript"></script>--%>

<%-------------------------dingdan end！----------------------------------------------%>

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

    //跳转到提交订单的servle
    function checkoutToPay(){
        if(confirm("是否确定要立即支付？确认之后此页面即将提交到支付页面！")){
            window.location.href = "submitOrder";
        }
    }

</script>

</body>
</html>
