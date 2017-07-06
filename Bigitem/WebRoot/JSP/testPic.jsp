<%@page import="com.lzcb.bigitem.Entity.Xmddgl"%>
<%@page import="com.lzcb.bigitem.utils.DbHelper"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'testPage.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
	<link rel="stylesheet" type="text/css" href="CSS/webuploader.css">
	<link rel="stylesheet" type="text/css" href="CSS/diyUpload.css?v=1.0.0">
	<script type="text/javascript" src="JS/jquery-3.2.1.min.js" charset="UTF-8"></script>
	<script type="text/javascript" src="JS/webuploader.html5only.min.js"></script>
	<script type="text/javascript" src="JS/diyUpload.js"></script>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

<style type="text/css">

#box{ margin:50px auto; width:600px; min-height:400px; background:#FF9}
</style>

  </head>
  <body>
  <div id="box">
	<div id="test" ></div>
</div>
<div id="demo">
	<div id="as" ></div>
</div>

  </body>
  <script type="text/javascript">
  
  $('#test').diyUpload({
	url:'http://localhost:8080/Bigitem/UploadServlet.do?',
	success:function( data ) {
		console.info( data );
	},
	error:function( err ) {
		console.info( err );	
	}
});
  
  
  	
</script>
</html>
