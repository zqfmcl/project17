<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>欢迎使用临淄区重点项目信息管理平台</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="CSS/bi.main.css">
<style type="text/css">

</style>
  </head>
  
  <body>
    <h3>欢迎使用 临淄区重点项目信息管理平台</h3>
    <hr>
    <div>
    功能介绍：<br>
    系统以“项目申报、项目库、调度管理、问题管理、统计分析、政策信息、信息公开”等八大功能为核心，实现对重大项目的全程跟踪服务、实时调度和信息公开。
    </div>
    <!-- <div>
    操作手册：<br>
    <a href="">淄博重大项目信息管理系统操作手册-下载</a>
    </div> -->
    <div>
     注意事项：<br>
   本系统功能需要在IE9及以上IE浏览器、Chrome、火狐等主流浏览器下使用。<br>
建议使用分辨率在1280*800以上。
    </div>
  </body>
</html>
