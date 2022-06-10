<%--
  Created by IntelliJ IDEA.
  User: Simon
  Date: 2020/2/10
  Time: 22:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>首页-小米商城</title>
    <link rel="stylesheet" href="css/xiaomi.css"/>
    <script type="text/javascript" src="./js/jquery-2.1.4.min.js"></script>
    <script src="js/jquery.animate-colors-min.js"></script>
    <style>
        .gouwuches {
            background: #ff6700;
        }

        .gouwuches:hover{
            background: darkgrey;
        }

    </style>
</head>
<body>
<div class="head_box">
    <div id="head_wrap">
        <div id="head_nav">
            <a class="head_nav_a">小米商城</a>
            <span>|</span>
            <a class="head_nav_a">MIUI</a>
            <span>|</span>
            <a class="head_nav_a">loT</a>
            <span>|</span>
            <a class="head_nav_a">云服务</a>
            <span>|</span>
            <a class="head_nav_a">金融</a>
            <span>|</span>
            <a class="head_nav_a">有品</a>
            <span>|</span>
            <a class="head_nav_a">下载app</a>
            <span>|</span>
            <a class="head_nav_a">问题反馈</a>
            <span>|</span>
            <a class="head_nav_a" id="Select_Region_but">Select Region</a>
        </div>
        <div id="head_right">
            <div id="head_landing">
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
            <div id="head_car">
                <div class="gouwuches">
                    <a style="color: white;font-size: 13px" href="./gouwuche.jsp" target="_blank">购物车</a>
                </div>

                <%--<a class="head_car_text">购物车（0）</a>--%>
                <%--<div id="car_content" style="height: 0px;width:0px ;background-color: #edffc6;z-index: 999">--%>
                    <%--<a class="car_text">啊啊啊啊</a>--%>
                <%--</div>--%>
            </div>
        </div>
    </div>
</div>

<div id="main_head_box">
    <div id="menu_wrap">
        <div id="menu_logo">
            <img src="img/xiaomi_logo.png">
        </div>
        <div id="menu_nav">
            <ul>
                <li class="menu_li" control="xiaomiphone">
                    <a  href="search?cid=1">小米手机</a>
                </li>
                <li class="menu_li" control="hongmiphone">
                    <a  href="search?cid=2">Redmi</a>
                </li>
                <li class="menu_li" control="pingban">
                    <a  href="search?cid=6">平板</a>
                </li>
                <li class="menu_li" control="tv">
                    <a  href="search?cid=7">电视</a>
                </li>
                <li class="menu_li" control="lap">
                    <a  href="search?cid=5">笔记本</a>
                </li>
                <li class="menu_li" control="watch">
                    <a  href="search?cid=3">智能硬件</a>
                </li>
                <li><a>服务</a></li>
                <li><a>社区</a></li>
            </ul>
        </div>

        <div id="find_wrap">
            <div id="find_bar">
                <input type="text" id="find_input" name="name" id="searchName" autocomplete="off"
                       class="shuru" placeholder="">
            </div>
            <div id="find_but" onclick="getByName()">
                <%--<input type="button" class="sousuo" onclick="getByName()" value="搜索"/>--%>
                GO
            </div>
        </div>

    </div>
</div>

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

<div id="menu_content_bg" style="height: 0px;">
    <div id="menu_content_wrap">
        <ul style="top: 0px;">
            <ul>
            <li id="xiaomiphone">
                <div class="menu_content">
                    <img src="">
                    <p class="menu_content_tit"></p>
                    <p class="menu_content_price"></p>
                </div>
                <div class="menu_content">
                    <img src="image_top/Xiaomi/XIaomiCivi1s.jpg">
                    <p class="menu_content_tit">XIaomiCivi1s</p>
                    <p class="menu_content_price">2499元起</p>
                </div>
                <span class="menu_content_line"></span>
                <div class="menu_content">
                    <img src="image_top/Xiaomi/XIaomiCivi.jpg">
                    <p class="menu_content_tit">XIaomiCivi</p>
                    <p class="menu_content_price">1999元起</p>
                </div>
                <span class="menu_content_line"></span>
                <div class="menu_content">
                    <img src="image_top/Xiaomi/XIaomi12pro.jpg">
                    <p class="menu_content_tit">XIaomi12pro</p>
                    <p class="menu_content_price">2999元起</p>
                </div>
                <span class="menu_content_line"></span>
                <div class="menu_content">
                    <img src="image_top/Xiaomi/xiaomi12.jpg">
                    <p class="menu_content_tit">XIaomi12</p>
                    <p class="menu_content_price">2499元起</p>
                </div>
                <span class="menu_content_line"></span>
                <div class="menu_content">
                    <img src="image_top/Xiaomi/xiaomi12x.jpg">
                    <p class="menu_content_tit">xiaomi12x</p>
                    <p class="menu_content_price">2499元起</p>
                </div>
                <span class="menu_content_line"></span>
                <div class="menu_content">
                    <img src="image_top/Xiaomi/xiaomi11青春版.jpg">
                    <p class="menu_content_tit">xiaomi11青春版</p>
                    <p class="menu_content_price">1999元起</p>
                </div>
            </li>
            </ul>
            <li id="hongmiphone">
                <div class="menu_content">
                    <img src="">
                    <p class="menu_content_tit"></p>
                    <p class="menu_content_price"></p>
                </div>
                <div class="menu_content">
                    <img src="image_top/Redmi/RedmiNote11Tpro.jpg">
                    <p class="menu_content_tit">RedmiNote11Tpro</p>
                    <p class="menu_content_price">2499元</p>
                </div>
                <span class="menu_content_line"></span>
                <div class="menu_content">
                    <img src="image_top/Redmi/RedmiNote11Tse.jpg">
                    <p class="menu_content_tit">RedmiNote11Tse</p>
                    <p class="menu_content_price">1999元</p>
                </div>
                <span class="menu_content_line"></span>
                <div class="menu_content">
                    <img src="image_top/Redmi/RedmiK50.jpg">
                    <p class="menu_content_tit">RedmiK50</p>
                    <p class="menu_content_price">1999元</p>
                </div>
                <span class="menu_content_line"></span>
                <div class="menu_content">
                    <img src="image_top/Redmi/Redmik50pro.jpg">
                    <p class="menu_content_tit">Redmik50pro</p>
                    <p  class="menu_content_price">2499元</p>
                </div>
            </li>
            <li id="pingban">
                <div class="menu_content">
                    <img src="">
                    <p class="menu_content_tit"></p>
                    <p class="menu_content_price"></p>
                </div>
                <div class="menu_content">
                    <img src="image_top/pad/pad1.jpg">
                    <p class="menu_content_tit">小米平板5</p>
                    <p class="menu_content_price">1799元</p>
                </div>
                <span class="menu_content_line"></span>
                <div class="menu_content">
                    <img src="image_top/pad/pad2.jpg">
                    <p class="menu_content_tit">小米平板5pro 5G</p>
                    <p class="menu_content_price">2499元</p>
                </div>
                <span class="menu_content_line"></span>
                <div class="menu_content">
                    <img src="image_top/pad/pad3.jpg">
                    <p class="menu_content_tit">小米平板5pro</p>
                    <p class="menu_content_price">1999元</p>
                </div>
            </li>
            <li id="lap">
                <div class="menu_content">
                    <img src="">
                    <p class="menu_content_tit"></p>
                    <p class="menu_content_price"></p>
                </div>
                <div class="menu_content">
                    <img src="image_top/LapTop/Lap1.jpg">
                    <p class="menu_content_tit">RedmiBook Pro 14 2022 锐龙版</p>
                    <p class="menu_content_price">4499元</p>
                </div>
                <span class="menu_content_line"></span>
                <div class="menu_content">
                    <img src="image_top/LapTop/Lap2.jpg">
                    <p class="menu_content_tit">RedmiBook Pro 15 2022 锐龙版
                    </p>
                    <p class="menu_content_price">4699元</p>
                </div>
                <span class="menu_content_line"></span>
                <div class="menu_content">
                    <img src="image_top/LapTop/Lap3.jpg">
                    <p class="menu_content_tit">Redmibook Pro 14 锐龙版</p>
                    <p class="menu_content_price">3799元</p>
                </div>
                <span class="menu_content_line"></span>
                <div class="menu_content">
                    <img src="image_top/LapTop/Lap4.jpg">
                    <p class="menu_content_tit">Redmi Book Pro 14 2022</p>
                    <p class="menu_content_price">4499</p>
                </div>
                <span class="menu_content_line"></span>
                <div class="menu_content">
                    <img src="image_top/LapTop/Lap5.jpg">
                    <p class="menu_content_tit">小米笔记本 Pro 14 锐龙版
                    </p>
                    <p class="menu_content_price">4299元</p>
                </div>
                <span class="menu_content_line"></span>
                <div class="menu_content">
                    <img src="image_top/LapTop/Lap6.jpg">
                    <p class="menu_content_tit">Redmi G 2021 锐龙版
                    </p>
                    <p class="menu_content_price">5999元</p>
                </div>
            </li>
            <li id="tv">
                <div class="menu_content">
                    <img src="">
                    <p class="menu_content_tit"></p>
                    <p class="menu_content_price"></p>
                </div>
                <div class="menu_content">
                    <img src="image_top/Tv/TV1.jpg">
                    <p class="menu_content_tit">红米电视X55 2022款 55英寸</p>
                    <p class="menu_content_price">2999元</p>
                </div>
                <span class="menu_content_line"></span>
                <div class="menu_content">
                    <img src="image_top/Tv/TV2.jpg">
                    <p class="menu_content_tit">红米电视X55 2022款 65英寸</p>
                    <p class="menu_content_price">3999元</p>
                </div>
                <span class="menu_content_line"></span>
                <div class="menu_content">
                    <img src="image_top/Tv/TV3.jpg">
                    <p class="menu_content_tit">小米电视6 65" OLED 65英寸</p>
                    <p class="menu_content_price">4399元</p>
                </div>
                <span class="menu_content_line"></span>
                <div class="menu_content">
                    <img src="image_top/Tv/TV4.jpg">
                    <p class="menu_content_tit">小米电视 大师 77" OLED 77英寸</p>
                    <p class="menu_content_price">14499元</p>
                </div>
                <span class="menu_content_line"></span>
                <div class="menu_content">
                    <img src="image_top/Tv/TV5.jpg">
                    <p class="menu_content_tit">小米透明OLED电视 55英寸
                    </p>
                    <p class="menu_content_price">21999元</p>
                </div>
                <span class="menu_content_line"></span>
                <div class="menu_content">
                    <img src="image_top/Tv/TV6.jpg">
                    <p class="menu_content_tit">小米电视 大师 65英寸OLED</p>
                    <p class="menu_content_price">8299元</p>
                </div>
            </li>
            <li id="watch">
                <div class="menu_content">
                    <img src="">
                    <p class="menu_content_tit"></p>
                    <p class="menu_content_price"></p>
                </div>
                <div class="menu_content">
                    <img src="image_top/watch/Redmi%20Buds%203%20青春版.png">
                    <p class="menu_content_tit">Redmi Buds 3 青春版</p>
                    <p class="menu_content_price">99元</p>
                </div>
                <span class="menu_content_line"></span>
                <div class="menu_content">
                    <img src="image_top/watch/Redmi%20Buds%203.png">
                    <p class="menu_content_tit">Redmi Buds 3&nbsp</p>
                    <p class="menu_content_price">199元</p>
                </div>
                <span class="menu_content_line"></span>
                <div class="menu_content">
                    <img src="image_top/watch/Xiaomi%20真无线降噪耳机%203%20Pro.png">
                    <p class="menu_content_tit">Xiaomi 真无线降噪耳机</p>
                    <p class="menu_content_price">379元</p>
                </div>
                <span class="menu_content_line"></span>
                <div class="menu_content">
                    <img src="image_top/watch/Redmi%20手表%202.jpg">
                    <p class="menu_content_tit">Redmi 手表 2</p>
                    <p class="menu_content_price">339元</p>
                </div>
                <span class="menu_content_line"></span>
                <div class="menu_content">
                    <img src="image_top/watch/小米手环6%20NFC版.jpg">
                    <p class="menu_content_tit">小米手环6 NFC</p>
                    <p class="menu_content_price">239元</p>
                </div>
                <span class="menu_content_line"></span>
                <div class="menu_content">
                    <img src="image_top/watch/Xiaomi%20Watch%20S1.png">
                    <p class="menu_content_tit">Xiaomi Watch S1</p>
                    <p class="menu_content_price">999元</p>
                </div>
            </li>
        </ul>
    </div>
</div>
<div id="big_banner_wrap">
    <ul id="banner_menu_wrap">
        <li class="active"img>
            <a href="search?cid=1">手机&nbsp;平板</a>
            <a class="banner_menu_i">&gt;</a>
            <div class="banner_menu_content" style="width: 600px; top: -20px;">
                <ul class="banner_menu_content_ul">
                    <li>
                        <a href="findById?id=1" target="_blank"><img src="image_top/phone/p1.jpg"></a>
                        <a href="findById?id=1" target="_blank">Note11 T pro+</a>

                    </li>
                    <li>
                        <a href="findById?id=2">
                            <img src="image_top/phone/p2.jpg">
                        </a>
                        <a href="findById?id=2">Note11 T pro</a>

                    </li>
                    <li>
                        <a href="findById?id=3">
                            <img src="image_top/phone/p3.jpg">
                        </a>
                        <a href="findById?id=3">Note11 T SE</a>
                    </li>
                    <li>
                        <a href="findById?id=4">
                            <img src="image_top/phone/p4.jpg">
                        </a>
                        <a href="findById?id=4">Xiaomi Civi1s</a>

                    </li>
                    <li>
                        <a href="findById?id=5">
                            <img src="image_top/phone/p5.jpg">
                        </a>
                        <a href="findById?id=5">Redmi K50</a>

                    </li>
                    <li>
                        <a href="findById?id=6">
                            <img src="image_top/phone/p6.jpg"></a>
                        <a href="findById?id=6">Redmi K50 pro</a>

                    </li>
                </ul>
                <ul class="banner_menu_content_ul">
                    <li>
                        <a href="findById?id=7">
                            <img src="image_top/phone/p7.jpg">
                        </a>
                        <a href="findById?id=7">Redmi K40s</a>

                    </li>
                    <li>
                        <a href="findById?id=8">
                            <img src="image_top/phone/p8.jpg"></a>
                        <a href="findById?id=8">Xiaomi 12</a>
                    </li>
                    <li>
                        <a href="findById?id=9"><img src="image_top/phone/p9.jpg"></a>
                        <a href="findById?id=9">Xiaomi 12pro</a>
                    </li>
                    <li>
                        <a href="findById?id=10"><img src="image_top/phone/p10.jpg"></a>
                        <a href="findById?id=10">Xiaomi 12X</a>
                    </li>
                    <li>
                        <a href="findById?id=11"><img src="image_top/phone/p11.jpg"></a>
                        <a href="findById?id=11">Xiaomi 11青春版</a>
                    </li>
                    <li>
                        <a href="findById?id=11"><img src="image_top/phone/p12.jpg"></a>
                        <a href="findById?id=11">Redmi Note 9pro</a>
                    </li>
                </ul>
            </div>
        </li>
        <li>
            <a href="search?cid=2">电视&nbsp;盒子</a>
            <a class="banner_menu_i">&gt;</a>
            <div class="banner_menu_content" style="width: 600px; top: -62px;">
                <ul class="banner_menu_content_ul">
                    <li>
                        <a><img src="img/tv40.jpg"></a><a>小米电视40英寸</a></li>
                    <li>
                        <a><img src="img/tv48.jpg"></a><a>小米电视48英寸</a></li>
                    <li>
                        <a><img src="img/tv49.jpg"></a><a>小米电视49英寸</a></li>
                    <li>
                        <a><img src="img/hezis.jpg"></a><a>小米电视55英寸</a></li>
                    <li>
                        <a><img src="img/hezis.jpg"></a><a>小米盒子MINI</a></li>
                </ul>
                <ul class="banner_menu_content_ul">
                    <li>
                        <a><img src="img/dianshipeijian.jpg"></a><a>小米电视配件</a>
                    </li>
                </ul>
            </div>
        </li>
        <li>
            <a href="search?cid=3">路由器&nbsp;智能配件</a>
            <a class="banner_menu_i">&gt;</a>
            <div class="banner_menu_content" style="width: 900px; top: -104px;">
                <ul class="banner_menu_content_ul">
                    <li>
                        <a><img src="img/miwifi.jpg"></a><a>小米路由器</a></li>
                    <li>
                        <a><img src="img/miwifilite.jpg"></a><a>小米路由器&nbsp;青春版</a></li>
                    <li>
                        <a><img src="img/air.jpg"></a><a>净化器</a></li>
                    <li>
                        <a><img src="img/xiaoyi.jpg"></a><a>摄像机</a></li>
                    <li>
                        <a><img src="img/scale.jpg"></a><a>体重称</a></li>
                    <li>
                        <a><img src="img/scale.jpg"></a><a>智能插头</a></li>
                </ul>
                <ul class="banner_menu_content_ul">
                    <li>
                        <a><img src="img/miwifimini.jpg"></a><a>小米路由器MINI</a></li>
                    <li>
                        <a><img src="img/wifiExtension.jpg"></a><a>小米WIFI放大器</a></li>
                    <li>
                        <a><img src="img/yicamera.jpg"></a><a>运动相机</a></li>
                    <li>
                        <a><img src="img/water.jpg"></a><a>净水器</a></li>
                    <li>
                        <a><img src="img/ihealth.jpg"></a><a>血压计</a></li>
                    <li>
                        <a><img src="img/ihealth.jpg"></a><a>床头灯</a></li>
                </ul>
                <ul class="banner_menu_content_ul">
                    <li>
                        <a><img src="img/zhinengtaozhuang.jpg"></a><a>智能家庭套装</a></li>
                    <li>
                        <a><img src="img/shouhuan.jpg"></a><a>小米手环</a></li>
                    <li>
                        <a><img src="img/smart.jpg"></a><a>全部智能硬件</a></li>
                </ul>
            </div>
        </li>
        <li>
            <a href="search?cid=4">移动电源&nbsp;插线板</a>
            <a class="banner_menu_i">&gt;</a>
            <div class="banner_menu_content" style="width: 300px; top: -146px;">
                <ul class="banner_menu_content_ul">
                    <li>
                        <a><img src="img/dianyuan.jpg "></a><a>小米移动电源</a></li>
                    <li>
                        <a><img src="img/powerscript.jpg"></a><a>小米插线板</a></li>
                    <li>
                        <a><img src="img/yidongdianyuan.jpg"></a><a>品牌移动电源</a></li>
                    <li>
                        <a><img src="img/dianyuanfujian.jpg"></a><a>移动电源附件</a></li>
                </ul>
            </div>
        </li>
        <li>
            <a href="search?cid=5">耳机&nbsp;音箱</a>
            <a class="banner_menu_i">&gt;</a>
            <div class="banner_menu_content" style="width: 300px; top: -188px;">
                <ul class="banner_menu_content_ul">
                    <li>
                        <a><img src="img/headphone.jpg"></a><a>小米头戴式耳机</a></li>
                    <li>
                        <a><img src="img/huosai.jpg"></a><a>小米活塞耳机</a></li>
                    <li>
                        <a><img src="img/bluetoothheadset.jpg"></a><a>小米蓝牙耳机</a></li>
                    <li>
                        <a><img src="img/erji.jpg"></a><a>品牌耳机</a></li>
                    <li>
                        <a><img src="img/yinxiang.jpg"></a><a>音箱</a></li>
                </ul>
            </div>
        </li>
        <li>
            <a href="search?cid=6">电池&nbsp;存储卡</a>
            <a class="banner_menu_i">&gt;</a>
            <div class="banner_menu_content" style="width: 300px; top: -230px;">
                <ul class="banner_menu_content_ul">
                    <li>
                        <a><img src="img/dianchi.jpg"></a><a>电池</a></li>
                    <li>
                        <a><img src="img/chongdian.jpg"></a><a>充电器</a></li>
                    <li>
                        <a><img src="img/xiancai.jpg"></a><a>线材</a></li>
                    <li>
                        <a><img src="img/cunchu.jpg"></a><a>存储卡</a></li>
                </ul>
            </div>
        </li>
        <li>
            <a href="search?cid=8">保护套&nbsp;后盖</a>
            <a class="banner_menu_i">&gt;</a>
            <div class="banner_menu_content" style="width: 300px; top: -272px;">
                <ul class="banner_menu_content_ul">
                    <li>
                        <a><img src="img/baohu.jpg"></a><a>保护套/保护壳</a></li>
                    <li>
                        <a><img src="img/hougai.jpg"></a><a>后盖</a></li>
                </ul>
            </div>
        </li>
        <li>
            <a href="search?cid=1">贴膜&nbsp;其它配件</a>
            <a class="banner_menu_i">&gt;</a>
            <div class="banner_menu_content" style="width: 600px; top: -314px;">
                <ul class="banner_menu_content_ul">
                    <li>
                        <a><img src="img/tiemo.jpg"></a><a>贴膜</a></li>
                    <li>
                        <a><img src="img/zipaigan.jpg"></a><a>自拍杆</a></li>
                    <li>
                        <a><img src="img/zipaigan.jpg"></a><a>蓝牙手柄</a></li>
                    <li>
                        <a><img src="img/tizhi.jpg"></a><a>贴纸</a></li>
                    <li>
                        <a><img src="img/fangchensai.jpg"></a><a>防尘塞</a></li>
                    <li>
                        <a><img src="img/fangchensai.jpg"></a><a>手机支架</a></li>
                </ul>
                <ul class="banner_menu_content_ul">
                    <li>
                        <a><img src="img/raoxian.jpg"></a><a>耳机绕线器</a></li>
                    <li>
                        <a><img src="img/wifi.jpg"></a><a>随身WIFI</a></li>
                </ul>
            </div>
        </li>
        <li>
            <a href="search?cid=3">米兔&nbsp;服装</a>
            <a class="banner_menu_i">&gt;</a>
            <div class="banner_menu_content" style="width: 300px; top: -356px;">
                <ul class="banner_menu_content_ul">
                    <li>
                        <a><img src="img/mitu.jpg"></a><a>米兔</a></li>
                    <li>
                        <a><img src="img/fuzhuang.jpg"></a><a>服装</a></li>
                </ul>
            </div>
        </li>
        <li>
            <a href="search?cid=2">背包&nbsp;其它周边</a>
            <a class="banner_menu_i">&gt;</a>
            <div class="banner_menu_content" style="width: 300px; top: -398px;">
                <ul class="banner_menu_content_ul">
                    <li>
                        <a><img src="img/bag.jpg"></a><a>背包</a></li>
                    <li>
                        <a><img src="img/shubiaodian.jpg"></a><a>大米鼠标坠</a></li>
                    <li>
                        <a><img src="img/zhoubian.jpg"></a><a>生活周边</a></li>
                    <li>
                        <a><img src="img/wan.jpg"></a><a>玩酷产品</a></li>
                </ul>
            </div>
        </li>
    </ul>
    <div id="big_banner_pic_wrap">
        <ul id="big_banner_pic">
            <li><img _href="findById?id=559" src="img/T1hiDvBvVv1RXrhCrK.jpg"></li>
            <li><img src="img/T1jrxjB_VT1RXrhCrK.jpg"></li>
            <li><img src="img/T1oTJjBKKT1RXrhCrK.jpg"></li>
            <li><a ><img src="img/T1RICjB7DT1RXrhCrK.jpg"></a></li>
            <li><img src="img/T1vWdTBKDv1RXrhCrK.jpg"></li>
        </ul>
    </div>
    <div id="big_banner_change_wrap">
        <div id="big_banner_change_prev"> &lt;</div>
        <div id="big_banner_change_next">&gt;</div>
    </div>
</div>
<div id="head_other_wrap">
    <div id="head_other">
        <ul>
            <li>
                <div id="div1">
                    <img width="24" src="img/menu1.PNG">
                    <p>小米秒杀</p>
                </div>
            </li>
            <li>
                <div id="div2">
                    <img width="24" src="img/menu2.PNG">
                    <p>企业团购</p>
                </div>
            </li>
            <li>
                <div id="div3">
                    <img width="24" src="img/menu3.PNG">
                    <p>F码通道</p>
                </div>
            </li>
            <li>
                <div id="div4">
                    <img width="24" src="img/menu4.PNG">
                    <p>米粉卡</p>
                </div>
            </li>
            <li>
                <div id="div5">
                    <img width="24" src="img/menu5.PNG">
                    <p>以旧换新</p>
                </div>
            </li>
            <li>
                <div id="div6">
                    <img width="24" src="img/menu6.PNG">
                    <p>话费充值</p>
                </div>
            </li>
        </ul>
    </div>
    <div class="head_other_ad"><a href="findById?id=580" target="_blank"><img src="img/T184E_BQWT1RXrhCrK.jpg"></a></div>
    <div class="head_other_ad"><a href="findById?id=578" target="_blank"><img src="img/T1yvd_BQDT1RXrhCrK.jpg"></a></div>
    <div class="head_other_ad"><a href="findById?id=565" target="_blank"><img src="img/T1mahQBmKT1RXrhCrK.jpg"></a></div>
</div>

<!--   广告图开始 -->
<div class="GuangGao">

</div>


<div id="main_show_box">
    <div class="idx-adv container">
        <a href=""><img src="image_index/横栏图/广告图1.png" alt=""></a>
    </div>
    <div class="floor_1">
        <div class="floor_head">
            <span class="title_span">手机</span>
        </div>
    </div>
    <div class="floor_goods_wrap">
        <ul>
            <li class="floor_goods_wrap_li">
                <a href="findById?id=584" target="_blank"><img src="img/T1IhLjBC_T1RXrhCrK.jpg"></a>
            </li>
            <li class="floor_goods_wrap_li">
                <a href="findById?id=583" target="_blank"  class="floor_goods_img"><img src="img/手机栏图2.jpg"></a>
                <a class="floor_goods_tit">Xiaomi Civi</a>
                <a class="floor_goods_txt">轻薄潮流设计 | 丝绒AG工艺 | 原生美肌人像 | 像素级肌肤焕新技术 | 3200万高清质感自拍 | 双柔光灯+自动对焦 | 3D曲面OLED柔性屏 | 120Hz+Dolby Vision | 4500mAh 大电量 | 55W有线闪充 | 立体声双扬声器 | 多功能NFC</a>
                <a class="floor_goods_price">2599 元</a>
            </li>
            <li class="floor_goods_wrap_li">
                <a href="findById?id=581" target="_blank" class="floor_goods_img"><img margin="20px auto" src="img/手机栏图3.jpg"></a>
                <a class="floor_goods_tit">Note 10 Pro</a>
                <a class="floor_goods_txt">天玑1100年度旗舰芯｜VC液冷散热｜120Hz旗舰变速金刚屏 ｜67W 闪充 5000mAh 大电池｜JBL 立体声双扬声器｜UFS 3.1｜6400万AI三摄｜多功能NFC 3.0</a>
                <a class="floor_goods_price">1499 元</a>
            </li>
            <li class="floor_goods_wrap_li">
                <a  href="findById?id=585" target="_blank" class="floor_goods_img"><img src="img/手机栏图4.jpg"></a>
                <a class="floor_goods_tit">Xiaomi MIX 4</a>
                <a class="floor_goods_txt">CUP全面屏 | 真彩原色 + 120Hz | 一体化轻量陶瓷机身 | 高通骁龙™888+ | WiFi 6 增强版 | 石墨烯「冰封」散热系统4500mAh 大电量 | 常温 120W 快充 | 50W 无线快充 | 1 亿像素电影相机</a>
                <a class="floor_goods_price">4499 元</a>
            </li>
            <li class="floor_goods_wrap_li">
                <a href="findById?id=582" target="_blank" class="floor_goods_img"><img src="img/手机栏图5.jpg"></a>
                <a class="floor_goods_tit">Note 10 5G</a>
                <a class="floor_goods_txt">5G小金刚｜旗舰长续航｜双5G待机｜5000mAh充电宝级大容量｜4800万高清相机｜天玑700八核高性能处理器</a>
                <a class="floor_goods_price">1099 元</a>
            </li>
            <li class="floor_goods_wrap_li">
                <a href="findById?id=584" target="_blank" class="floor_goods_img"><img src="img/手机栏图6.jpg"></a>
                <a class="floor_goods_tit">MIX FOLD折叠屏手机</a>
                <a class="floor_goods_txt">8.01''折叠大屏｜澎湃C1自研专业影像芯片｜液态镜头｜1亿像素｜骁龙888｜67W快充｜5020mAh超大电池｜LPDDR5满血版｜WiFi6（增强版）｜哈曼卡顿立体声四扬声器</a>
                <a class="floor_goods_price">6999 元元</a>
            </li>
            <li class="floor_goods_wrap_li">
                <a href="findById?id=580" target="_blank" class="floor_goods_img"><img src="img/手机栏图7.jpg"></a>
                <a class="floor_goods_tit">Xiaomi 11 Ultra</a>
                <a class="floor_goods_txt">1/1.12''GN2｜128°超广角｜120X超长焦｜2K四微曲屏｜骁龙888｜IP68级防水｜67W 有线闪充｜67W 无线闪充｜10W 无线反充｜5000mAh超大电池｜LPDDR5｜WiFi6（增强版）｜哈曼卡顿音频认证｜立体声双扬声器</a>
                <a class="floor_goods_price">3999 元</a>
            </li>
            <li class="floor_goods_wrap_li">
                <a href="findById?id=577" target="_blank" class="floor_goods_img"><img src="img/手机栏图8.jpg"></a>
                <a class="floor_goods_tit">Xiaomi 11 Pro</a>
                <a class="floor_goods_txt">1/1.12''GN2｜骁龙888｜2K四微曲屏｜IP68级防水｜67W 有线闪充｜67W 无线闪充｜10W 无线反充｜5000mAh超大电池｜LPDDR5｜WiFi6（增强版）｜哈曼卡顿音频认证｜立体声双扬声器</a>
                <a class="floor_goods_price">3369 元</a>
            </li>
            <li class="floor_goods_wrap_li">
                <a href="findById?id=579" target="_blank" class="floor_goods_img"><img src="img/手机栏图9.jpg"></a>
                <a class="floor_goods_tit">Xiaomi 11 青春活力版</a>
                <a class="floor_goods_txt">轻薄5G | 骁龙778G | 6400万主摄像头 | 柔性AMOLED 直屏 | 超线性立体声</a>
                <a class="floor_goods_price">1799 元</a>
            </li>
            <div style="clear:both;"></div>
        </ul>
    </div>


    <div class="floor_1">
        <div class="floor_head">
            <span class="title_span">智能穿戴</span>
        </div>
    </div>
    <div class="floor_goods_wrap">
        <ul>
            <li class="floor_goods_wrap_li">
                <a href="findById?id=588" target="_blank" ><img src="image_index/竖直导航栏图/智能穿戴.jpg"></a>
            </li>
            <li class="floor_goods_wrap_li">
                <a href="findById?id=562" target="_blank" class="floor_goods_img"><img src="image_index/智能栏图/智能1.jpg"></a>
                <a href="findById?id=562" target="_blank"class="floor_goods_tit">Xiaomi Watch S1</a>
                <a href="findById?id=562" target="_blank"class="floor_goods_txt">蓝宝石玻璃镜面 | 不锈钢中框 | 1.43”AMOLED大屏幕</a>
                <a href="findById?id=562" target="_blank"class="floor_goods_price">999 元</a>
            </li>
            <li class="floor_goods_wrap_li">
                <a href="findById?id=564" target="_blank" class="floor_goods_img"><img margin="20px auto" src="image_index/智能栏图/智能2.jpg"></a>
                <a href="findById?id=564" target="_blank"class="floor_goods_tit">Xiaomi 真无线降噪耳机 3</a>
                <a href="findById?id=564" target="_blank"class="floor_goods_txt">40dB宽频主动降噪 | HiFi高保真音质 | HRTF专业调音</a>
                <a href="findById?id=564" target="_blank"class="floor_goods_price">299 元</a>
            </li>
            <li class="floor_goods_wrap_li">
                <a href="findById?id=563" target="_blank" class="floor_goods_img"><img src="image_index/智能栏图/智能3.jpg"></a>
                <a href="findById?id=563" target="_blank"class="floor_goods_tit">Redmi 手表 2</a>
                <a href="findById?id=563" target="_blank"class="floor_goods_txt">1.6"AMOLED大屏 | 117种运动模式 | 24小时心率监测</a>
                <a href="findById?id=563" target="_blank"class="floor_goods_price">359 元</a>
            </li>
            <li class="floor_goods_wrap_li">
                <a href="findById?id=574" target="_blank" class="floor_goods_img"><img src="image_index/智能栏图/智能4.jpg"></a>
                <a href="findById?id=574" target="_blank" class="floor_goods_tit">小米手环6 NFC版</a>
                <a href="findById?id=574" target="_blank" class="floor_goods_txt">1.56" 跑道全面彩屏 | 30种运动模式 | 24小时心率监测</a>
                <a href="findById?id=574" target="_blank" class="floor_goods_price">229 元</a>
            </li>
            <li class="floor_goods_wrap_li">
                <a href="findById?id=565" target="_blank" class="floor_goods_img"><img src="image_index/智能栏图/智能5.jpg"></a>
                <a href="findById?id=565" target="_blank" class="floor_goods_tit">Xiaomi 真无线降噪耳机 3 Pro</a>
                <a href="findById?id=565" target="_blank" class="floor_goods_txt">40dB自适应降噪 ｜空间音频 ｜ HiFi高保真音质</a>
                <a href="findById?id=565" target="_blank" class="floor_goods_price">399元</a>
            </li>
            <li class="floor_goods_wrap_li">
                <a href="findById?id=566" target="_blank" class="floor_goods_img"><img src="image_index/智能栏图/智能6.jpg"></a>
                <a href="findById?id=566" target="_blank" class="floor_goods_tit">Redmi Buds 3</a>
                <a href="findById?id=566" target="_blank" class="floor_goods_txt">轻巧半入耳 | 通话降噪 | 20小时长续航</a>
                <a href="findById?id=566" target="_blank" class="floor_goods_price">129元</a>
            </li>
            <li class="floor_goods_wrap_li">
                <a href="findById?id=567" target="_blank" class="floor_goods_img"><img src="image_index/智能栏图/智能7.jpg"></a>
                <a href="findById?id=567" target="_blank" class="floor_goods_tit">Redmi Buds 3 青春版</a>
                <a href="findById?id=567" target="_blank" class="floor_goods_txt">轻巧真无线 | 猫耳状稳固设计 | 18小时长续航</a>
                <a href="findById?id=567" target="_blank" class="floor_goods_price">99元</a>
            </li>
            <li class="floor_goods_wrap_li">
                <a href="findById?id=561" target="_blank" class="floor_goods_img"><img src="image_index/智能栏图/智能9.jpg"></a>
                <a href="findById?id=561" target="_blank" class="floor_goods_tit">小米手环5 NFC版</a>
                <a href="findById?id=561" target="_blank" class="floor_goods_txt">多功能彩显大屏 | 磁吸式充电 | 14天超长续航</a>
                <a href="findById?id=561" target="_blank" class="floor_goods_price">189 元</a>
            </li>
            <div style="clear:both;"></div>
        </ul>
    </div>


    <div class="floor_1">
        <div class="floor_head">
            <span class="title_span">笔记本 | 平板</span>
        </div>
    </div>
    <div class="floor_goods_wrap">
        <ul>
            <li class="floor_goods_wrap_li">
                <a href="findById?id=573" target="_blank" ><img src="image_index/笔记本/lap0.jpg"></a>
            </li>
            <li class="floor_goods_wrap_li">
                <a href="findById?id=572" target="_blank" class="floor_goods_img"><img src="image_index/笔记本/lap1.jpg"></a>
                <a href="findById?id=572" target="_blank" class="floor_goods_tit">Redmi Book Pro 15 2022</a>
                <a href="findById?id=572" target="_blank" class="floor_goods_txt">全新12代英特尔处理器 |可选RTX 2050高性能独立显卡 | 3.2K 90Hz 原色超清屏</a>
                <a href="findById?id=572" target="_blank" class="floor_goods_price">5299 元</a>
            </li>
            <li class="floor_goods_wrap_li">
                <a href="findById?id=573" target="_blank" class="floor_goods_img"><img margin="20px auto" src="image_index/笔记本/lap2.jpg"></a>
                <a href="findById?id=573" target="_blank" class="floor_goods_tit">Redmi G 2021锐龙版</a>
                <a href="findById?id=573" target="_blank" class="floor_goods_txt">RTX™ 3050Ti光追独显与硬核锐龙芯梦幻联合，迎来游戏性能释放新境界。视野再突破</a>
                <a href="findById?id=573" target="_blank" class="floor_goods_price">5799 元</a>
            </li>
            <li class="floor_goods_wrap_li">
                <a href="findById?id=568" target="_blank" class="floor_goods_img"><img src="image_index/笔记本/lap3.jpg"></a>
                <a href="findById?id=568" target="_blank" class="floor_goods_tit">Pro 14 增强版 i5 独显 </a>
                <a href="findById?id=568" target="_blank" class="floor_goods_txt">2.5K超视网膜全面屏 | 一体精雕工艺 | Windows 11</a>
                <a href="findById?id=568" target="_blank" class="floor_goods_price">4799 元</a>
            </li>
            <li class="floor_goods_wrap_li">
                <a href="findById?id=569" target="_blank" class="floor_goods_img"><img src="image_index/笔记本/lap4.jpg"></a>
                <a href="findById?id=569" target="_blank" class="floor_goods_tit">RedmiBook Pro 15 R5/16G/512G 灰</a>
                <a href="findById?id=569" target="_blank" class="floor_goods_txt">3.2K 超清视网膜全面屏 | 微米级一体精雕工艺</a>
                <a href="findById?id=569" target="_blank" class="floor_goods_price">4499 元</a>
            </li>
            <li class="floor_goods_wrap_li">
                <a href="findById?id=575" target="_blank" class="floor_goods_img"><img src="image_index/笔记本/lap5.jpg"></a>
                <a href="findById?id=575" target="_blank" class="floor_goods_tit">Redmi Book Pro 14 2022</a>
                <a href="findById?id=575" target="_blank" class="floor_goods_txt">全新12代英特尔处理器 | Windows 11 家庭中文版 | 2.5K 120Hz高清屏 </a>
                <a href="findById?id=575" target="_blank" class="floor_goods_price">4499 元</a>
            </li>
            <li class="floor_goods_wrap_li">
                <a href="findById?id=570" target="_blank" class="floor_goods_img"><img src="image_index/笔记本/lap6.jpg"></a>
                <a href="findById?id=570" target="_blank" class="floor_goods_tit">小米平板5 Pro</a>
                <a href="findById?id=570" target="_blank" class="floor_goods_txt">骁龙870芯片 | 2.5K超高清｜120HZ高刷新率</a>
                <a href="findById?id=570" target="_blank" class="floor_goods_price">2949 元</a>
            </li>
            <li class="floor_goods_wrap_li">
                <a href="findById?id=571" target="_blank" class="floor_goods_img"><img src="image_index/笔记本/lap7.jpg"></a>
                <a href="findById?id=571" target="_blank" class="floor_goods_tit">RedmiBook Pro 14 R5</a>
                <a href="findById?id=571" target="_blank" class="floor_goods_txt">2.5K超视网膜全面屏 | 一体精雕工艺 | 轻薄本 | 智能互联</a>
                <a href="findById?id=571" target="_blank" class="floor_goods_price">3799 元</a>
            </li>
            <li class="floor_goods_wrap_li">
                <a href="findById?id=576" target="_blank" class="floor_goods_img"><img src="image_index/笔记本/lap8.jpg"></a>
                <a href="findById?id=576" target="_blank" class="floor_goods_tit">小米笔记本Pro 15</a>
                <a href="findById?id=576" target="_blank" class="floor_goods_txt">E4 OLED发光材质 | 3.5K 超视网膜屏 | 智能互联及MIUI+</a>
                <a href="findById?id=576" target="_blank" class="floor_goods_price">5999 元</a>
            </li>
            <div style="clear:both;"></div>
        </ul>
    </div>


</div>
<div id="foot_box">
    <div id="foot_wrap">
        <div class="foot_top">
            <ul>
                <li>1小时快修服务</li>
                <li class="font_top_i">|</li>
                <li>7天无理由退货</li>
                <li class="font_top_i">|</li>
                <li>15天免费换货</li>
                <li class="font_top_i">|</li>
                <li>满150元包邮</li>
                <li class="font_top_i">|</li>
                <li>520余家售后网点</li>
            </ul>
        </div>
        <div class="foot_bottom">
            <div class="foot_bottom_l">
                <dl>
                    <dt>帮助中心</dt>
                    <dd>购物指南</dd>
                    <dd>支付方式</dd>
                    <dd>配送方式</dd>
                </dl>
                <dl>
                    <dt>服务支持</dt>
                    <dd>售后政策</dd>
                    <dd>自助服务</dd>
                    <dd>相关下载</dd>
                </dl>
                <dl>
                    <dt>大米之家</dt>
                    <dd>大米之家</dd>
                    <dd>服务网点</dd>
                    <dd>预约亲临到店服务</dd>
                </dl>
                <dl>
                    <dt>关注我们</dt>
                    <dd>新浪微博</dd>
                    <dd>大米部落</dd>
                    <dd>官方微信</dd>
                </dl>
            </div>
            <div class="foot_bottom_r">
                <a>400-100-5678</a>
                <a>周一至周日 8:00-18:00</a>
                <a>（仅收市话费）</a>
                <span> 24小时在线客服</span>
            </div>
        </div>
    </div>
    <div class="foot_note_box">
        <div class="foot_note_wrap">
            <div class="foot_note_con">
                <span class="foot_logo"><img src="img/mi-logo.png" width="38px" height="38px"></span>
                <span class="foot_note_txt">
							<a>大米网</a><h>|</h><a>MIUI</a><h>|</h><a>米聊</a><h>|</h><a>多看书城</a><h>|</h><a>大米路由器</a><h>|</h><a>大米后院</a><h>|</h><a>大米天猫店</a><h>|</h><a>大米淘宝直营店</a><h>|</h><a>大米网盟</a><h>|</h><a>问题反馈</a><h>|</h><a>Select Region</a>
						    <a> 5555555号</a>
						</span>
            </div>

        </div>
    </div>
</div>

<script type="text/javascript" src="js/xiaomi.js"></script>
<script>

    $("#find_input").keyup(function() {
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
        $("#find_input").val(div.innerText);
        $("#context1").css("display","none");
    }

    //通过pName返回所有商品
    function getByName() {
        //获取pName的内容
        var pName = $("#find_input").val();
        //把pName传给后台
        window.location.href = "search?pName=" + pName;
    }

</script>

</body>
</html>