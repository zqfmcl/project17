<%@page import="com.lzcb.bigitem.Entity.Tuser"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>top</title>

<style type="text/css">
.top-ul-left li {
	float: left;
	list-style: none;
	padding: 0;
	margin-left: 5px;
}

.top-ul-right li {
	float: right;
	list-style: none;
	padding: 0;
	margin-right: 5px;
}

.top-logo {
	float: left;
	background-image: url("Image/topBpic.gif");
	background-repeat: repeat-x;
}

body, div {
	margin: 0;
}

.userinfo {
	position: relative;
	float: right;
	white-space: nowrap;
	top: 10px;
	right: 15px;
}

a {
	color: white;
	text-decoration: none;
	border-radius: 2px;
	padding: 3px;
}

a:HOVER {
	background-color: #03a9f4;
}

.hello {
	color: white;
}

.navi_body {
	overflow: hidden;
	height: 21px;
	transition: height ease 0.5s;
}

.navi_body:hover {
	height: 300px;
}

.navi_head>div>span {
	width: 150px;
	height: 300px;
	font-weight: bold;
	color: #FFF;
	font-size: 14px;
}

.navi_head>div>span>p a {
	color: #FFF;
	text-decoration: none;
}

.navi_head>div>span>p a:hover {
	color: #FFF;
	text-decoration: underline;
}

.navi_title {
	font-size: 16px;
}

.navi_head>div>span:hover {
	background: rgba(100, 100, 100, 0.2);
}
</style>
<%
	Tuser user = (Tuser) request.getSession().getAttribute("user");
%>
    <script type="text/javascript" src="JS/jquery-3.2.1.min.js"></script>
  	<script type="text/javascript" src="JS/bi.load.js?v=1.0"></script>
 	<script type="text/javascript">

			
			$(document).ready(setInterval(aa, 20000));

			function bb(){
				alert("你好");
			}
			function aa() {
				var messageInfo = "消息管理";
				var type = "json";
				$.getJSON("${pageContext.request.contextPath}/MessageServlet",
						{
							"messageInfo" : messageInfo
						}, function(data) {
							if (data != undefined && data != null) {
								var messages = data.messages;
								$.each(messages, function(i, obj) {
									$("#span" + i + "").text(obj.message);
								});
							} else {
								alert("操作失败。");
							}
						});
			}
		</script>
 
 
  </head>
  
  <body>
  <div class="top-logo"  style="width:100%;">
  <img src="Image/namelabel.gif" border="0" usemap="#namemap" alt="临淄区重点项目信息管理平台"/>
  	<map name="namemap" id="namemap">
 		<area shape="rect" coords="50,10,600,100" href ="JSP/welcome.jsp" alt="Sun" />
	</map>
	
	<div class="userinfo"><span class="hello">尊敬的 <span style="font-style: italic;color:#d8cfcf"><%=user.getUsername()%></span>，您好. </span>&nbsp;
	<a href="Logon.do?method=logout" target="_top">注销</a> &nbsp;
	<a href="JSP/user/updatepwd.jsp" target="mainPage">修改密码</a></div>
	<div style="float: right;width: 130px">
    	<div class="navi_body" style="margin-top: 9px;margin-bottom: 0px;">
    	<div class="navi_head">
    		<div style="width:180px; margin-left:0;">
    		<span>
	    		<p style="margin-top:0px;margin-left:10px;margin-bottom: 5px;" class="navi_title"> 消息管理<label style="color: red" id="span7"></label></p>
	    		<p data-num-p='1401' style="margin-top: 4px;margin-bottom: 0px;" ><a target="mainPage" href="Xmsb.do?method=select">项目申报消息<label style="color: red" id="span0"></label></a></p>
	    		<p data-num-p='1402' style="margin-top: 0px;margin-bottom: 0px;"><a target="mainPage" href="Xmsb.do?method=select">项目回退信息 <label style="color: red" id="span1"></label></a></p>
	    		<p data-num-p='1403' style="margin-top: 0px;margin-bottom: 0px;"><a target="mainPage" href="XmwtglServlet?method=Wtsblist">问题回复消息<label style="color: red" id="span2"></label></a></p>
	    		<p data-num-p='1404' style="margin-top: 0px;margin-bottom: 0px;"><a target="mainPage" href="XmwtglServlet?method=Wtsblist">项目问题消息 <label style="color: red" id="span3"></label></a></p>
	    		<p data-num-p='1405' style="margin-top: 0px;margin-bottom: 0px;"><a target="mainPage" href="Xmddsb.do?method=select">项目调度消息 <label style="color: red" id="span4"></label></a></p>
	    		<p data-num-p='1406' style="margin-top: 0px;margin-bottom: 0px;"><a target="mainPage" href="Xmddsb.do?method=select">调度回退消息 <label style="color: red" id="span5"></label></a></p>
	    		<p data-num-p='1407' style="margin-top: 0px;margin-bottom: 0px;"><a target="mainPage" href="Xmddsb.do?method=select2">调度否决消息 <label style="color: red" id="span6"></label></a></p>
	    	</span>
	    	</div>
    	</div>
    </div>
    </div>
    
  </div>
   <script type="text/javascript" src="JS/bi.load.js"></script>
  <script type="text/javascript">
  manageView("<%=request.getSession().getAttribute("power").toString()%>","14");
  </script>
  </body>
</html>
