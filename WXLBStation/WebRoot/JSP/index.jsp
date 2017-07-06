<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="http://1678x27n55.51mypc.cn/WXLBStation/JS/jweixin-1.2.0.js"></script>
	<script type="text/javascript">
		wx.config({
			debug:true,
			appId:'${corpId}',
			timestamp:'${time}',
			nonceStr:'${nonceStr}',
			signature:'${str1}',
			jsApiList:['chooseImage','checkJsApi']
		});
		wx.ready(function(){
			wx.checkJsApi({jsApiList:['chooseImage'],success:function(res){
				//
			}});
		});
		wx.error(function(res){
			console.log(res);
		});
	</script>
  </head>
  
  <body>
    This is my JSP page.bellow JSP <br>
  </body>
</html>
