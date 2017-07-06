<%@ page language="java" import="java.util.*" pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'editXmwt.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript" src="JS/jquery-3.2.1.min.js"></script>
	<link rel="stylesheet" type="text/css" href="CSS/bi.main.css">
<style type="text/css">
.title, form, .tlist {
	width: 95%;
	margin-top: 26px;
	margin-right: 20px;
	margin-bottom: 20px;
	margin-left: 20px;
}

.title {
	padding: 25px;
	padding-bottom: 25px;
	padding-left: 25px;
	padding-right: 0px;
	padding-top: 25px;
}

.title .tcontext {
	font-size: 24;
}

form, .tlist {
	padding: 10px;
}

div, form {
	background-color: white;
}

form td {
	padding: 5px;
}

from input, select {
	width: 100px;
}

.tlist table {
	margin: 0;
	border-left-style: solid;
	border-left-width: 1px;
	border-top-style: solid;
	border-top-width: 1px;
	border-color: #ccc;
	border-collapse: collapse;
}

.tlist div {
	margin: 0px;
	white-space: normal;
	text-overflow: ellipsis;
	border-collapse: collapse;
	overflow: hidden;
}

.tlist th, .tlist td {
	word-wrap: break-word;
	word-break: break-all;
	border-right-style: solid;
	border-right-width: 1px;
	border-bottom-style: solid;
	border-bottom-width: 1px;
	border-color: #ccc;
	margin: 0px;
	display: table-cell;
	overflow: hidden;
	overflow-x: hidden;
	overflow-y: hidden;
	text-overflow: ellipsis;
	white-space: normal;
}

.tlist tr {
	margin: 0px;
}

.showmsg {
	padding: 20px;
	font-size: 14px;
	position: fixed;
	top: 0px;
	margin-left: 45%;
	height: 20px;
	opacity: 0;
	background-color: #f7e1e1;
}
</style>

  </head>
  
  <body>
     <div class="title">
		<span class="tcontext">编辑</span>&nbsp;<a
			style="text-decoration: none;font-size: 12px;" target="mainPage"
			href="javascript:history.back(-1)">返回列表</a>
	</div>

	&nbsp;&nbsp;&nbsp;&nbsp;
	<div class="tlist">
		<div class="mutiTable" style="max-height:440px;margin: 0px;padding: 0px;">
		<form action="" name="form1" method="post">
		<table>
            	
            		
                	<tr><th>项目</th><td>${xmwt.xmmc }</td></tr>
                    <tr><th>建设单位</th><td>${xmwt.jsdwmc }</td></tr>
                    <tr><th>标题</th><td><input type="text" name="bt" value="${xmwt.bt }"> </td></tr>
                    <tr><th>问题描述</th><td><textarea name="wtms1" id="wtms" style="min-height: 100px;min-width: 800px"></textarea></td></tr>
                    <tr><th>问题情况</th><td><textarea name="wtqk1" id="wtqk" style="min-height: 100px;min-width: 800px"></textarea></td></tr>
                    <tr><th>联系人</th><td><input type="text" name="lxr" value="${xmwt.lxr }"></td></tr>
                    <tr><th>联系电话</th><td><input type="text" name="lxdh" value="${xmwt.lxdh }"></td></tr>
                    
               
              
		</table> 
		  
            <input type="button" value="保存" onclick="baocun(${xmwt.id })">
          </form>   
        </div>
     </div>
     <script type="text/javascript">
     	var wtms="${xmwt.wtms}";
		

		var reg=new RegExp("<br>","g");
			wtms=wtms.replace(reg,'\n');

			$("#wtms").val(wtms);
			
		var wtqk="${xmwt.wtqk }";
		
	
		var reg=new RegExp("<br>","g");
			wtqk=wtqk.replace(reg,'\n');5

			$("#wtqk").val(wtqk);
		function baocun(id){
		var wtms=$("#wtms").val();
			var reg=new RegExp("\n","g");
			wtms=wtms.replace(reg,'<br>');
			var wtqk=$("#wtqk").val();
			var reg=new RegExp("\n","g");
			wtqk=wtqk.replace(reg,'<br>');
		form1.action="${pageContext.request.contextPath }/XmwtglServlet?wtms="+wtms+"&wtqk="+wtqk+"&method=updateXmwt&fenlei=sb&id="+id+"";
		form1.submit();
		}
     </script>
   </body>
</html>
