<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

<title>角色列表</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<script type="text/javascript" src="JS/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="CSS/bi.main.css">
<style type="text/css">
.title, form, .tlist {
	width: 95%;
	margin-top: 26px;
	margin-right: 20px;
	margin-bottom: 20px;
	margin-left: 20px;
}

.title {
	padding: 25px;
	padding-bottom: 25px;
	padding-left: 25px;
	padding-right: 0px;
	padding-top: 25px;
}

.title .tcontext {
	font-size: 24;
}

form, .tlist {
	padding: 10px;
}

div, form {
	background-color: white;
}

form td {
	padding: 5px;
}

from input, select {
	width: 100px;
}

.tlist table {
	margin: 0;
	border-left-style: solid;
	border-left-width: 1px;
	border-top-style: solid;
	border-top-width: 1px;
	border-color: #ccc;
	border-collapse: collapse;
}

.tlist div {
	margin: 0px;
	white-space: normal;
	text-overflow: ellipsis;
	border-collapse: collapse;
	overflow: auto;
}

.tlist th, .tlist td {
	word-wrap: break-word;
	word-break: break-all;
	border-right-style: solid;
	border-right-width: 1px;
	border-bottom-style: solid;
	border-bottom-width: 1px;
	border-color: #ccc;
	margin: 0px;
	display: table-cell;
	overflow: hidden;
	overflow-x: hidden;
	overflow-y: hidden;
	text-overflow: ellipsis;
	white-space: normal;
}

.tlist tr {
	margin: 0px;
}

.showmsg {
	padding: 20px;
	font-size: 14px;
	position: fixed;
	top: 0px;
	margin-left: 45%;
	height: 20px;
	opacity: 0;
	background-color: #f7e1e1;
}
#table1 td{ text-align:center;}
</style>


</head>

<body>
	<div class="title">
		<span class="tcontext">角色管理</span>
	</div>
	<div class="title">
		<input data-num-p='0901' type="button" value="添加" class="btn"
		onclick="window.location.href='${pageContext.request.contextPath }/JSP/xtgl/juese/addJuese.jsp'" />
	</div>
	<div class="tlist">
		<div class="mutiTable"
			style="max-height:440px;margin: 0px;padding: 0px;">
			<table id="table1" cellpadding="1px" border="0" cellspacing="1"
				cellpadding="0" style="width:100%">
				<tr>
					<th id="id_ID" style="width:15%">ID</th>
					<th id="id_DM" style="width:30%">名称</th>
					<th id="id_MC" style="width:15%">激活</th>
					<th id="id_PXH" style="width:15%">是否为系统角色</th>
					<th id="id_BJ" style="width:25%">编辑</th>
				</tr>
				<c:forEach items="${jueseList }" var="juese">
					<tr>
						<td>${juese.id }</td>
						<td>${juese.js_name }</td>
						<td>${juese.js_jhzt }</td>
						<td>${juese.js_xtjsbz }</td>
						<td><input data-num-p='0902' type="button" name="edit" value="编辑"
							class="btn-intable"
							onclick="window.location.href='${pageContext.request.contextPath}/JueseServlet?method=JueQuery&id=${juese.id }'" />&nbsp;
							<input data-num-p='0903' type="button" name="delete" value="删除" class="btn-intable"
							onclick="delJuese(${juese.id})" />&nbsp;
							<input data-num-p='0904' type="button" name="qxfp" value="权限分配"
							class="btn-intable"
							onclick="window.location.href='${pageContext.request.contextPath}/JueseServlet?method=JuePower&id=${juese.id }'" />&nbsp;&nbsp;
							
							</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		</div>
	 <script type="text/javascript" src="JS/bi.load.js"></script>
  <script type="text/javascript">
  $("tr:even").css("background-color","#F5F5F5"); 
  manageView("<%=request.getSession().getAttribute("power").toString()%>","09");
				function delJuese(id) {
					if (window.confirm("是否确认删除")) {
						url = "${pageContext.request.contextPath}/JueseServlet?method=JueDel&id="
								+ id;
						window.location.href = url;
					}
				}
			</script>
</body>
</html>
