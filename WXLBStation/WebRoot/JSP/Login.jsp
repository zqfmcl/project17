<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>网上报修系统</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="报修,报修系统">
	<meta http-equiv="description" content="网上报修系统">
	<meta name="viewport" content="width=device-width, initial-scale=1" /> 
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link href="CSS/style_log.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" type="text/css" href="CSS/style.css">
	<%	
		String wxh=request.getParameter("userinfo");
		String wxrz=request.getParameter("userinfo2");
	 %>
<style type="text/css">
	body {
		font-size:auto;
	}
	select {
		border:1px solid #cad2db; 
		padding:0 5px; 
		-moz-border-radius:5px; 
		-webkit-border-radius:5px; 
		border-radius:5px; 
		line-height:36px; 
		margin-bottom:10px; 
		font-size:14px; 
		color:#717171; 
		font-family:Arial;
	}
</style>
  </head>
  
  <body class="login" mycollectionplug="bind">
    <div class="login_m"><!-- 整体 -->
    	<div class="login_logo"><h1>网上报修系统</h1></div>
    	<div class="login_padding login_boder" id="login_model">
    	<form id="form1" method="post" action="LiveBLgnServlet?userinfo=<%=wxh %>&userinfo2=<%=wxrz%>">
  			<h2>用户名</h2>
    			<input type="text" name="userid" id="userid" class="txt_input txt_input2">
  			<h2>密码</h2>
    			<input type="password" name="pass" id="pass" class="txt_input">
  			<h2>密码保存期限</h2>
  			<select name="limit" title="请选择密码保存期限" class="txt_input txt_input2">
    				<option value="1">不保存</option>
    				<option value="2">一天</option>
    				<option value="3">一星期</option>
    				<option value="4">15天</option>
    				<option value="5">一个月</option>
    		</select>
    		<input type="button" class="sub_buttons" name="button" id="button" value="提交" onclick="send()"/>
  			<!-- <p class="forgot"><a id="iforget" href="javascript:void(0);">Forgot your password?</a></p> -->
    	</form>
		</div>
		
    	<span style="color:red;">${msg }</span>
    </div>
  </body>
  <script type="text/javascript">
  	function send(){
  		var f=document.getElementById("form1");
  		var uid=document.getElementById("userid");
  		var pwd=document.getElementById("pass");
  		var reg=new RegExp('[^A-z0-9]');
  		if(uid.value==null||uid.value==""){
  			alert("用户名不能为空！！！");
  			return;
  		}
  		if(pwd.value==null||pwd.value==""){
  			alert("密码不能为空！！！");
  			return;
  		}
  		if(reg.test(uid.value+pwd.value)){
  			alert("请输入有效用户名或密码！！！");
  			return ;
  		}
  		f.submit();
  	}
  </script>
</html>
