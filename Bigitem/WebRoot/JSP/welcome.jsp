 <%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>临淄区重点项目信息管理平台</title>
<style> 
  frameset,frame{
  	margin:0;
  }
</style>
</head>
    <frameset rows="113,*" frameborder="no">
    	<frame name="top" src="JSP/top.jsp" frameborder="0" noresize="noresize" scrolling="no" marginheight="0" marginwidth="0"></frame>
    	<frameset cols="220,*">
    		<frame id="left" frameborder="0" name="left" title="left" src="JSP/left.jsp" marginheight="0" marginwidth="0" noresize="noresize"></frame>
    		<frame id="mainPage" frameborder="0" noresize="noresize" name="mainPage" marginheight="5" marginwidth="5" title="mainPage" src="JSP/firstPage.jsp" style="background-color: f0f2f5;"></frame>
    	</frameset>
    </frameset>
</html>
