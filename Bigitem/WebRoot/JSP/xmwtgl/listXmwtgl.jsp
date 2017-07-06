<%@page import="com.lzcb.bigitem.dao.PinglunDaoImpl"%>
<%@page import="com.lzcb.bigitem.dao.PinglunDao"%>
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
    
    <title>My JSP 'listXmwt.jsp' starting page</title>
    
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
td{ text-align:center;}
</style>

  </head>
  <%
	int now=Integer.parseInt(request.getAttribute("nowp").toString());
	int sum=Integer.parseInt(request.getAttribute("sump").toString());  
   %>
  <body>
    <div class="title">
		<span class="tcontext">项目问题管理</span>
	</div>

	&nbsp;&nbsp;&nbsp;&nbsp;<input data-num-p="1301" type="button" value="添加" class="btn"
		onclick="window.location.href='${pageContext.request.contextPath}/XmwtglServlet?method=getXmwt'" />
		<input data-num-p='1306' type="button" value="我的问题" class="btn"
		onclick="window.location.href='${pageContext.request.contextPath}/XmwtglServlet?method=selectMyXmwt'" />
	<div class="tlist">
		<div class="mutiTable" style="margin: 0px;padding: 0px;">
		<table>
            	<tr>
            		<th style="width:4%">编号</th>
                	<th style="width:10%">项目</th>
                    <th style="width:10%">建设单位</th>
                    <th style="width:10%">标题</th>
                    <th style="width:5%">联系人</th>
                    <th style="width:7%">联系电话</th>
                    <th style="width:10%">问题提出时间</th>
                    <th style="width:10%">最后评论时间</th>
                    <th style="width:8%">是否有未读信息</th>
                    <th style="width:5%">审阅状态</th>
                    <th style="width:21%">操作</th>
                <c:forEach items="${xmwtlist }" var="xmwt" varStatus="bh">
	                <tr>
	                	<td>${bh.count }</td>
	                	<td>${xmwt.xmmc }</td>
	                    <td>${xmwt.jsdwmc }</td>
	                    <td><a style="text-decoration: underline;color: blue;cursor: pointer;" onclick="Wtpl(${xmwt.id})">${xmwt.bt }</a></td>
	                    <td>${xmwt.lxr }</td>
	                    <td>${xmwt.lxdh }</td>
	                    <td>${xmwt.lrsj }</td>
	                    <td>${xmwt.plsj }</td>
	                    <td <c:if test="${xmwt.wdxx eq '是' }">style="color: blue"</c:if>>${xmwt.wdxx }</td>
	                    <td <c:if test="${xmwt.syzt eq '未审阅' }">style="color: red"</c:if> >${xmwt.syzt }</td>
	                    <td><input data-num-p="1302" type="button" value="查看问题详情" class="btn-intable"
							onclick="window.location.href='${pageContext.request.contextPath}/XmwtglServlet?method=XqXmwt&wtid=${xmwt.id }'"  /> <input data-num-p="1303" type="button" value="审阅完成" class="btn-intable"
							onclick="window.location.href='${pageContext.request.contextPath}/XmwtglServlet?method=SyXmwt&id=${xmwt.id }'" /> <input data-num-p="1304" type="button" value="编辑" class="btn-intable"
							onclick="window.location.href='${pageContext.request.contextPath}/XmwtglServlet?method=editXmwt&id=${xmwt.id }'" /> <input data-num-p="1305" type="button" value="删除" class="btn-intable"
							onclick="delXmwt(${xmwt.id })" /></td>
	                </tr>
                </c:forEach>
		</table>    
		
            
            
        </div>
        <div><span style="float:right;"><a href="<%=(now>1?"XmwtglServlet?method=Wtsblist&nowp="+now+"&topage=sub":"javascript:void(0)")%>">上一页</a>&nbsp;
        <span><%=now %>/<%=sum %></span>&nbsp;<a href="<%=(sum-now>0?"XmwtglServlet?method=Wtsblist&nowp="+now+"&topage=add":"javascript:void(0)")%>">下一页</a></span></div>
     </div>
     <script type="text/javascript" src="JS/jquery-3.2.1.min.js"></script>
     <script type="text/javascript" src="JS/bi.load.js"></script>
     <script type="text/javascript">
     	$("tr:odd").css("background-color","#F5F5F5"); 
     	manageView("<%=request.getSession().getAttribute("power").toString()%>","13");
     	
     	function delXmwt(id) {
			if (window.confirm("是否确认删除")) {
				url = "${pageContext.request.contextPath}/XmwtglServlet?method=deleteXmwt&id="
						+ id;
				window.location.href = url;
			}
		}
		function Wtpl(wtid){
			url="${pageContext.request.contextPath}/PinglunServlet?method=listPing&wtid="+wtid;
			window.location.href = url;
		}
     </script>
  </body>
  
</html>
