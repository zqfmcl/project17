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
    
    <title>My JSP 'xwlm_add.jsp' starting page</title>
    
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

<style type="text/css">
.div-title {
	padding: 10px;
	border-bottom-style: solid; border-bottom-width : 1px;
	border-bottom-color: #ccc;
	border-bottom-width: 1px;
}
.form-editer{
	padding:10px;
	border-width: 1px;
	border-style: solid;
	border-color: #ccc;
	border-radius:3px;
}
[type="checkbox"]{
	min-width: 0px;
}
td{
	padding: 5px;
	vertical-align: top;
	text-align: right;
}
[colspan="4"]{
	font-weight: 100;
	border-bottom-style: solid;
	border-bottom-width:1px;
	border-top-style: solid;
	border-top-width:1px;
	border-color: #ccc;
	text-align: left;
	vertical-align: middle;
}
input,select,textarea{
	text-align: left;
}
[type="number"]{
	min-width: 48px;
}
[type="text"],select,textarea{
	width: 100%;
}
.showmsg{
	padding: 20px;
	font-size: 14px;
	position: fixed;
	top: 0px;
	margin-left: 45%; 
	height: 20px;
	opacity:0;
	background-color: #f7e1e1;
}
</style>
</head>
<body>
	<div class="div-title">
		<span style="font-size: 20px;">添加新闻栏目</span> &nbsp;<a
			style="text-decoration: none;font-size: 12px;" target="mainPage"
			href="javascript:history.back(-1)">返回列表</a>
	</div>
	<div style="margin-left: 20px;">
		<h5
			style="border-bottom-style:solid; border-bottom-width: 1px; border-bottom-color: #ccc;">添加新闻栏目</h5>
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
					<td><input type="text" name="lmmc" id="lmmc" />
					</td>
					
				<tr>
					<td>栏目分类*</td>
					<td>
					<select name ="lmfl">
							<option value="">请选择</option>
							<option value="0">导航栏目</option>
							<option value="1">侧边栏目</option>
					</select>
					</td>
					
				</tr>
				<tr>
					<td>排序*</td>
					<td><input name="myorder" id="myorder" type="number" value="0" />
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
	function savAndCon(){
		var a=$("#form1").attr("action");
		$("#form1").attr("action",a+"&cont=1");
		$("#form1").submit();
	}

	$("[type='checkbox']").parent().css("text-align","left");
	$("[type='number']").parent().css("text-align","left");
	$("[type='month']").parent().css("text-align","left");
	$("label").parent().css("text-align","left");
	
	
	
	function checkForm() { 
		pass = true; 
		$("td:contains('*')").next().find("input").each(function(){ 
		if(this.value == '') { 
		text = $(this).parent().prev().text(); 
		alert(text+"是必填项"); 
		this.focus(); 
		pass = false; 
		return false;//跳出each 
	} 
	}); 
		if(pass==true){document.getElementById("form1").submit();}
	} 
	
	function fnshowmsg(){
	var div=$("#showmsg");
	div.animate({opacity:'1'},"9000");
    div.animate({opacity:'0.0'},"12000");
	}
	$(document).ready(function(){
		<%=(request.getAttribute("msg")==null?"":"fnshowmsg();")%>
		
	});
</script>
</html>
