<%@ page language="java" import="java.util.*" pageEncoding="utf-8"
	isELIgnored="false"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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

<title>编辑角色</title>

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
			style="border-bottom-style:solid; border-bottom-width: 1px; border-bottom-color: #ccc;">编辑部门信息</h5>
		<form
			action="${pageContext.request.contextPath }/JueseServlet?method=JueUpdate"
			method="post">
			<input type="hidden" name="id" value="${jueseEdit.id }" />
			<div class="form-editer">
				<table style="width:100%;table-layout: fixed;">
					<col style="width:20%;">
					<col style="width:30%;">
					<col style="width:20%;">
					<col style="width:30%;">
					<tr>
						<td><h5>名称</h5></td>
						<td><input type="text" name="js_name"
							value="${jueseEdit.js_name }" size="80px" /></td>
					</tr>
					<tr>
						<td><h5>系统名称</h5></td>
						<td><input type="text" name="xt_name"
							value="${jueseEdit.xt_name }" size="80px" /></td>
					</tr>
					<tr>
						<td><h5>激活</h5></td>
						<td style="text-align: left;"><input name="js_jhzt" value="T"
							<c:if test="${jueseEdit.js_jhzt=='T' }">checked="checked"</c:if>
							type="checkbox" /></td>
					</tr>
					<tr>
						<td><h5>是否为系统角色</h5></td>
						<td style="text-align: left;"><input name="js_xtjsbz" value="T"
							<c:if test="${jueseEdit.js_xtjsbz=='T' }">checked="checked"</c:if>
							type="checkbox" /></td>
					</tr>
				</table>
				<input type="submit" class="btn" value="确认修改" />
			</div>
		</form>
	</div>

</body>
</html>
