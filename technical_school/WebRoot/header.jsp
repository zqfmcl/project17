<%@page import="java.sql.ResultSet"%>
<%@page import="java.io.*"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="school.Dateout.Dateout"%>
<%@page import="school.convert.Convert"%>
<%@page import="school.connectDB.OperateDB"%>
<%@page import="javax.sql.rowset.CachedRowSet"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	File tempfile=new File(path+"/uploads");
	//System.out.println(tempfile.getAbsolutePath());
	if (!tempfile.exists()) {
		tempfile.mkdir();								
		}
%>

<!DOCTYPE HTML>

<html>

<head>
	<title>淄博工业学校</title>
	<link rel="shortcut icon" href="image/icon.png">
	<meta name="renderer" content="webkit|ie-comp|ie-stand">
	<meta name="viewport" content="width=device-width, initial-scale=1">	
	<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="css/index.css">
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/index.js"></script>
	<script type="text/javascript" src="js/flexpaper.js"></script>
	<script type="text/javascript" src="js/flexpaper_handlers.js"></script>
	<script src="js/Chart.js"></script>
	
	<script type="text/javascript">
		$(document).ready(function(){

		if($(window).width()>=1200){
		$('body').css("width","100%");
		}
		else{
		$('body').css("width","1200");
		}
		$('#scroll').pic_scroll(20);
		$("#menu ul li:last").css("border-right","2px solid #1a447a");
		});
	</script>
</head>
<body style="width:1200px">
<div class="contain">
	<div id="top"><!--头部-->
		<div id="logo"><img src="image/logo.png"></div>
		<div id="text"><img src="image/text.png"></div>
		<div id="search" style="margin-top:30px">
		<form action="search.jsp" method="post">
		<span><img src="image/search.gif"></span>
		<span><input type="text" name="content" id="in_input" placeholder="站内搜索"></span>
		<span>
		<input type="submit" name="in_submit" style="background-image: url(image/commit.gif); width: 66px;height: 28px; border: 0px solid #ffffff;" value=""></span>
		</form>
		</div>
		
	</div>
		<div style="position: relative;left: 100%;bottom: 45px;font-size: 15px;"><a target="_blank" href="http://218.56.106.137:9183/logout.do">管理员登陆</a></div>
	
</div>
<div id="menu"><!--导航栏目-->
	<ul>
	  <li>			
			<a href="/technical_school/index.jsp" >
			信息首页
			</a>
	  </li>
	  <%
			OperateDB s=new OperateDB();
  	        CachedRowSet mm= s.select_menu();	  	       
  	        while(mm.next()){
	  %>
			<li>
			<a href="list.jsp?n=<%=mm.getString("SJKBM") %>&m=<%=mm.getInt("ID")%>">
			<%out.println(mm.getString("LMMC"));%>
			</a>
			</li>
		<%} 
		mm.close();
		s.ReleaseConn();
		%>
	</ul>
</div>