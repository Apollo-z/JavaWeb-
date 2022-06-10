<%--
  Created by IntelliJ IDEA.
  User: HT
  Date: 2019/12/30
  Time: 19:30
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

	<title>立即登录</title>

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

		function getCode() {
			var codeStr = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
			var oDiv = document.getElementById('code');
			var str = '';

			// 验证码有几位就循环几次

			for (var i = 0; i < 4; i++) {

				var ran = Math.floor(Math.random() * 62);

				str += codeStr.charAt(ran);
			}
			oDiv.value = str;
		}

		function check() {
			var va = document.getElementById("text").value;
			var tr = document.getElementById("true");
			var fa = document.getElementById("false");
			var oDiv = document.getElementById('code');
			if (va == oDiv.value.toLowerCase() || va == oDiv.value.toUpperCase()) {
				tr.style.display = "inline-block";
				fa.style.display = "none";
				tr.style.color = "green";

				//如果输入的和验证码匹配，就可以提交
				// return true;
			} else {
				fa.style.display = "inline-block";
				tr.style.display = "none";
				fa.style.color = "#a94442";

				//如果输入的和验证码无法匹配，就无法提交
				// return false;
			}
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

<body onload="getCode()">
<h1 class="error">Gadget Sign Up rm</h1>
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
			<form id="login" role="form" class="form-horizontal">
				<div class="form-group" style="padding-top:50px">
					<label class="col-sm-3 control-label" for="name" style="">
						用户名
						<span class="glyphicon glyphicon-user"></span>
					</label>
					<div class="col-sm-6">
						<input class="form-control" placeholder="请输入用户名" id="name" name="name"
							   style="height: 40px"/>
					</div>
				</div>
				<div class="form-group" style="padding-top: 15px">
					<label class="col-sm-3 control-label" for="password" style="">
						密码
						<span class="glyphicon glyphicon-lock"></span>
					</label>
					<div class="col-sm-6">
						<input class="form-control" placeholder="请输入密码" id="password" name="password" type="password"
							   style="height: 40px"/>
					</div>
				</div>

				<div class="form-group" style="padding-top: 15px">
					<label class="col-sm-3 control-label" for="password" style="">
						验证码
						<span class="glyphicon glyphicon-record"></span>
					</label>
					<div class="col-sm-4">
						<input type="text" placeholder="请输入验证码" class="form-control" id="text" onblur="check()"
							   style="height: 40px">
					</div>

					<div class="col-sm-2">
						<input type="button" class="form-control btn btn-primary" id="code" onclick="getCode()"
							   style="padding: 0px;letter-spacing: 5px;height: 40px">
					</div>

					<span id="true" style="display: none">正确</span>
					<span id="false" style="display: none">验证码错误</span>
				</div>

				<div class="form-group">
					<div class="col-md-offset-3 col-md-6">
						<button type="submit" class="btn btn-primary" style="height: 40px; margin-top: 15px">登录</button>
					</div>
				</div>

			</form>
			<div class="w3layouts_more-buttn">
				<h3 style="padding-top: 15px">Don't Have an account..?
					<a href="${APP_PATH}/login/register.jsp">Register Here
					</a>
				</h3>
			</div>
		</div>

	</div>
</div>

<script type="text/javascript">
	//页面的跳转
	function go() {
		//这里指定跳转到index.jsp
		window.location.href = "index.jsp";
	}

	//登录验证
	$("#login").submit(function () {

		//获取用户输入的用户名和密码
		var name = $("#name").val();
		var password = $("#password").val();

		//获取验证码的两个值进行比较，如果输入正确就可以进行下一步
		var oDiv = document.getElementById('code');
		var va = document.getElementById("text").value;

		if (va == oDiv.value.toLowerCase() || va == oDiv.value.toUpperCase()) {
			//如果验证码输入正确,进行下一步

			//调用Ajax进行校验
			$.ajax({
				url:"${APP_PATH}/userController/login",
				data:{name:name,password:password},
				type:"POST",
				dataType:"text",
				success: function(data){
					if(data.trim()=="OK"){
						var str = "登陆成功!(●'◡'●)";
						//显示提示信息
						alert(str);
						//0.5秒后页面跳转
						setTimeout(go, 500);
					} else {
						var str = "用户名或密码错误!/(ㄒoㄒ)/~~";
						//显示提示信息
						alert(str);
					}
				}
			});
		} else {
			//提示用户验证码有误s
			alert("验证码输入有误!/ԾㅂԾ/~");
			//验证码有误,无法进行下一步
			// return true;
		}
		return false;
	});

</script>

</body>
</html>
