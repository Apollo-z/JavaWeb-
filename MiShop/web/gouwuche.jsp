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
    <title>我的购物车-小米商城</title>
    <script src="./js/jquery-3.3.1.min.js"></script>
    <link rel="stylesheet" type="text/css" href="./css/style.css">
    <link rel="stylesheet" href="./css/reset.css">
    <link rel="stylesheet" href="./css/carts.css">
    <link rel="stylesheet" href="./css/bootstrap.min.css">
</head>
<body>

<!-- start header -->
<!--end header -->

    <!-- start banner_x -->
    <div class="banner_x center">
    <a href="./index.jsp" target="_blank"><div class="logo fl"></div></a>

    <div class="wdgwc fl ml40">我的购物车</div>
    <div class="wxts fl ml20">温馨提示：产品是否购买成功，以最终下单为准哦，请尽快结算</div>
    <div class="dlzc fr">

        <c:if test="${empty user}">
            <a href="${pageContext.request.contextPath}/login.jsp" style="color:black"
                class="login" target="_self">[登录]</a>
            <span style="color:black">|</span>
            <a href="${pageContext.request.contextPath}/register.jsp" style="color:black"
                class="register" target="_self">[注册]</a>
        </c:if>

        <c:if test="${!empty user}">
            <a style="color:black" href="./self_info.jsp">欢迎您，${user.name}</a>
            <a style="color:red" href="${pageContext.request.contextPath}/logout">[安全退出]</a>
        </c:if>
    </div>
        <div class="clear"></div>
    </div>
    <div class="xiantiao"></div>
</div>

    <%--购物车详情--%>
    <section class="cartMain">
        <div class="cartMain_hd">
            <ul class="order_lists cartTop">
                <li class="list_chk">
                    <!--所有商品全选-->
                    <input type="checkbox" id="all" class="whole_check">
                    <label for="all"></label>
                    全选
                </li>
                <li class="list_con">商品信息</li>
                <li class="list_info">商品参数</li>
                <li class="list_price">单价</li>
                <li class="list_amount">数量</li>
                <li class="list_sum">金额</li>
                <li class="list_op">操作</li>
            </ul>
        </div>

        <div class="cartBox">
            <div class="order_content">

                <%--只有当cart对象不为空的时候才能执行foreach遍历--%>
                <c:if test="${!empty cart}">
                    <c:forEach items="${cart}" var="entry" varStatus="vs">

                        <%--商品列表--%>
                        <ul class="order_lists" value="${entry.key.id}">
                            <li class="list_chk">
                                <input type="checkbox" id="checkbox_${vs.count}" class="son_check" value="${entry.key.id}">
                                <label for="checkbox_${vs.count}"></label>
                            </li>
                            <li class="list_con">
                                <div class="list_img">
                                    <a href="findById?id=${entry.key.id}" target="_blank">
                                        <img src="${pageContext.request.contextPath}/${entry.key.pImg}" alt="">
                                    </a>
                                </div>
                                <div class="list_text">
                                    <a href="findById?id=${entry.key.id}" target="_blank">
                                        ${entry.key.pName}
                                    </a>
                                    <font style="color: #9c9c9c;">${entry.key.pSn}</font>
                                </div>
                            </li>
                            <li class="list_info">
                                <p>市场原价</p>
                                <p style="text-decoration:line-through;">${entry.key.mPrice}元</p>
                            </li>
                            <li class="list_price">
                                <p class="price">￥${entry.key.iPrice}</p>
                            </li>
                            <li class="list_amount">
                                <div class="amount_box" value="${entry.key.id}">
                                    <a href="javascript:;" class="reduce reSty" value="${entry.key.id}">-
                                    </a>
                                    <input type="text" value="${entry.value}" class="sum" readonly="readonly">
                                    <a href="javascript:;" class="plus" value="${entry.key.id}">+
                                    </a>
                                </div>
                            </li>
                            <li class="list_sum">
                                <p class="sum_price">￥${entry.key.iPrice*entry.value}</p>
                            </li>
                            <li class="list_op">
                                <%--这里的this传的是当前对象p，entry.key.id也是foreach循环中的唯一变量--%>
                                <p class="del"><a onclick="delProFromCart(this,'${entry.key.id}')">移除</a></p>
                                <%--
                                    原句：
                                    <p class="del"><a href="javascript:;" class="delBtn">移除</a></p>
                                --%>
                            </li>
                        </ul>
                    </c:forEach>
                </c:if>

                <c:if test="${empty cart}">
                    <center style="color: darkgray;font-size: 30px">您暂未有任何购买记录！</center>
                </c:if>
            </div>
        </div>

        <a class="btn btn-info" style="color: whitesmoke;" onclick="delSelect()">删除所选</a>&nbsp;&nbsp;&nbsp;
        <a class="btn btn-danger" style="color: whitesmoke;" onclick="clearCart()">清空购物车</a>

        <!--底部-->
        <div class="bar-wrapper">
            <div class="bar-right">
                <div class="piece">已选商品<strong class="piece_num">0</strong>件</div>
                <div class="totalMoney">共计: <strong id="total_text" class="total_text">0</strong></div>
                <%--这里要进行传值操作 javascript:;--%>
                <div class="calBtn"><a id="toOrder" onclick="toOrder()">结算</a></div>
            </div>
        </div>
    </section>
    <section class="model_bg"></section>
    <section class="my_model">
        <p class="title">删除宝贝<span class="closeModel">X</span></p>
        <p>您确认要删除该宝贝吗？</p>
        <div class="opBtn"><a href="javascript:;" class="dialog-sure">确定</a><a href="javascript:;" class="dialog-close">关闭</a></div>
    </section>

    <script src="js/jquery.min.js"></script>

    <!-- footer -->
    <footer class="center">
        <div class="mt20">小米商城|MIUI|米聊|多看书城|小米路由器|视频电话|小米天猫店|小米淘宝直营店|小米网盟|小米移动|隐私政策|Select Region</div>
        <div>©mi.com 京ICP证110507号 京ICP备10046444号 京公网安备11010802020134号 京网文[2014]0059-0009号</div>
        <div>违法和不良信息举报电话：185-0130-1238，本网站所列数据，除特殊说明，所有数据均出自我司实验室测试</div>
    </footer>

<script>
    $(function () {

        //全局的checkbox选中和未选中的样式
        var $allCheckbox = $('input[type="checkbox"]'),     //全局的全部checkbox
            $wholeChexbox = $('.whole_check'),
            $cartBox = $('.cartBox'),                       //每个商铺盒子
            $shopCheckbox = $('.shopChoice'),               //每个商铺的checkbox
            $sonCheckBox = $('.son_check');                 //每个商铺下的商品的checkbox
        $allCheckbox.click(function () {
            if ($(this).is(':checked')) {
                $(this).next('label').addClass('mark');
            } else {
                $(this).next('label').removeClass('mark')
            }
        });

        //===============================================全局全选与单个商品的关系================================
        $wholeChexbox.click(function () {
            var $checkboxs = $cartBox.find('input[type="checkbox"]');
            if ($(this).is(':checked')) {
                $checkboxs.prop("checked", true);
                $checkboxs.next('label').addClass('mark');
            } else {
                $checkboxs.prop("checked", false);
                $checkboxs.next('label').removeClass('mark');
            }
            totalMoney();
        });

        $sonCheckBox.each(function () {
            $(this).click(function () {
                if ($(this).is(':checked')) {
                    //判断：所有单个商品是否勾选
                    var len = $sonCheckBox.length;
                    var num = 0;
                    $sonCheckBox.each(function () {
                        if ($(this).is(':checked')) {
                            num++;
                        }
                    });
                    if (num == len) {
                        $wholeChexbox.prop("checked", true);
                        $wholeChexbox.next('label').addClass('mark');
                    }
                } else {
                    //单个商品取消勾选，全局全选取消勾选
                    $wholeChexbox.prop("checked", false);
                    $wholeChexbox.next('label').removeClass('mark');
                }
            })
        })

        //=======================================每个店铺checkbox与全选checkbox的关系/每个店铺与其下商品样式的变化===================================================

        //店铺有一个未选中，全局全选按钮取消对勾，若店铺全选中，则全局全选按钮打对勾。
        $shopCheckbox.each(function () {
            $(this).click(function () {
                if ($(this).is(':checked')) {
                    //判断：店铺全选中，则全局全选按钮打对勾。
                    var len = $shopCheckbox.length;
                    var num = 0;
                    $shopCheckbox.each(function () {
                        if ($(this).is(':checked')) {
                            num++;
                        }
                    });
                    if (num == len) {
                        $wholeChexbox.prop("checked", true);
                        $wholeChexbox.next('label').addClass('mark');
                    }

                    //店铺下的checkbox选中状态
                    $(this).parents('.cartBox').find('.son_check').prop("checked", true);
                    $(this).parents('.cartBox').find('.son_check').next('label').addClass('mark');
                } else {
                    //否则，全局全选按钮取消对勾
                    $wholeChexbox.prop("checked", false);
                    $wholeChexbox.next('label').removeClass('mark');

                    //店铺下的checkbox选中状态
                    $(this).parents('.cartBox').find('.son_check').prop("checked", false);
                    $(this).parents('.cartBox').find('.son_check').next('label').removeClass('mark');
                }
                totalMoney();
            });
        });

        //========================================每个店铺checkbox与其下商品的checkbox的关系======================================================

        //店铺$sonChecks有一个未选中，店铺全选按钮取消选中，若全都选中，则全选打对勾
        $cartBox.each(function () {
            var $this = $(this);
            var $sonChecks = $this.find('.son_check');
            $sonChecks.each(function () {
                $(this).click(function () {
                    if ($(this).is(':checked')) {
                        //判断：如果所有的$sonChecks都选中则店铺全选打对勾！
                        var len = $sonChecks.length;
                        var num = 0;
                        $sonChecks.each(function () {
                            if ($(this).is(':checked')) {
                                num++;
                            }
                        });
                        if (num == len) {
                            $(this).parents('.cartBox').find('.shopChoice').prop("checked", true);
                            $(this).parents('.cartBox').find('.shopChoice').next('label').addClass('mark');
                        }

                    } else {
                        //否则，店铺全选取消
                        $(this).parents('.cartBox').find('.shopChoice').prop("checked", false);
                        $(this).parents('.cartBox').find('.shopChoice').next('label').removeClass('mark');
                    }
                    totalMoney();
                });
            });
        });

        //=================================================商品数量==============================================
        var $plus = $('.plus'),
            $reduce = $('.reduce'),
            $all_sum = $('.sum');

        $plus.click(function () {
            var $inputVal = $(this).prev('input'),
                $count = parseInt($inputVal.val())+1,
                $obj = $(this).parents('.amount_box').find('.reduce'),
                $priceTotalObj = $(this).parents('.order_lists').find('.sum_price'),
                $price = $(this).parents('.order_lists').find('.price').html(),  //单价
                $priceTotal = $count*parseInt($price.substring(1));
            $inputVal.val($count);
            $priceTotalObj.html('￥'+$priceTotal);
            if($inputVal.val()>1 && $obj.hasClass('reSty')){
                $obj.removeClass('reSty');
            }
            var id = $(this).attr("value");
            updateCart(id,$count);
            totalMoney();
        });

        $reduce.click(function () {
            var $inputVal = $(this).next('input'),
                $count = parseInt($inputVal.val())-1,
                $priceTotalObj = $(this).parents('.order_lists').find('.sum_price'),
                $price = $(this).parents('.order_lists').find('.price').html(),  //单价
                $priceTotal = $count*parseInt($price.substring(1));
            if($inputVal.val()>1){
                $inputVal.val($count);
                $priceTotalObj.html('￥'+$priceTotal);
            }
            if($inputVal.val()==1 && !$(this).hasClass('reSty')){
                $(this).addClass('reSty');
            }
            var id = $(this).attr("value");
            updateCart(id,$count);
            totalMoney();
        });

        $all_sum.keyup(function () {
            var $count = 0,
                $priceTotalObj = $(this).parents('.order_lists').find('.sum_price'),
                $price = $(this).parents('.order_lists').find('.price').html(),  //单价
                $priceTotal = 0;
            if($(this).val()==''){
                $(this).val('1');
            }
            $(this).val($(this).val().replace(/\D|^0/g,''));
            $count = $(this).val();
            $priceTotal = $count*parseInt($price.substring(1));
            $(this).attr('value',$count);
            $priceTotalObj.html('￥'+$priceTotal);
            totalMoney();
        })

        //======================================移除商品========================================

        var $order_lists = null;
        var $order_content = '';
        $('.delBtn').click(function () {
            $order_lists = $(this).parents('.order_lists');
            $order_content = $order_lists.parents('.order_content');
            $('.model_bg').fadeIn(300);
            $('.my_model').fadeIn(300);
        });

        //关闭模态框
        $('.closeModel').click(function () {
            closeM();
        });
        $('.dialog-close').click(function () {
            closeM();
        });
        function closeM() {
            $('.model_bg').fadeOut(300);
            $('.my_model').fadeOut(300);
        }
        //确定按钮，移除商品
        $('.dialog-sure').click(function () {
            $order_lists.remove();
            if($order_content.html().trim() == null || $order_content.html().trim().length == 0){
                $order_content.parents('.cartBox').remove();
            }
            closeM();
            $sonCheckBox = $('.son_check');
            totalMoney();
        })

        //======================================总计==========================================

        function totalMoney() {
            var total_money = 0;
            var total_count = 0;
            var calBtn = $('.calBtn a');
            $sonCheckBox.each(function () {
                if ($(this).is(':checked')) {
                    var goods = parseInt($(this).parents('.order_lists').find('.sum_price').html().substring(1));
                    var num =  parseInt($(this).parents('.order_lists').find('.sum').val());
                    total_money += goods;
                    total_count += num;
                }
            });
            $('.total_text').html(total_money);
            $('.piece_num').html(total_count);

            // console.log(total_money,total_count);

            if(total_money!=0 && total_count!=0){
                if(!calBtn.hasClass('btn_sty')){
                    calBtn.addClass('btn_sty');
                }
            }else{
                if(calBtn.hasClass('btn_sty')){
                    calBtn.removeClass('btn_sty');
                }
            }
        }
    });

    //删除当前的产品
    function delProFromCart(obj,id) {
        //对话框返回true or false
        if(confirm("您确定要删除该商品吗？")){
            $(obj).parent().parent().parent().remove();
            updateCart(id,0);
        }
    }
    
    //修改购物车
    function updateCart(id,quantity) {
        $.ajax({
            url : "updateCart",
            type : "get",
            data : {
                "id" : id,
                "quantity" : quantity
            }
        });
    }

    //清空购物车
    function clearCart() {
        //这个confirm只返回true / false
        if(confirm("您确定要清空购物车吗？")){
            location.href = "clearCart";
        }
    }

    //这里实现删除所选
    function delSelect(){
        if (confirm("您确定要删除指定产品吗？")){
            //子复选框
            $(".son_check").each(function (index,element) {
                //如果我们当前的按钮选择了的话就执行删除操作
                if ($(element).is(":checked") == true){
                    //赋值id为我们复选框的value值
                    var id = $(element).val();
                    //调用函数进行指定删除操作
                    updateCart(id,0);
                    $(element).parent().parent().remove();
                }
            });
        }
    }

    //跳转到支付页面的函数
    function toOrder() {
        //首先要获取总金额
        var amount = $(".total_text").text();
        //判断当前金额是否为0
        if(amount == 0){
            alert("请您选中商品进行支付！");
        } else {
            if (confirm("提交订单后，所选物品将会提交到订单，是否继续提交？")){
                //获取选中的所有id号，进行字符串拼接
                var ids = "";
                //进行遍历操作
                $(".son_check").each(function (index,element) {
                    //如果复选框选中了的话
                    if($(element).is(":checked") == true){
                        //获取复选框的value值 -- 即为id
                        var proid = $(element).val();
                        ids = ids + "," + proid;//类似于,1,3,5,7
                    }
                });
                ids = ids.substring(1);//去除第一个逗号“，”
                //异步请求
                location.href = "orderCart?ids=" + ids + "&amount=" + amount;
            }
        }
    }

</script>

</body>
</html>