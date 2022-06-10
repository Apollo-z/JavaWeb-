<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>管理员-登录</title>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
</head>
<body>
	<!--登录模态框-->
	<div class="modal fade" id="adminLoginModal" tabindex="-1" role="dialog">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="row">
					<div class="col-xs-6 col-md-6">
						<img src="${APP_PATH }/static/img/admin/login.png"
							style="position: relative; width: 100%; height: 280px">
					</div>
					<div class="col-xs-6 col-md-6">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
							<div class="text-center">
								<h4 class="modal-title">管理员登录</h4>
							</div>
						</div>
						<div class="modal-body">
							<%--登录的form表单--%>
							<form action="${APP_PATH}/adminLogin" method="post">
								<div class="form-group">
									<input type="text" class="form-control" name="aname"
										required="required" placeholder="用户名">
								</div>
								<div class="form-group">
									<input type="password" class="form-control" name="apassword"
										required="required" placeholder="密码">
								</div>
								<!-- <p style="font-size: 10px">
									还没有账号？ <a href="#" data-toggle="modal"
										data-target="#SignUpModal" data-dismiss="modal"
										aria-label="Close">立即注册</a>
								</p> -->
								<div class="form-group">
									<div class="row" style="position: relative; top: 10px;">
										<div class="col-md-8">
											<button type="reset" class="btn btn-default">清除</button>
										</div>
										<div class="col-md-4">
											<button type="submit" class="btn btn-primary">登录</button>
										</div>
									</div>
									<div class="text-danger text-center"
										style="position: relative; top: 20px; font-size: 10px;"></div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!--注册模态框PS：管理员不需要注册-->
	<div class="modal fade" id="SignUpModal" tabindex="-1" role="dialog">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="row">
					<div class="col-md-6">
						<img src="${APP_PATH }/static/img/admin/login.png"
							style="position: relative; width: 100%; height: 380px;">
					</div>
					<div class="col-md-6">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
							<div class="text-center">
								<h4 class="modal-title">管理员注册</h4>
							</div>
						</div>
						<div class="modal-body">
							<form action="${APP_PATH}/adminController/setSignUp" method="post">
								<div class="form-group">
									<input type="text" class="form-control" name="aname"
										required="required" placeholder="用户名">
								</div>
								<div class="form-group">
									<input type="password" class="form-control" name="apassword"
										id="apassword" required="required" placeholder="密码">
								</div>
								<div class="form-group">
									<input type="password" class="form-control" id="arepassword"
										required="required" placeholder="确认密码">
								</div>
								<p style="font-size: 10px">
									已有账号？ <a href="#" data-toggle="modal" data-target="#adminLoginModal"
										data-dismiss="modal" aria-label="Close">登录</a>
								</p>
								<div class="form-group">
									<div class="row" style="position: relative; top: 10px;">
										<div class="col-md-8">
											<button type="reset" class="btn btn-default">清除</button>
										</div>
										<div class="col-md-4">
											<button type="submit" class="btn btn-primary"
												onclick="return confirmPass();">注册</button>
										</div>
									</div>
								</div>
								<div class="text-danger text-center" id="confirmPassExit"
									style="position: relative; top: 10px; font-size: 10px;"></div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!--新增商品的模态框-->
	<div class="modal fade" id="adminAddPro" tabindex="-1" role="dialog">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="row">
					<div class="col-xs-6 col-md-6">
						<img src="${APP_PATH }/static/img/admin/login.png"
							 style="position: relative; width: 100%; height: 280px">
					</div>
					<div class="col-xs-6 col-md-6">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
							<div class="text-center">
								<h4 class="modal-title">新增产品</h4>
							</div>
						</div>
						<div class="modal-body">
							<%--新增商品的form表单--%>
							<form action="${pageContext.request.contextPath}/adminAddPro" method="post" enctype="multipart/form-data">
								<div class="form-group">
									产品名<input type="text" class="form-control" name="pName"
										   required="required">
								</div>
								<div class="form-group">
									简介<input type="text" class="form-control" name="pSn"
										   required="required">
								</div>
								<div class="form-group">
									库存<input type="text" class="form-control" name="pNum"
										   required="required">
								</div>
								<div class="form-group">
									市场价<input type="text" class="form-control" name="mPrice"
										   required="required">
								</div>
								<div class="form-group">
									网站价<input type="text" class="form-control" name="iPrice"
										   required="required">
								</div>
								<div class="form-group">
									类型<br>
									<select style="width: 100px;" name="cid">
										<option value="1">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
										<option value="4">4</option>
										<option value="5">5</option>
										<option value="6">6</option>
									</select>
									<%--<input type="text" class="form-control" name="cid"--%>
										   <%--required="required">--%>
								</div>
								<div class="form-group">
									产品封面
									<%--<input type="password" class="form-control" name="pImg"--%>
										   <%--required="required">--%>
									<input type="file" name="imgurl" id="file"
										   onchange="changepic(this)"
										   accept="image/jpg,image/jpeg,image/png,image/bmp,image/gif" /><br />
									<%--展示上传上来的图片--%>
									<img src="${pageContext.request.contextPath}/proimages/jia.jpg" id="img1" width=80 height=80/>
								</div>

								<div class="form-group">
									<div class="row" style="position: relative; top: 10px;">
										<div class="col-md-8">
											<button type="reset" class="btn btn-default">清除</button>
										</div>
										<div class="col-md-4">
											<button type="submit" class="btn btn-primary">新增</button>
										</div>
									</div>
									<div class="text-danger text-center"
										 style="position: relative; top: 20px; font-size: 10px;"></div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!--修改商品的模态框-->
	<div class="modal fade" id="adminUpdatePro" tabindex="-1" role="dialog">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="row">
					<div class="col-xs-6 col-md-6">
						<img src="${APP_PATH }/static/img/admin/login.png"
							 style="position: relative; width: 100%; height: 280px">
					</div>
					<div class="col-xs-6 col-md-6">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
							<div class="text-center">
								<h4 class="modal-title">修改产品</h4>
							</div>
						</div>
						<div class="modal-body">
							<%--修改商品的form表单--%>
							<form action="${pageContext.request.contextPath}/adminUpdatePro" method="post" enctype="multipart/form-data">
								<div class="form-group">
									产品ID<input type="text" class="form-control" name="id" id="id" readonly="readonly"
											  required="required">
								</div>
								<div class="form-group">
									产品名<input type="text" class="form-control" name="pName"
											  required="required">
								</div>
								<div class="form-group">
									简介<input type="text" class="form-control" name="pSn"
											 required="required">
								</div>
								<div class="form-group">
									库存<input type="text" class="form-control" name="pNum"
											 required="required">
								</div>
								<div class="form-group">
									市场价<input type="text" class="form-control" name="mPrice"
											  required="required">
								</div>
								<div class="form-group">
									网站价<input type="text" class="form-control" name="iPrice"
											  required="required">
								</div>
								<div class="form-group">
									类型<br>
									<select style="width: 100px;" name="cid">
										<option value="1">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
										<option value="4">4</option>
										<option value="5">5</option>
										<option value="6">6</option>
									</select>
									<%--类型<input type="text" class="form-control" name="cid"--%>
											 <%--required="required">--%>
								</div>
								<div class="form-group">
									产品封面
									<%--<input type="password" class="form-control" name="pImg"--%>
									<%--required="required">--%>
									<input type="file" name="imgurl" id="file2"
										   onchange="changepic_update(this)"
										   accept="image/jpg,image/jpeg,image/png,image/bmp,image/gif" /><br />
									<%--展示上传上来的图片--%>
									<img src="${pageContext.request.contextPath}/proimages/jia.jpg" id="img2" width=80 height=80/>
								</div>

								<div class="form-group">
									<div class="row" style="position: relative; top: 10px;">
										<div class="col-md-8">
											<button type="reset" class="btn btn-default">清除</button>
										</div>
										<div class="col-md-4">
											<button type="submit" class="btn btn-primary">修改</button>
										</div>
									</div>
									<div class="text-danger text-center"
										 style="position: relative; top: 20px; font-size: 10px;"></div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!--修改商品的模态框-->
	<div class="modal fade" id="adminUpdateUser" tabindex="-1" role="dialog">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="row">
					<div class="col-xs-6 col-md-6">
						<img src="${APP_PATH }/static/img/admin/login.png"
							 style="position: relative; width: 100%; height: 280px">
					</div>
					<div class="col-xs-6 col-md-6">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
							<div class="text-center">
								<h4 class="modal-title">修改用户</h4>
							</div>
						</div>
						<div class="modal-body">
							<%--修改商品的form表单--%>
							<form action="${pageContext.request.contextPath}/adminUpdateUser" method="get">
								<div class="form-group">
									用户ID<input type="text" class="form-control" name="userid" id="userid" readonly="readonly"
											   required="required">
								</div>
								<div class="form-group">
									用户账号<input type="text" class="form-control" name="username"
											  required="required">
								</div>
								<div class="form-group">
									密码<input type="password" class="form-control" name="password"
											 required="required">
								</div>
								<div class="form-group">
									电话<input type="text" class="form-control" name="telephone"
											 required="required">
								</div>
								<div class="form-group">
									用户名<input type="text" class="form-control" name="name"
											  required="required">
								</div>

								<div class="form-group">
									<div class="row" style="position: relative; top: 10px;">
										<div class="col-md-8">
											<button type="reset" class="btn btn-default">清除</button>
										</div>
										<div class="col-md-4">
											<button type="submit" class="btn btn-primary">修改</button>
										</div>
									</div>
									<div class="text-danger text-center"
										 style="position: relative; top: 20px; font-size: 10px;"></div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		//点击提交按钮时，触发confirmPass事件，会进行弹框提醒以防无视错误信息提交
		function confirmPass() {
			var apass = document.getElementById("apassword").value;
			var arepass = document.getElementById("arepassword").value;
			if (apass != arepass) {
				var str = "两次输入的密码不一致！";
				/* 显示提示信息 */
				document.getElementById("confirmPassExit").innerHTML = str;
				/* 清空指定输入框 */
				document.getElementById("apassword").value = "";
				document.getElementById("arepassword").value = "";
				/* 将光标定为到指定文本框 */
				document.getElementById("apassword").focus();
				return false;
			}

			/* 清空指定div */
			document.getElementById("confirmPassExit").innerHTML = "";
		}

		//将上传的图片展示
		function changepic(e) {
			//获取上传的文件对象
			f = document.getElementById('file').files[0];
			//获取上传的文件名称
			var filename=f.name;
			//判断是否图片
			//获取文件的后缀
			var ext=filename.substring(filename.lastIndexOf(".")+1);
			//可接受的文件类型,数组
			var acceptType=['jpg','jpeg','png','bmp','gif'];
			var flag=false;
			//验证文件类型是否合法
			for(var i=0;i<acceptType.length;i++){
				if(ext==acceptType[i]){
					flag=true;
				}
			}
			if(flag==false){
				alert("不接受非图片文件!");
				location.href="upload.jsp";
				return;
			}

			//图片预览
			var reads = new FileReader();
			reads.readAsDataURL(f);
			reads.onload = function() {

				document.getElementById('img1').src = this.result;

			};
		}

		//将上传的图片展示
		function changepic_update(e) {
			//获取上传的文件对象
			f = document.getElementById('file2').files[0];
			//获取上传的文件名称
			var filename=f.name;
			//判断是否图片
			//获取文件的后缀
			var ext=filename.substring(filename.lastIndexOf(".")+1);
			//可接受的文件类型,数组
			var acceptType=['jpg','jpeg','png','bmp','gif'];
			var flag=false;
			//验证文件类型是否合法
			for(var i=0;i<acceptType.length;i++){
				if(ext==acceptType[i]){
					flag=true;
				}
			}
			if(flag==false){
				alert("不接受非图片文件!");
				location.href="upload.jsp";
				return;
			}

			//图片预览
			var reads = new FileReader();
			reads.readAsDataURL(f);
			reads.onload = function() {

				document.getElementById('img2').src = this.result;

			};
		}
	</script>
</body>
</html>