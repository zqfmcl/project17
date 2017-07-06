<%@ page language="java" import="java.util.*" pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'addXmwt.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
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
	overflow: hidden;
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
</style>

  </head>
  
  <body>
    <div class="div-title">
		<span style="font-size: 20px;">项目问题申报</span> &nbsp;<a
			style="text-decoration: none;font-size: 12px;" target="mainPage"
			href="javascript:history.back(-1)">返回列表</a>
	</div>
	<div style="margin-left: 20px;">
	<h5 style="border-bottom-style:solid; border-bottom-width: 1px; border-bottom-color: #ccc;">添加项目问题信息</h5>
		<form action="" name="form1" method="post">		
			<table>
				<tr>
					<td><span>项目名称:</span></td>
					<td>
						<select name="xmid">
							<c:forEach items="${xmlist }" var="xm">
								<option value="${xm.xmid }">${xm.xmmc }</option>
							</c:forEach>
						</select>					
					</td>
					
				</tr>
				<tr>
					<td><span>标题:</span></td>
					<td><input type="text" name="bt"></td>
				</tr>
				<tr>
					<td><span>问题描述:</span></td>
					<td><textarea id="wtms" name="wtms1" rows="5" cols="100"></textarea> </td>
				</tr>
				<tr>
					<td><span>问题情况:</span></td>
					<td><textarea id="wtqk" name="wtqk1" rows="5" cols="100"></textarea> </td>
				</tr>
				<tr>
					<td><span>联系人:</span></td>
					<td><input type="text" name="lxr"></td>
				</tr>
				<tr>
					<td><span>联系电话:</span></td>
					<td><input type="text" name="lxdh"></td>
				</tr>
				
			</table>
			<input type="button" value="提交" onclick="tiJiao()">
		</form>
	</div>
	<script type="text/javascript">
		function tiJiao(){
			var wtms=$("#wtms").val();
			var reg=new RegExp("\n","g");
			wtms=wtms.replace(reg,'<br>');
			var wtqk=$("#wtqk").val();
			var reg=new RegExp("\n","g");
			wtqk=wtqk.replace(reg,'<br>');
			form1.action="${pageContext.request.contextPath }/XmwtglServlet?wtms="+wtms+"&wtqk="+wtqk+"&method=addXmwt&fenlei=sb";
			form1.submit();
		}
	</script>
  </body>
</html>
