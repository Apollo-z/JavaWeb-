<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>管理员-主体</title>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<body>

<c:if test="${!empty adminList}">

	<%-- 方便ajax获取APP_PATH --%>
	<input id="APP_PATH" type="hidden" value="${APP_PATH}" >
	<%-- 方便ajax获取session中的userid --%>
	<input id="adminList" type="hidden" value="${adminList}" >
	<div class="container-fluid">
		<div class="row" style="margin-top: 70px">
			<!--左边部分-->
			<div class="  nav-left col-md-2 no-padding" id="nav-list-left" style="z-index: 1">
				<div class="user-panel">
					<img src="${APP_PATH }/static/img/admin/user.jpg" class="img-circle center-block" />
				</div>

				<div class="nav-list">
					<ul>
						<li><a id="yhgl" href="#">用户管理</a></li>
						<li><a id="fwjl" href="#">订单管理</a></li>
						<li><a id="tzgl" href="#">商品管理</a></li>
						<li><a id="bkgl" href="#">类别管理</a></li>
					</ul>
				</div>
			</div>

			<!--右边部分-->
			<div class="main-right  col-md-10 col-md-offset-2" style="z-index: 9">
				<!--用户管理 -->
				<div class="col-md-12 yhgl" >
					<div class="panel panel-default ">
						<div class="panel-heading">用户管理
							<small class="text-primary" id="user_total">
								<font style="color: red;">【共 ${users.count} 个用户】</font>
								<small class="text-primary" id="article_total1"></small>
							</small>
						</div>
						<form action="${pageContext.request.contextPath}/adminGetUser" style="margin-top: 13px">
							&nbsp;&nbsp;&nbsp;&nbsp;请输入用户名：<input type="text" name="user_name">
							<input type="submit" style="border-radius: 3px" value="查询用户">
							<input type="submit" style="border-radius: 3px" value="刷新">
						</form>
						<div class="panel-body">
							<table class="table table-bordered tb-hover">
								<thead style="color: #333;background-color: #f5f5f5;">
									<tr style="text-align: center">
										<td>序号</td>
										<td>账号</td>
										<td>电话</td>
										<td>姓名</td>
										<td>注册时间</td>
										<td>个性签名</td>
										<td>爱好</td>
										<td>地址</td>
										<td class="text-center">操作</td>
									</tr>
								</thead>

								<%--这里放所有的user对象--%>
								<tbody id="listUser_all">
									<c:if test="${!empty users}">
										<%--只有user对象不为空的时候才能展示--%>
										<c:forEach items="${users.users}" var="user" varStatus="vs">
											<tr style="text-align: center">
												<td>${user.id}</td>
												<td>${user.username}</td>
												<td>${user.telephone}</td>
												<td>${user.name}</td>
												<td>${user.regTime}</td>
												<td>${user.gexing}</td>
												<td>${user.hobby}</td>
												<td>${user.address}</td>
												<td class="text-center">
													<a onclick="updateUsers(this)" class="btn btn-primary"><font style="color: white;">修改</font></a>
													<a onclick="deleteUsers(this)" class="btn btn-danger"><font style="color: white;">删除</font></a>
												</td>
											</tr>
										</c:forEach>
									</c:if>
								</tbody>
							</table>
							<%--分页--%>
							<div class="page" style="text-align: center">

								<a style="color: blue;" href="${pageContext.request.contextPath}/adminGetUser?currentPage=${users.currentPage==1?1:users.currentPage-1}&name=${name}">
									上一页
								</a>
								&nbsp;&nbsp;

								<font style="color: black;">第${users.currentPage}页 / 共${users.totalPage}页&nbsp;&nbsp;</font>

								<a style="color: blue;" href="${pageContext.request.contextPath}/adminGetUser?currentPage=${users.currentPage == users.totalPage?users.totalPage:users.currentPage+1}&name=${name}">
									下一页
								</a>

							</div>
                            <nav class="text-center" aria-label="Page navigation" id="listUser_page"></nav>
						</div>
					</div>
				</div>

				<!--订单管理-->
				<div class="col-md-12 tzgl" style="">
					<div class="panel panel-default ">
						<div class="panel-heading">订单管理
							<font style="color: red;">【共 ${pageBeanMso.count} 条订单记录】</font>
							<small class="text-primary" id="article_total"></small>
						</div>
						<form action="${APP_PATH}/adminFindMso" style="margin-top: 13px">
							&nbsp;&nbsp;&nbsp;&nbsp;请输入订单号：<input type="text" name="msoid">
							<input type="submit" style="border-radius: 3px" value="查询订单">
							<input type="submit" style="border-radius: 3px" value="刷新">
						</form>
						<div class="panel-body">
							<table class="table table-bordered tb-hover">
								<thead style="color: #333;background-color: #f5f5f5;">
									<tr style="text-align: center">
										<%--<td>序号</td>--%>
										<td>订单编号</td>
										<td>买家姓名</td>
										<td>联系方式</td>
										<td>收货地址</td>
										<td>下单时间</td>
										<td>物流状态</td>
										<td>总金额</td>
										<td>付款状态</td>
										<td>用户id</td>
										<td class="text-center">操作</td>
									</tr>
								</thead>
								<tbody id="listArticle_all">
									<c:if test="${!empty pageBeanMso}">
										<c:forEach items="${pageBeanMso.msos}" var="mso" varStatus="vs">
											<tr style="text-align: center">
												<td>${mso.msoid}</td>
												<td>${mso.msoname}</td>
												<td>${mso.telephone}</td>
												<td>${mso.address}</td>
												<td>${mso.msoTime}</td>
												<td>${mso.msostate}</td>
												<td>${mso.subtotal}</td>
												<td>${mso.payState}</td>
												<td>${mso.userid}</td>
												<c:if test="${mso.msostate == '未发货'}">
													<td class="text-center">
														<a class="btn btn-primary" style="cursor: pointer;" onclick="toSendPro(this)">
															<font style="color: white;">发货</font>
														</a>
													</td>
												</c:if>

												<c:if test="${mso.msostate != '未发货'}">
													<td style="color: red;" class="text-center">已发货</td>
												</c:if>

											</tr>
										</c:forEach>
									</c:if>
								</tbody>
							</table>
								<div class="page" style="text-align: center">

									<a style="color: blue;" href="${APP_PATH}/adminFindMso?currentPage=${pageBeanMso.currentPage==1?1:pageBeanMso.currentPage-1}&msoid=${msoid_mso}">
										上一页
									</a>
									&nbsp;&nbsp;

									<font style="color: black;">第${pageBeanMso.currentPage}页 / 共${pageBeanMso.totalPage}页&nbsp;&nbsp;</font>

									<a style="color: blue;" href="${APP_PATH}/adminFindMso?currentPage=${pageBeanMso.currentPage == pageBeanMso.totalPage?pageBeanMso.totalPage:pageBeanMso.currentPage+1}&msoid=${msoid_mso}">
										下一页
									</a>

								</div>
                            <nav class="text-center" aria-label="Page navigation" id="listArticle_page"></nav>
						</div>
					</div>
				</div>

				<!--商品管理-->
				<div class="col-md-12 bkgl" style="">
					<div class="panel panel-default ">
						<div class="panel-heading">
							<div class="row">
								<div class="col-md-10">商品管理
									<font style="color: red;">【共 ${pageBeanPro.count} 条订单记录】</font>
									<small class="text-primary" id="plate_total"></small>
								</div>
								<!--新增按钮-->
								<!-- 右上 新增商品的模态框-->
								<a class="dropdown-toggle" href="#" style="height: 50px;"
								   data-toggle="modal" data-target="#adminAddPro">
									<span style="color: red;" class="pull-left nav-username">新增商品</span>
								</a>
                                <div class="col-md-2" id="plates_add"></div>
							</div>
						</div>
						<%--根据产品名模糊查询产品--%>
						<form action="${APP_PATH}/getAllPro" style="margin-top: 13px">
							&nbsp;&nbsp;&nbsp;&nbsp;请输入产品名：<input type="text" name="pName">
							<input type="submit" style="border-radius: 3px" value="查询产品">
							<input type="submit" style="border-radius: 3px" value="刷新">
						</form>
						<div class="panel-body">
							<table class="table table-bordered tb-hover">
								<thead style="color: #333;background-color: #f5f5f5;">
									<tr style="text-align: center">
										<td>编号</td>
										<td>产品名</td>
										<td>简介</td>
										<td>库存</td>
										<td>网站价</td>
										<td>产品封面</td>
										<td>上架时间</td>
										<td>销量</td>
										<td>类型</td>
										<td class="text-center">操作</td>
									</tr>
								</thead>
								<tbody id="plate_all">
									<%--只有当pageBeanPro不为空的时候才能进行显示--%>
									<c:if test="${!empty pageBeanPro}">
										<c:forEach items="${pageBeanPro.pros}" var="pro" varStatus="vs">
											<tr style="text-align: center;">
												<td>${pro.id}</td>
												<td>${pro.pName}</td>
												<td>${pro.pSn}</td>
												<td>${pro.pNum}</td>
												<td>${pro.iPrice}</td>
												<td>
                                                    <img style="width: 50px;height: 50px;" src="${pageContext.request.contextPath}/${pro.pImg}">
                                                </td>
												<td>${pro.pubTime}</td>
												<td>${pro.isHot}</td>
												<td>${pro.cid}</td>
												<td class="text-center">
													<%--
														adminUpdatePro
														data-target="#adminUpdatePro"
														data-toggle="modal"
													--%>
													<button onclick="updatePro(this)" class="btn btn-primary">
														<font style="color: white;">修改</font>
													</button>
													<br>
													<a class="btn btn-danger" onclick="deletePro(this)"> <font style="color: white;">删除</font></a>
												</td>
											</tr>
										</c:forEach>
									</c:if>
								</tbody>
							</table>
							<div class="page" style="text-align: center">

								<a style="color: blue;" href="${APP_PATH}/getAllPro?currentPage=${pageBeanPro.currentPage==1?1:pageBeanPro.currentPage-1}&pName=${pName}">
									上一页
								</a>
								&nbsp;&nbsp;

								<font style="color: black;">第${pageBeanPro.currentPage}页 / 共${pageBeanPro.totalPage}页&nbsp;&nbsp;</font>

								<a style="color: blue;" href="${APP_PATH}/getAllPro?currentPage=${pageBeanPro.currentPage == pageBeanPro.totalPage?pageBeanPro.totalPage:pageBeanPro.currentPage+1}&pName=${pName}">
									下一页
								</a>

							</div>
						</div>
					</div>
				</div>
				
				<%--<!--类别管理-->--%>
				<%--<div class="col-md-12 fwjl" style="">--%>
					<%--<div class="panel panel-default ">--%>
						<%--<div class="panel-heading">--%>
							<%--<div class="row">--%>
								<%--<div class="col-md-10">类别管理 <small class="text-primary" id="visit_total"></small></div>--%>
							<%--</div>--%>
						<%--</div>--%>
						<%--<form action="${APP_PATH}/adminFindMso" style="margin-top: 13px">--%>
							<%--&nbsp;&nbsp;&nbsp;&nbsp;请输入订单号：<input type="text" name="msoid">--%>
							<%--<input type="submit" style="border-radius: 3px" value="查询订单">--%>
							<%--<input type="submit" style="border-radius: 3px" value="刷新">--%>
						<%--</form>--%>
						<%--<div class="panel-body">--%>
							<%--<table class="table table-bordered tb-hover">--%>
								<%--<thead style="color: #333;background-color: #f5f5f5;">--%>
									<%--<tr style="text-align: center">--%>
										<%--<td>序号</td>--%>
										<%--<td>访问者ip</td>--%>
										<%--<td>访问者所在国家</td>--%>
										<%--<td>访问者所在省份</td>--%>
										<%--<td>访问者所在城市</td>--%>
										<%--&lt;%&ndash;<td>主机名</td>--%>
										<%--<td>操作系统</td>&ndash;%&gt;--%>
										<%--<td>访问时间</td>--%>
									<%--</tr>--%>
								<%--</thead>--%>
								<%--<tbody id="listVisit_all">--%>

									<%--<tr style="text-align: center">--%>
										<%--<td>序号</td>--%>
										<%--<td>访问者ip</td>--%>
										<%--<td>访问者所在国家</td>--%>
										<%--<td>访问者所在省份</td>--%>
										<%--<td>访问者所在城市</td>--%>
										<%--&lt;%&ndash;<td>主机名</td>--%>
										<%--<td>操作系统</td>&ndash;%&gt;--%>
										<%--<td>访问时间</td>--%>
									<%--</tr>--%>
								<%--</tbody>--%>
							<%--</table>--%>
                            <%--<nav class="text-center" aria-label="Page navigation" id="listVisit_page"></nav>--%>
						<%--</div>--%>
					<%--</div>--%>
				<%--</div>--%>
			</div>
		</div>
	</div>
	
	<script src="${APP_PATH }/static/js/admin.js"></script>
	<%--<script src="${APP_PATH }/static/js/admin/content.js"></script>--%>
	<%--<script src="${APP_PATH }/static/js/admin/user.js"></script>--%>
	<%--<script src="${APP_PATH }/static/js/admin/article.js"></script>--%>
	<%--<script src="${APP_PATH }/static/js/admin/visit.js"></script>--%>
	<%--<script src="${APP_PATH }/static/js/admin/plate.js"></script>--%>
	<script type="text/javascript">

		//发送货物
		function toSendPro(dom) {
			var msoid = $(dom).parent().prev().prev().prev().prev().prev().prev().prev().prev().prev().text();
			// alert(msoid);	//测试
			//根据msoid进行发货的操作
			if (confirm("是否确认发货？")){
				window.location.href = "${APP_PATH}/isFahuo?msoid=" + msoid;
			}
		}

		//更新产品的操作
		function updatePro(dom) {
			//获取产品id
			var id = $(dom).parent().prev().prev().prev().prev().prev().prev().prev().prev().prev().text();
			// alert(id);	//测试id
			$("#id").val(id);
			$("#adminUpdatePro").modal("show");
		}

		//删除产品的操作
		function deletePro(dom) {
			//获取产品id
			var id = $(dom).parent().prev().prev().prev().prev().prev().prev().prev().prev().prev().text();
			// alert(id);	//测试id
			if (confirm("是否确定要删除该产品？")){
				window.location.href = "${pageContext.request.contextPath}/deletePro?id=" + id;
			}
		}

		//删除指定的用户
		function deleteUsers(dom) {
			//获取userid
			var userid = $(dom).parent().prev().prev().prev().prev().prev().prev().prev().prev().text();
			// alert(userid);	//测试
			if (confirm("是否确定要删除该用户？")){
				//执行删除操作
				window.location.href = "${pageContext.request.contextPath}/adminDeleteUser?userid=" + userid;
			}
		}

		function updateUsers(dom) {
			//获取userid
			var userid = $(dom).parent().prev().prev().prev().prev().prev().prev().prev().prev().text();
			// alert(id);  //测试id
			$("#userid").val(userid);
			$("#adminUpdateUser").modal("show");
		}

	</script>
</c:if>

<c:if test="${empty adminList}">
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<center>
		<img src="${pageContext.request.contextPath}/image/error_icon.png" style="width:200px; height:200px;">
	</center>
	<center style="color: darkgray;font-size: 30px">非管理人员无法进行任何后台操作！请您先登录验证身份！</center>

</c:if>

</body>
</html>
