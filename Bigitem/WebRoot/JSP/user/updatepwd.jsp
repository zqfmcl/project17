<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
	<link href="CSS/style_log.css" rel="stylesheet" type="text/css">
	<script src="JS/jquery-3.2.1.min.js"></script>
<style type="text/css">
body{
background-color: f0f2f5;
}
</style>
  </head>
  
  <body>
    <div class="login_m" style="background-color: white;"><!-- 整体 -->
    	<div><h3>密码修改</h3></div>
    	<div class="login_padding login_boder" id="login_model">
    	<form id="form1" method="post" action="Logon.do?method=update">
  			<h2>原密码</h2>
    			<input type="password" name="oldpass" id="oldpass" class="txt_input">
  			<h2>新密码</h2>
    			<input type="password" name="newpass" id="newpass" class="txt_input">
    		<h2>确认密码</h2>
    			<input type="password" id="twopass" class="txt_input"><br>
    		<input type="button" class="sub_buttons" name="button" id="button" value="提交"/>
    	</form>
    		<span style="color:red;">${msg }</span>
		</div>
    </div>
  </body>
  <script type="text/javascript">
  	$("#button").click(function(){
  		var oldp=document.getElementById("oldpass");
  		var newp=document.getElementById("newpass");
  		var twop=document.getElementById("twopass");
  		if(oldp.value==""){
  			alert("请填写原密码");
  			return;
  		}
  		if(newp.value==""){
  			alert("请填写新密码");
  			return;
  		}
  		if(twop.value==""){
  			alert("请填写确认密码");
  			return;
  		}
  		if(twop.value!=newp.value){
  			alert("两次密码输入不一致！");
  			return;
  		}
  		document.getElementById("form1").submit();
  	});
  </script>
</html>
