<%@ page language="java" import="java.util.*" pageEncoding="utf-8"
	isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>编辑用户</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<script src="JS/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="CSS/bi.main.css">
<style type="text/css">
.div-title {
	padding: 10px;
	border-bottom-style: solid;
	border-bottom-width: 1px;
	border-bottom-color: #ccc;
	border-bottom-width: 1px;
}

.form-editer {
	padding: 10px;
	border-width: 1px;
	border-style: solid;
	border-color: #ccc;
	border-radius: 3px;
}

[type="checkbox"] {
	min-width: 0px;
}

td {
	padding: 5px;
	vertical-align: top;
	text-align: right;
}

[colspan="4"] {
	font-weight: 100;
	border-bottom-style: solid;
	border-bottom-width: 1px;
	border-top-style: solid;
	border-top-width: 1px;
	border-color: #ccc;
	text-align: left;
	vertical-align: middle;
}

input, select, textarea {
	text-align: left;
}

[type="number"] {
	min-width: 48px;
}

[type="text"], select, textarea {
	width: 100%;
}
</style>
</head>

<body>
	<div class="div-title">
		<span style="font-size: 20px;">编辑</span> &nbsp;<a
			style="text-decoration: none;font-size: 12px;" target="mainPage"
			href="javascript:history.back(-1)">返回列表</a>
	</div>
		
	<div style="margin-left: 20px;">
	<h5
			style="border-bottom-style:solid; border-bottom-width: 1px; border-bottom-color: #ccc;">编辑用户信息</h5>
		
		<form action="" name="form1" method="post">
		<div class="form-editer">
			<input type="hidden" name="id" value="${yhEdit.id }">
			<table style="width:100%;table-layout: fixed;">
			<col style="width:20%;">
					<col style="width:30%;">
					<col style="width:20%;">
					<col style="width:30%;">
				<tr>
					<td><h5>登录账号</h5></td>
					<td><input type="text" name="userid" size="80px"
						value="${yhEdit.userid }" /></td>
				</tr>
				<tr>
					<td><h5>用户名称</h5></td>
					<td><input type="text" name="username" size="80px"
						value="${yhEdit.username }" /></td>
				</tr>
				<tr>
					<td><h5>Email</h5></td>
					<td><input type="text" name="email" size="80px"
						value="${yhEdit.email }" /></td>
				</tr>
				<tr>
					<td><h5>密码</h5></td>
					<td><input type="password" name="password" size="80px"
						value="${yhEdit.password }" /></td>
				</tr>
				<tr>
					<td><h5>地区</h5></td>
					<td><select name="dq_id" style="width:500px">
							<c:forEach items="${diquList }" var="dq">
								<option value="${dq.id }"
									<c:if test="${dq.id==yhEdit.dq_id }">selected="selected"</c:if>>${dq.dq_name }</option>
							</c:forEach>

					</select></td>

				</tr>
				<tr>
					<td><h5>激活</h5></td>
					<td style="text-align: left;"><input name="jhzt" type="checkbox"
						<c:if test="${yhEdit.jhzt=='T' }">checked="checked"</c:if> /></td>
				</tr>
				<tr>
					<td><h5>用户角色</h5></td>
					<td style="text-align: left;"><c:forEach items="${jueseList }" var="js">
							<input type="checkbox" name="js" value="${js.id}"
								<c:forEach items="${jsidArray }" var="jsid">
									<c:choose>
										<c:when test="${jsid == js.id }">
											checked="checked"
										</c:when>
										<c:otherwise></c:otherwise>
									</c:choose>
								</c:forEach> />${js.js_name }<br />
						</c:forEach></td>
				</tr>
			</table>

			<input type="button" class="btn" value="保存"
				onclick="form1.action='${pageContext.request.contextPath }/YongServlet?method=YongUpdate';form1.submit();" />
		</div>
		</form>
	</div>
</body>
</html>
