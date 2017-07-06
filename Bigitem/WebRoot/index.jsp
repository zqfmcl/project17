<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>临淄区重点项目信息管理平台登录</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="临淄区重点项目信息管理平台">
	<meta http-equiv="description" content="临淄区重点项目信息管理平台 登录">
	<link href="CSS/style_log.css" rel="stylesheet" type="text/css">
  </head>
  
  <body>
     <div class="login_m"><!-- 整体 -->
    	<div class="login_logo"><h1>临淄区重点项目信息管理平台</h1></div>
    	<div class="login_padding login_boder" id="login_model">
    	<form id="form1" method="post" action="Login.do" target="_top">
  			<h2>用户名</h2>
    			<input type="text" name="username" id="username" class="txt_input txt_input2">
  			<h2>密码</h2>
    			<input type="password" name="pass" id="pass" class="txt_input"><br>
    		<input type="submit" class="sub_buttons" name="button" id="button" value="提交"/>
    	</form>
    	<span style="color:red;">${msg }</span>
		</div>
    </div>
  </body>
</html>
