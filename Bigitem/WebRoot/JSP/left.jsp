<%@page import="com.lzcb.bigitem.Entity.Tuser"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'left.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript" src="JS/jquery-3.2.1.min.js"></script>
  	<script type="text/javascript" src="JS/bi.load.js?v=1.0"></script>
<style type="text/css">
	a{
		color:fefefe;
		text-decoration: none;
	}
	body{
		background-image:url("Image/leftBpic.gif");
		background-repeat:repeat-y;
		color:fefefe;
		width: 220px;
		overflow:hidden;
	}
	ul {
	list-style-type: none;
	}
	#mainul{
		vertical-align:middle;
		font-size: 16px;
		margin: 0;
		padding: 5px;
	}
	li{
		cursor:pointer;
	}
	#mainul li ul li{
		padding:3px;
		margin: 3px;
		border-radius :5px;
	}
	#mainul li {
		margin: 3px;
	}
	span { display:-moz-inline-box; display:inline-block; width:180px;}
	.selected{
		background-color: 003366;
	}
	.selected2{
		background-color: 003399;
	}
</style>
<%
	Tuser user=(Tuser)request.getSession().getAttribute("user");
 %>
  </head>
  
  <body>
    <ul id="mainul">
    	<li><a target="mainPage" href="JSP/firstPage.jsp">后台首页</a></li>
    	<li style="height: 1px;background-color: 000066	;"></li>
    	<li data-num-p='01'><span>年度重大项目申报</span>
    		<ul>
    			<li data-num-p='01'><a target="mainPage" href="Xmsb.do?method=select">年度重大项目申报</a></li>
    		</ul>
    	</li>
    	<li style="height: 1px;background-color: 000066	;"></li>
    	<li><span>项目库</span>
    		<ul>
    			<li data-num-p='02'><a target="mainPage" href="Xmk.do?method=dnxm">当年市重大、区重点项目</a></li>
    			<li data-num-p='03'><a target="mainPage" href="Xmk.do?method=cbxm">储备项目</a></li>
    			<li data-num-p='04'><a target="mainPage" href="Xmk.do?method=lnxm">历年市重大、区重点项目</a></li>
    		</ul>
    	</li>
    	<li style="height: 1px;background-color: 000066	;"></li>
    	<li><span>项目调度管理</span><ul>
    			<li data-num-p='05'><a target="mainPage" href="Xmddsb.do?method=select">项目调度管理</a></li>
    			<li data-num-p='06'><a target="mainPage" href="Xmddsb.do?method=select1">项目调度查询(已审核)</a></li>
    			<li data-num-p='07'><a target="mainPage" href="Xmddsb.do?method=select2">项目调度查询(未通过)</a></li>
    		</ul>
    	</li>
    	<li data-num-p='13' style="height: 1px;background-color: 000066	;"></li>
    	<li data-num-p='13'><span>项目问题管理</span>
    		<ul>
    			<li data-num-p='13' ><a target="mainPage" href="XmwtglServlet?method=Wtsblist">项目问题管理</a></li>
    		</ul>
    	</li>
    	<li style="height: 1px;background-color: 000066	;"></li>
    	<%=(user!=null&&"admin".equals(user.getUserid())?"<li><a target='mainPage' href='JSP/testPage.jsp'>我的测试界面</a></li>":"") %>
   		<li  data-num-p='10'  style="height: 1px;background-color: 000066	;"></li>
    	<li  data-num-p='10' ><span>系统管理</span><ul>
    			
    			<li data-num-p='09'><a target="mainPage" href="JueseServlet?method=JueList">角色管理</a></li>
    			<li data-num-p='10'><a target="mainPage" href="YongServlet?method=YongList">用户管理</a></li>
    			<li data-num-p='11'><a target="mainPage" href="JSP/jbxx/dqxxgl.jsp">地区管理</a></li>
    			
    		</ul>
    	</li>
    	<li style="height: 1px;background-color: 000066	;"></li>
    	<li data-num-p='15'><span>新闻管理</span><ul>
    			<li ><a data-num-p='15' target="mainPage" href="Xwlm.do?method=select">新闻栏目</a></li>
    			<li ><a data-num-p='15' target="mainPage" href="Nry.do?method=select">内容页</a></li>
    		</ul>
    	</li>
    	
    	
    </ul>
  </body>
  <script type="text/javascript">
	function bb(){
		alert("nini");
	} 
  manageMenu("<%=request.getSession().getAttribute("power").toString()%>");
  $('#mainul').children('li').children('ul').hide();
  $('#mainul').children('li').children('span').click(function(){
  	$(this).next('ul').toggle(200);
  });
  $('#mainul').children('li').click(function(){
  	 $('#mainul').children('li').attr('class','');
  	 $(this).attr('class','selected');
  });
  $('#mainul').children('li').children('ul').children('li').click(function(){
  	 $('#mainul').children('li').children('ul').children('li').attr('class','');
  	 $(this).attr('class','selected2');
  });
  </script>
</html>
