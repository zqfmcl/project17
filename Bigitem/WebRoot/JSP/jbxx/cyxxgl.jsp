<%@page import="com.lzcb.bigitem.dao.CyxxDaoImpl"%>
<%@page import="com.lzcb.bigitem.dao.JbxxDao"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>产业管理</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<link rel="stylesheet" type="text/css" href="CSS/bi.main.css">
	<script type="text/javascript" src="JS/jquery-3.2.1.min.js" charset="UTF-8"></script>
	<style type="text/css">
	
	</style>
<%
	JbxxDao dao=new CyxxDaoImpl();
 %>
  </head>
  
  <body>
    <h2>产业管理</h2>
    <hr>
    <a target="mainPage" href="JSP/jbxx/cyxxAdd.jsp"><input data-num-p='1101' class="btn" style="min-width: 46px;min-height: 21px;" type="button" value="添加"/></a>
    <div class="cylist">
    <%=dao.queryuList("0") %>
    </div>
  </body>
   <script type="text/javascript" src="JS/bi.load.js"></script>
  <script type="text/javascript">
  manageView("<%=request.getSession().getAttribute("power").toString()%>","11");
  $(document).ready(function(){
  	$("li").children("ul").hide();
  	$("ul").parent("li").css("list-style-image","url('Image/forwordright.png')");
  	$(".endNode").parent("li").css("list-style-image","url('Image/forwordright2.png')");
  });
  $("ul").parent("li").children("label").click(function(){
  	if($(this).parent().children("ul").is(":hidden")){
  		$(this).parent().children("ul").show();
  		$(this).parent().children("ul").css("list-style-image","url('Image/forwordright.png')");
  		$(this).parent().css("list-style-image","url('Image/forwordbellow.png')");
  	}else{
  		$(this).parent().children("ul").hide();
  		$(this).parent().css("list-style-image","url('Image/forwordright.png')");
  	}
  });
  </script>
</html>
