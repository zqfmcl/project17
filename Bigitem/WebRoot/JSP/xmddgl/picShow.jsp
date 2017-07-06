<%@ page language="java" import="java.util.*" pageEncoding="utf-8" isELIgnored="false"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>项目图片</title>
    
	<meta http-equiv="pragma" content="no-cache">

  </head>
  
  <body>
    <img src="Download.do?fjid=<%=request.getParameter("fjid")%>">
  </body>
</html>
