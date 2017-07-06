<%@page import="com.lzcb.bigitem.utils.PageHelper"%>
<%@page import="com.lzcb.bigitem.utils.DbHelper"%>
<%@page import="com.lzcb.bigitem.dao.XwlmDaoImpl"%>
<%@page import="com.lzcb.bigitem.dao.XwlmDao"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'xwlm_show.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script src="JS/jquery-3.2.1.min.js"></script>
	<link rel="stylesheet" type="text/css" href="CSS/bi.main.css">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

 <%
	Map xmxx = (Map) request.getAttribute("xmxx");
%>
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

input,select,textarea {
	text-align: left;
}

[type="number"] {
	min-width: 48px;
}

[type="text"],select,textarea {
	width: 100%;
}
</style>
</head>
<body>
	<div class="div-title">
		<span style="font-size: 20px;">查看新闻栏目</span> &nbsp;<a
			style="text-decoration: none;font-size: 12px;" target="mainPage"
			href="javascript:history.back(-1)">返回列表</a>
	</div>
	<div style="margin-left: 20px;">
		<h5
			style="border-bottom-style:solid; border-bottom-width: 1px; border-bottom-color: #ccc;">查看新闻栏目</h5>
		<form id="form1" method="post" enctype="multipart/form-data" action="Xwlm.do?method=add" >
		<div class="form-editer">
			<table style="width:100%;table-layout: fixed;">
				<col style="width:20%;">
				<col style="width:30%;">
				<col style="width:20%;">
				<col style="width:30%;">
				<tr>
					<td colspan="4"><h5>新闻栏目</h5>
					</td>
				</tr>
				<tr>
					<td>栏目名称*</td>
					<td><%=(xmxx.get("LMMC")==null?"":xmxx.get("LMMC"))%>
					</td>
					
				<tr>
					<td>栏目分类*</td>
					<td><%=(xmxx.get("LMFL")==null?"":xmxx.get("LMFL")) %>
					</td>
					
				</tr>
				<tr>
					<td>排序*</td>
					<td><%=(xmxx.get("MYORDER")==null?"":xmxx.get("MYORDER")) %>
					</td>
				</tr>			
				
					
			</table>
		</div>
			<div style="padding: 15px;">
				<input type="button" value="保存"  class="btn" style="position: relative;left: 100px;text-align: center;" onclick = "checkForm()" /> 
			</div>
		</form>
	</div>
	<div class="showmsg" id="showmsg">${msg }</div>
</body>

<script type="text/javascript">
	$("[type='checkbox']").parent().css("text-align", "left");
	$("label").parent().css("text-align", "left");
</script>
</html>