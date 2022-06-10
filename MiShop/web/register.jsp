<%--
  Created by IntelliJ IDEA.
  User: HT
  Date: 2019/12/30
  Time: 19:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->

    <title>MiShops商城</title>

    <%
        //使用name-value键值对的方式来设置
        pageContext.setAttribute("APP_PATH", request.getContextPath()); //获取当前路径给APP_PATH
    %>

    <!-- Meta tags -->
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="keywords"
          content="Gadget Sign Up Form Responsive Widget, Audio and Video players, Login Form Web Template, Flat Pricing Tables, Flat Drop-Downs, Sign-Up Web Templates, Flat Web Templates, Login Sign-up Responsive Web Template, Smartphone Compatible Web Template, Free Web Designs for Nokia, Samsung, LG, Sony Ericsson, Motorola Web Design"
    />

    <!-- Meta tags -->
    <!-- font-awesome icons -->
    <link type="text/css" href="static/bootstrap/css/bootstrap.css" rel="stylesheet">

    <script src="static/js/jquery-3.4.1.min.js" type="text/javascript"></script>
    <script src="static/js/form.js" type="text/javascript"></script>
    <script src="static/js/jquery.validate.js" type="text/javascript"></script>
    <script src="static/bootstrap/js/bootstrap.js" type="text/javascript"></script>
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <!-- //font-awesome icons -->
    <!--stylesheets-->
    <link href="static/css/style_login.css" rel='stylesheet' type='text/css' media="all">
    <!--//style sheet end here-->
</head>

<h1 class="error"><b>欢迎来到MiShops商城</b></h1>
<!---738x90--->
<div class="w3layouts-two-grids">
    <!---738x90--->
    <div class="mid-class">
        <div class="img-right-side">
            <h3>这里有你想要的所有手机数码产品</h3>
            <p style="font-weight: bold">一流的服务，一流的质量<br/>这里是电子数码产品的天堂<br/>总有一款手机，专门为您量身定制</p>
            <img src="static/imgs/b11.png" class="img-fluid" alt="">
        </div>

        <div class="txt-left-side">
            <h1 class="text-center" style="font-weight: bold;font-size: 1.5em ;margin-top: 30px">欢迎来到注册界面</h1>
            <form id="register" role="form" class="form-horizontal">
                <div class="form-group" style="padding-top:50px">
                    <label class="col-sm-3 control-label" for="name" style="">
                        账号
                        <span class="glyphicon glyphicon-user"></span>
                    </label>
                    <div class="col-sm-6">
                        <input class="form-control" placeholder="请输入您的账号" id="name" name="name" onkeyup="checkUserName()"
                               style="height: 40px"/>
                    </div>
                    <span class="col-sm-3" id="userNameMsg" style="color: red;"></span>
                </div>

                <div class="form-group" style="padding-top: 15px">
                    <label class="col-sm-3 control-label" for="password" style="">
                        密码
                        <span class="glyphicon glyphicon-lock"></span>
                    </label>
                    <div class="col-sm-6">
                        <input class="form-control" placeholder="请输入您的密码" id="password" name="password" type="password"
                               style="height: 40px"/>
                    </div>
                </div>

                <div class="form-group" style="padding-top: 15px">
                    <label class="col-sm-3 control-label" for="password" style="">
                        确认密码
                    </label>
                    <div class="col-sm-6">
                        <input class="form-control" placeholder="请再次输入您的密码"
                               id="password2" name="password2" type="password" onblur="checkRepwd()"
                               style="height: 40px"/>
                    </div>
                    <span class="col-sm-3" id="repwdMsg" style="color: red;"></span>
                </div>

                <div class="form-group" style="padding-top: 15px">
                    <label class="col-sm-3 control-label" for="password" style="">
                        手机号
                        <span class="glyphicon glyphicon-record"></span>
                    </label>
                    <div class="col-sm-4">
                        <input class="form-control" placeholder="请输入手机号" name="telephone" id="telephone" type="text"
                               style="height: 40px" onblur="checkTelNum()">
                    </div>

                    <div class="col-sm-2">
                        <input type="button" onclick="checktelephone()" value="验证"
                               style="
                                color: white;
                                font-weight: bolder;
                                background-color: dodgerblue;
                                font-weight: 200;
                                height: 40px;
                                width: 70px;
                        "/>
                    </div>
                    <span class="col-sm-3" id="phoneMsg" style="color: red;"></span>
                </div>

                <div class="form-group" style="padding-top: 15px">
                    <label class="col-sm-3 control-label" for="password" style="">
                        验证码
                        <span class="glyphicon glyphicon-record"></span>
                    </label>
                    <div class="col-sm-6">
                        <input class="form-control" placeholder="请输入收到的验证码"
                               name="number" id="number" type="text" style="height: 40px">
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-md-offset-3 col-md-6">
                        <button type="submit" class="btn btn-primary" style="height: 40px; margin-top: 15px">立即注册</button>
                    </div>
                </div>

            </form>
            <div class="w3layouts_more-buttn">
                <h3 style="padding-top: 15px">已有账号？
                    <a href="login.jsp">返回登陆
                    </a>
                </h3>
            </div>
        </div>

    </div>
</div>

<script type="text/javascript">
    
    //发送验证码
    function checktelephone() {
        var telephone = $("#telephone").val();
        $.ajax({
            type : "post",
            url : "send",
            data : "telephone=" + telephone,
            success : function (data) {
                if (data != null){
                   alert("发送成功！请注意查收短信！");
                }
                return true;
            }
        });
    }
    
    //页面的跳转
    function go() {
        //这里指定跳转到index.jsp
        window.location.href = "${APP_PATH}/index.jsp";
    }

    //注册验证
    $("#register").submit(function () {

        //获取用户输入的用户名和密码
        var name = $("#name").val();
        var password = $("#password").val();
        //加一个验证码
        var number = $("#number").val();
        var telephone = $("#telephone").val();
            //调用Ajax进行校验
            $.ajax({
                url:"${APP_PATH}/register",
                data:{
                    username:name,
                    password:password,
                    number:number,
                    telephone:telephone
                },
                type:"POST",
                dataType:"text",
                success: function(data){
                    if(data.trim()=="OK"){
                        var str = "注册成功!(●'◡'●)";
                        //显示提示信息
                        alert(str);
                        //0.5秒后页面跳转
                        setTimeout(go, 500);
                    } else {
                        var str = "注册失败!/(ㄒoㄒ)/~~";
                        //显示提示信息
                        alert(str);
                    }
                }
            });
        return false;
    });

    /**
     * 检查用户名是否存在
     *
     * @returns {boolean}
     */
    function checkUserName() {
        $("#userNameMsg").html("");
        //把username的输入框内容赋值给username变量
        var username = $("#name").val();
        $.ajax({
            "async" : false,	//异步请求
            "url" : "checkNameServlet",	//检查用户名是否存在
            "data" : {
                //只传一个用户名的参数即可
                "username" : username
            },
            "type" : "POST",
            "dataType" : "json",
            "success" : function (data) {
                //data是返回的result,用户名存在为true,否则为false
                if (data == true){
                    // alert("该用户名已存在！请重新输入！");
                    $("#userNameMsg").html("用户名已存在！");
                    return false;
                }
                return true;
            }
        });
        return true;
    }

    /*验证确认密码*/
    function checkRepwd() {
        //一开始的时候设置为空的提示信息
        $("#repwdMsg").html("");
        var repwd = $("#password2").val();
            if (repwd == ""){
            $("#repwdMsg").html("请输入确认密码！");
            return false;
        }
        var pwd = $("#password").val();
        if (pwd != repwd){
            $("#repwdMsg").html("确认密码有误！");
            return false;
        }
        return true;
    }

    //验证手机
    function checkTelNum() {
        //提示内容初始化为空
        $("#phoneMsg").html("");
        var telephone = $("#telephone").val();
        //如果telephone为空字符串的话
        if(telephone == ""){
            $("#phoneMsg").html("电话号码不能为空");
            return false;
        }
        //正则表达式校验手机号
        var regex = /^1[34578]\d{9}$/;
        var flag = regex.test(telephone);
        //如果匹配的格式不对
        if (flag == false){
            $("#phoneMsg").html("电话号码不正确");
        }
        return flag;
    }

</script>

</body>
</html>
