<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@page import="com.lzcb.bigitem.utils.DbHelper"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<base href="<%=basePath%>">
	<title>临淄区重点项目信息管理平台</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" type="text/css" href="CSS/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="CSS/index.css">
	<script type="text/javascript" src="https://api.html5media.info/1.1.8/html5media.min.js">		
	</script>
	<script type="text/javascript" src="JS/jquery-3.2.1.min.js" charset="UTF-8"></script>
	<script type="text/javascript" src="JS/bootstrap.min.js"></script>
	<script type="text/javascript" src="fusioncharts/fusioncharts.js"></script>
    <script type="text/javascript" src="fusioncharts/themes/fusioncharts.theme.fint.js"></script>
	<script type="text/javascript" src="JS/index.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
		//$('.tab-content .item:first').addClass('active');
		//$('#t_zcjd .item:first').addClass('active');		
		if($(window).width()>=1200){
		$('body').css("width","100%");
		}
		else{
		$('body').css("width","1200");
		}}
		);
	</script>

</head>
<body>
<div id="top">
    <div class="head">    	
    	<div class="logo">
    		<img src="Image/logo.gif">
    	</div>
    	<div class="login">
    		您好，请<a href="http://218.56.106.137:8080/Bigitem">登录</a>
    	</div>
    </div>	
</div>



	<div id="content">
    <div id="show_top">
    	<label><a href="home.jsp">首页>></a>
          <%String n= request.getParameter("n");
          //System.out.println("111"+n);
          if("1".equals(n)){out.println("重点办工作动态");}
          else if ("2".equals(n)){out.println("政策解读");} %>
               
        </label>
    </div>
    <div id="show_content">
     <%String p=request.getParameter("p"); 
     DbHelper.update("update T_NRY set ydcs=(ydcs+1) where id="+p);
     Map m5=DbHelper.queryAClob("select * from T_NRY where SFXS=1 AND ID="+p,"ZW");
  	        		%>
					
    <div class="title">
    <h3>
    <% out.println(m5.get("BT")); %>
    </h3>
     <h4>发表时间:
     <% out.println(m5.get("FBSJ")); %>&nbsp阅读次数: <% out.println(m5.get("YDCS")); %>
         
     </h4>
    </div>
    <p><hr></p>
    <label>
    <%if(m5.get("ZW")==null){}else{
    	 out.println(m5.get("ZW"));}%>
    
    </label>    	
    </div>
    </div>



<div class="footer">
	
</div>
</body>
</html>