<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>发布结果返回信息</title>
 	<link rel="shortcut icon" href="image/icon.png">
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script  type="text/javascript">
		function CloseWin() //这个不会提示是否关闭浏览器    
		{    
		window.opener=null;    
		//window.opener=top;    
		window.open("","_self");    
		window.close();    
		}  
		function clock()
		{
		i=i-1
		document.title="本窗口将在" + i + "秒后自动关闭!";
		if(i>0)
		{
			setTimeout("clock();",1000);
			var out=document.getElementById('immediate_time');
			out.innerHTML=i;
		}
		else CloseWin();
		}
		var i=3
	</script> 
	</head>
  
<body onload="clock()">
<%	String judge=(String)request.getAttribute("judge"); 
if(judge.equals("1")){%>
	<h1>信息发布成功！页面将在<label id="immediate_time"></label>秒后关闭</h1>
	<%} %>
<% if(judge.equals("2")){%>
	<h1>系统内部错误，或您的信息格式不对！页面将在<label id="immediate_time"></label>秒后关闭</h1>
<%} %>
</body>
</html>
