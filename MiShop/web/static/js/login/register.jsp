<%--
  Created by IntelliJ IDEA.
  User: HT
  Date: 2019/12/30
  Time: 19:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->

    <title>立即注册</title>

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
    <script>
        addEventListener("load", function () {
            setTimeout(hideURLbar, 0);
        }, false);

        function hideURLbar() {
            window.scrollTo(0, 1);
        }
    </script>
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

<body>
<h1 class="error">Gadget Sign Up Form</h1>
<!---738x90--->
<div class="w3layouts-two-grids">
    <!---738x90--->
    <div class="mid-class">
        <div class="img-right-side">
            <h3>Manage Your Gadgets Account</h3>
            <p style="font-weight: bold">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula
                eget Lorem ipsum dolor
                sitamet, consectetuer adipiscing elit. Aenean commodo ligula ege</p>
            <img src="static/imgs/b11.png" class="img-fluid" alt="">
        </div>

        <div class="txt-left-side">
            <h1 class="text-center" style="font-weight: bold;font-size: 1.5em ;margin-top: 30px">SIGN UP HERE</h1>
            <form id="register" role="form" class="form-horizontal">
                <div class="form-group" style="padding-top:50px">
                    <label class="col-sm-3 control-label" for="name2" style="">用户名：</label>
                    <div class="col-sm-6">
                        <input class="form-control" placeholder="请输入用户名" id="name2" name="name" style=";height: 40px"/>
                    </div>
                </div>

                <div class="form-group" style="padding-top: 15px">
                    <label class="col-sm-3 control-label" for="password2" style="">密码：</label>
                    <div class="col-sm-6">
                        <input class="form-control" placeholder="请输入密码" id="password2" name="password" type="password"
                               style=";height: 40px"/>
                    </div>
                </div>

                <div class="form-group" style="padding-top: 15px">
                    <label class="col-sm-3 control-label" for="repassword" style="">确认密码：</label>

                    <div class="col-sm-6">
                        <input class="form-control" placeholder="请确认您输入的密码" id="repassword"
                               name="repassword" type="password" style=";height: 40px"/>
                    </div>
                </div>

                <div class="form-group" style="padding-top: 15px">
                    <label class="col-sm-3 control-label" for="email" style="">E-Mail：</label>
                    <div class="col-sm-6">
                        <input class="form-control" placeholder="请输入邮箱" id="email" name="email"
                               style=";height: 40px;border-radius: 5%"/>
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-md-offset-3 col-md-6">
                        <button type="submit" class="btn btn-primary" style="height: 40px; margin-top: 15px">注册</button>
                    </div>
                </div>
            </form>

            <div class="w3layouts_more-buttn">
                <h3 style="padding-top: 15px">Don't Have an account..?
                    <a href="${APP_PATH}/login/login.jsp">Login Here
                    </a>
                </h3>
            </div>
            <div class="clear"></div>
        </div>

    </div>
</div>

<script type="text/javascript">
    //页面的跳转
    function go() {
        //这里指定跳转到index.jsp
        window.location.href = "/index.jsp";
    }

    //注册验证
    $("#register").submit(function () {
        //获取用户名、密码、确认密码和邮箱值
        var name = $("#name2").val();//输入的用户名
        var pass = $("#password2").val();//输入的密码
        var repass = $("#repassword").val();//输入的确认密码
        var email = $("#email").val();//输入的邮箱

        //调ajax
        $.ajax({
            url: "${APP_PATH}/userController/register",
            data: {name: name, pass: pass, email: email, repass: repass},
            type: "POST",
            dataType: "text",
            success: function (data) {
                if (data.trim() == "OK")//要加上去空格，防止内容里面有空格引起错误。
                {

                    //当Ajax返回的是OK就说明注册成功
                    var str = "注册成功!欢迎来到计算科学学院论坛(●'◡'●)!";
                    //显示提示信息
                    alert(str);
                    //0.5秒后页面跳转到index.jsp
                    setTimeout(go, 500);

                } else if (data.trim() == "PASS") {

                    //当Ajax返回PASS则说明两次密码输入不一致
                    var str = "两次输入的密码不一致！/(ㄒoㄒ)/~~";
                    //显示提示信息
                    alert(str);

                    //清空指定输入框
                    document.getElementById("password2").value = "";
                    document.getElementById("repassword").value = "";

                    //将光标定为到指定文本框
                    document.getElementById("password2").focus();

                } else if (data.trim() == "NO") {

                    var str = "该用户名已存在！/(ㄒoㄒ)/~~";
                    //显示提示信息
                    alert(str);

                }
            }
        });
        return false;
    });

</script>

</body>
</html>
