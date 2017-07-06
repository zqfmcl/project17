<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'AccessCode.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script type="text/javascript">
function sss(){
	alert(111);
}
	function showoaDetail(){
	var getUrl="http://1678x27n55.51mypc.cn/WXLBStation/LiveBOSLoginServlet";
	var changeurl=getUrl.replace(/[:]/g,"%3a").replace(/[/]/g,"%2f").replace(/[\?]/g,"%3f").replace(/[=]/g,"%3d").replace(/[&]/g,"%26");//符号替换
	var tourl="https://open.weixin.qq.com/connect/oauth2/authorize?"+"appid=wx9e6b5f7e6b9f86a2&redirect_uri="+changeurl+"&response_type=code&scope=snsapi_base&state=location#wechat_redirect";
	location.href=tourl;
}
	</script>
  </head>
  
  <body onload="showoaDetail()">
    This is my JSP page. <br>
  </body>
</html>
