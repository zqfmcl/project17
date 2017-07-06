<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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

<title>My JSP 'addDept.jsp' starting page</title>

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
		<span style="font-size: 20px;">添加</span> &nbsp;<a
			style="text-decoration: none;font-size: 12px;" target="mainPage"
			href="javascript:history.back(-1)">返回列表</a>
	</div>
	<div style="margin-left: 20px;">
		<h5
			style="border-bottom-style:solid; border-bottom-width: 1px; border-bottom-color: #ccc;">添加部门信息</h5>
		<form action="" name="form1" method="post">
			<div class="form-editer">
				<table style="width:100%;table-layout: fixed;">
					<col style="width:20%;">
					<col style="width:30%;">
					<col style="width:20%;">
					<col style="width:30%;">
					<tr>

						<td><h5>部门名称</h5></td>
						<td><input type="text" name="bm_name" size="80px" /></td>
					</tr>
					<tr>
						<td><h5>代码</h5></td>
						<td><input type="text" name="bm_dm" size="80px" /></td>
					</tr>
					<tr>
						<td><h5>上级编号</h5></td>
						<td><select name="sjbh" style="width:500px">
								<c:forEach items="${sjbhList }" var="sjbh">
									<option value="${sjbh}">${sjbh }</option>
								</c:forEach>
						</select></td>
					</tr>
					<tr>
						<td><h5>站点编号</h5></td>
						<td><input type="text" name="bm_zdbh" size="80px" /></td>
					</tr>
					<tr>
						<td><h5>排序号</h5></td>
						<td><input type="text" name="bm_pxh" size="80px" /></td>
					</tr>
					<tr>
						<td valign="top"><h5>说明</h5></td>
						<td><textarea name="bm_bz" style="width:500px; height:150px;"></textarea></td>
					</tr>
				</table>
				<input type="button" class="btn" value="保存"
					onclick="form1.action='${pageContext.request.contextPath }/DepartmentServlet?method=DeptAdd&type=baocun';form1.submit();" />
					&nbsp;&nbsp;
					<input
					type="button" class="btn" value="保存并继续编辑" type="submit"
					onclick="form1.action='${pageContext.request.contextPath }/DepartmentServlet?method=DeptAdd&type=savethenedit';form1.submit();" />
			</div>

		</form>
	</div>
	>
</body>
</html>
