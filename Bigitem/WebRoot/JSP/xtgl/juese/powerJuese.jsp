<%@page import="com.lzcb.bigitem.dao.JueseDaoImpl"%>
<%@page import="com.lzcb.bigitem.dao.JueseDao"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"
	isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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

<title>My JSP 'powerJuese.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="CSS/bi.main.css">
<script type="text/javascript" src="JS/jquery-3.2.1.min.js"></script>
<style type="text/css">
ul {
	list-style-type: none;
}

#mainul {
	vertical-align: middle;
	font-size: 16px;
	margin: 0;
	padding: 5px;
}

li {
	cursor: pointer;
}

#mainul li ul li {
	padding: 3px;
	margin: 3px;
	border-radius: 5px;
}

#mainul li {
	margin: 3px;
}

span {
	display: -moz-inline-box;
	display: inline-block;
	
}
input{
	min-width: 0px;
}
</style>
<% JueseDao dao=new JueseDaoImpl(); %>

</head>

<body onload="myfunction()" >
	<div  class="div-title">
		<span style="font-size: 20px;">权限分配</span> &nbsp;<a
			style="text-decoration: none;font-size: 12px;" target="mainPage"
			href="javascript:history.back(-1)">返回列表</a>
	</div>
	<form
		action="${pageContext.request.contextPath }/JueseServlet?method=JueUpdatePower"
		method="post">
		<input type="hidden" name="id" value="${id }" />
		
		<div style="float: left;width:50%;">
			<ul id="mainul" style="margin-left: 10px;">
				<li><input id="li1" onclick="checkAll(this,'li1')" name="power_id" type="checkbox" value="145"
							<c:forEach items="${plist }" var="power"><c:if test="${power==145 }" >checked="checked"</c:if></c:forEach> /><label>年度重大项目申报</label>
					<ul>
						<li><input onclick="checkfjd(this,'li1')" class="li1" name="power_id" type="checkbox" value="77"
							<c:forEach items="${plist }" var="power"><c:if test="${power==77 }" >checked="checked"</c:if></c:forEach> />添加<label class='endNode'></label></li>
						<li><input onclick="checkfjd(this,'li1')" class="li1" name="power_id" type="checkbox" value="78"
							<c:forEach items="${plist }" var="power"><c:if test="${power==78 }" >checked="checked"</c:if></c:forEach> />导出<label class='endNode'></label></li>
						<li><input onclick="checkfjd(this,'li1')" class="li1" name="power_id" type="checkbox" value="79"
							<c:forEach items="${plist }" var="power"><c:if test="${power==79 }" >checked="checked"</c:if></c:forEach> />查看<label class='endNode'></label></li>
						<li><input onclick="checkfjd(this,'li1')" class="li1" name="power_id" type="checkbox" value="80"
							<c:forEach items="${plist }" var="power"><c:if test="${power==80 }" >checked="checked"</c:if></c:forEach> />编辑<label class='endNode'></label></li>
						<li><input onclick="checkfjd(this,'li1')" class="li1" name="power_id" type="checkbox" value="81"
							<c:forEach items="${plist }" var="power"><c:if test="${power==81 }" >checked="checked"</c:if></c:forEach> />删除<label class='endNode'></label></li>
						<li><input onclick="checkfjd(this,'li1')" class="li1" name="power_id" type="checkbox" value="82"
							<c:forEach items="${plist }" var="power"><c:if test="${power==82 }" >checked="checked"</c:if></c:forEach> />word导出<label class='endNode'></label></li>
						<li><input onclick="checkfjd(this,'li1')" class="li1" name="power_id" type="checkbox" value="83"
							<c:forEach items="${plist }" var="power"><c:if test="${power==83 }" >checked="checked"</c:if></c:forEach> />审核<label class='endNode'></label></li>
						<li><input onclick="checkfjd(this,'li1')" class="li1" name="power_id" type="checkbox" value="84"
							<c:forEach items="${plist }" var="power"><c:if test="${power==84 }" >checked="checked"</c:if></c:forEach> />否决<label class='endNode'></label></li>
					</ul></li>
				<li><input id="li2" onclick="checkAll(this,'li2')" name="power_id" type="checkbox" value="146"
							<c:forEach items="${plist }" var="power"><c:if test="${power==146 }" >checked="checked"</c:if></c:forEach> /><label>当年市重大、区重点项目</label>
					<ul>
						<li><input onclick="checkfjd(this,'li2')" class="li2" name="power_id" type="checkbox" value="85"
							<c:forEach items="${plist }" var="power"><c:if test="${power==85 }" >checked="checked"</c:if></c:forEach> />导出<label class='endNode'></label></li>
						<li><input onclick="checkfjd(this,'li2')" class="li2" name="power_id" type="checkbox" value="86"
							<c:forEach items="${plist }" var="power"><c:if test="${power==86 }" >checked="checked"</c:if></c:forEach> />查看<label class='endNode'></label></li>
						<li><input onclick="checkfjd(this,'li2')" class="li2" name="power_id" type="checkbox" value="87"
							<c:forEach items="${plist }" var="power"><c:if test="${power==87 }" >checked="checked"</c:if></c:forEach> />编辑<label class='endNode'></label></li>
						<li><input onclick="checkfjd(this,'li2')" class="li2" name="power_id" type="checkbox" value="88"
							<c:forEach items="${plist }" var="power"><c:if test="${power==88 }" >checked="checked"</c:if></c:forEach> />删除<label class='endNode'></label></li>

						<li><input onclick="checkfjd(this,'li2')" class="li2" name="power_id" type="checkbox" value="89"
							<c:forEach items="${plist }" var="power"><c:if test="${power==89 }" >checked="checked"</c:if></c:forEach> />审核<label class='endNode'></label></li>
						<li><input onclick="checkfjd(this,'li2')" class="li2" name="power_id" type="checkbox" value="90"
							<c:forEach items="${plist }" var="power"><c:if test="${power==90 }" >checked="checked"</c:if></c:forEach> />否决<label class='endNode'></label></li>
						<li><input onclick="checkfjd(this,'li2')" class="li2" name="power_id" type="checkbox" value="91"
							<c:forEach items="${plist }" var="power"><c:if test="${power==91 }" >checked="checked"</c:if></c:forEach> />word导出<label class='endNode'></label></li>
					</ul></li>
				<li><input id="li3" onclick="checkAll(this,'li3')" name="power_id" type="checkbox" value="147"
							<c:forEach items="${plist }" var="power"><c:if test="${power==147 }" >checked="checked"</c:if></c:forEach> /><label>储备项目</label>
					<ul>
						<li><input onclick="checkfjd(this,'li3')" class="li3" name="power_id" type="checkbox" value="92"
							<c:forEach items="${plist }" var="power"><c:if test="${power==92 }" >checked="checked"</c:if></c:forEach> />导出<label class='endNode'></label></li>
						<li><input onclick="checkfjd(this,'li3')" class="li3" name="power_id" type="checkbox" value="93"
							<c:forEach items="${plist }" var="power"><c:if test="${power==93 }" >checked="checked"</c:if></c:forEach> />查看<label class='endNode'></label></li>
						<li><input onclick="checkfjd(this,'li3')" class="li3"  name="power_id" type="checkbox" value="94"
							<c:forEach items="${plist }" var="power"><c:if test="${power==94 }" >checked="checked"</c:if></c:forEach> />编辑<label class='endNode'></label></li>
						<li><input onclick="checkfjd(this,'li3')" class="li3"  name="power_id" type="checkbox" value="95"
							<c:forEach items="${plist }" var="power"><c:if test="${power==95 }" >checked="checked"</c:if></c:forEach> />删除<label class='endNode'></label></li>

						<li><input onclick="checkfjd(this,'li3')" class="li3"  name="power_id" type="checkbox" value="96"
							<c:forEach items="${plist }" var="power"><c:if test="${power==96 }" >checked="checked"</c:if></c:forEach> />审核<label class='endNode'></label></li>
						<li><input onclick="checkfjd(this,'li3')" class="li3"  name="power_id" type="checkbox" value="97"
							<c:forEach items="${plist }" var="power"><c:if test="${power==97 }" >checked="checked"</c:if></c:forEach> />否决<label class='endNode'></label></li>
						<li><input onclick="checkfjd(this,'li3')" class="li3"  name="power_id" type="checkbox" value="98"
							<c:forEach items="${plist }" var="power"><c:if test="${power==98 }" >checked="checked"</c:if></c:forEach> />word导出<label class='endNode'></label></li>
					</ul></li>
				<li><input id="li4" onclick="checkAll(this,'li4')" name="power_id" type="checkbox" value="148"
							<c:forEach items="${plist }" var="power"><c:if test="${power==148 }" >checked="checked"</c:if></c:forEach> /><label>历年市重大、区重点项目</label>
					<ul>
						<li><input onclick="checkfjd(this,'li4')" class="li4"  name="power_id" type="checkbox" value="99"
							<c:forEach items="${plist }" var="power"><c:if test="${power==99 }" >checked="checked"</c:if></c:forEach> />导出<label class='endNode'></label></li>
						<li><input onclick="checkfjd(this,'li4')" class="li4" name="power_id" type="checkbox" value="100"
							<c:forEach items="${plist }" var="power"><c:if test="${power==100 }" >checked="checked"</c:if></c:forEach> />查看<label class='endNode'></label></li>
						<li><input onclick="checkfjd(this,'li4')" class="li4" name="power_id" type="checkbox" value="101"
							<c:forEach items="${plist }" var="power"><c:if test="${power==101 }" >checked="checked"</c:if></c:forEach> />编辑<label class='endNode'></label></li>
						<li><input onclick="checkfjd(this,'li4')" class="li4" name="power_id" type="checkbox" value="102"
							<c:forEach items="${plist }" var="power"><c:if test="${power==102 }" >checked="checked"</c:if></c:forEach> />删除<label class='endNode'></label></li>

						<li><input onclick="checkfjd(this,'li4')" class="li4" name="power_id" type="checkbox" value="103"
							<c:forEach items="${plist }" var="power"><c:if test="${power==103 }" >checked="checked"</c:if></c:forEach> />审核<label class='endNode'></label></li>
						<li><input onclick="checkfjd(this,'li4')" class="li4" name="power_id" type="checkbox" value="104"
							<c:forEach items="${plist }" var="power"><c:if test="${power==104 }" >checked="checked"</c:if></c:forEach> />否决<label class='endNode'></label></li>
						<li><input onclick="checkfjd(this,'li4')" class="li4" name="power_id" type="checkbox" value="105"
							<c:forEach items="${plist }" var="power"><c:if test="${power==105 }" >checked="checked"</c:if></c:forEach> />word导出<label class='endNode'></label></li>
					</ul></li>
				<li><input id="li5" onclick="checkAll(this,'li5')" name="power_id" type="checkbox" value="149"
							<c:forEach items="${plist }" var="power"><c:if test="${power==149 }" >checked="checked"</c:if></c:forEach> /><label>项目调度管理</label>
					<ul>
						<li><input onclick="checkfjd(this,'li5')" class="li5" name="power_id" type="checkbox" value="106"
							<c:forEach items="${plist }" var="power"><c:if test="${power==106 }" >checked="checked"</c:if></c:forEach> />添加<label class='endNode'></label></li>
						<li><input onclick="checkfjd(this,'li5')" class="li5" name="power_id" type="checkbox" value="107"
							<c:forEach items="${plist }" var="power"><c:if test="${power==107 }" >checked="checked"</c:if></c:forEach> />导出<label class='endNode'></label></li>
						<li><input onclick="checkfjd(this,'li5')" class="li5" name="power_id" type="checkbox" value="108"
							<c:forEach items="${plist }" var="power"><c:if test="${power==108 }" >checked="checked"</c:if></c:forEach> />查看<label class='endNode'></label></li>
						<li><input onclick="checkfjd(this,'li5')" class="li5" name="power_id" type="checkbox" value="109"
							<c:forEach items="${plist }" var="power"><c:if test="${power==109 }" >checked="checked"</c:if></c:forEach> />编辑<label class='endNode'></label></li>
						<li><input onclick="checkfjd(this,'li5')" class="li5" name="power_id" type="checkbox" value="110"
							<c:forEach items="${plist }" var="power"><c:if test="${power==110 }" >checked="checked"</c:if></c:forEach> />删除<label class='endNode'></label></li>

						<li><input onclick="checkfjd(this,'li5')" class="li5" name="power_id" type="checkbox" value="111"
							<c:forEach items="${plist }" var="power"><c:if test="${power==111 }" >checked="checked"</c:if></c:forEach> />审核<label class='endNode'></label></li>
						<li><input onclick="checkfjd(this,'li5')" class="li5" name="power_id" type="checkbox" value="113"
							<c:forEach items="${plist }" var="power"><c:if test="${power==113 }" >checked="checked"</c:if></c:forEach> />否决<label class='endNode'></label></li>
					</ul></li>
				<li><input id="li6" onclick="checkAll(this,'li6')" name="power_id" type="checkbox" value="150"
							<c:forEach items="${plist }" var="power"><c:if test="${power==150 }" >checked="checked"</c:if></c:forEach> /><label>项目调度查询（已审核）</label>
					<ul>
						<li><input onclick="checkfjd(this,'li6')" class="li6" name="power_id" type="checkbox" value="114"
							<c:forEach items="${plist }" var="power"><c:if test="${power==114 }" >checked="checked"</c:if></c:forEach> />添加<label class='endNode'></label></li>
						<li><input onclick="checkfjd(this,'li6')" class="li6" name="power_id" type="checkbox" value="115"
							<c:forEach items="${plist }" var="power"><c:if test="${power==115 }" >checked="checked"</c:if></c:forEach> />导出<label class='endNode'></label></li>
						<li><input onclick="checkfjd(this,'li6')" class="li6" name="power_id" type="checkbox" value="116"
							<c:forEach items="${plist }" var="power"><c:if test="${power==116 }" >checked="checked"</c:if></c:forEach> />查看<label class='endNode'></label></li>
						<li><input onclick="checkfjd(this,'li6')" class="li6" name="power_id" type="checkbox" value="117"
							<c:forEach items="${plist }" var="power"><c:if test="${power==117 }" >checked="checked"</c:if></c:forEach> />编辑<label class='endNode'></label></li>
						<li><input onclick="checkfjd(this,'li6')" class="li6" name="power_id" type="checkbox" value="118"
							<c:forEach items="${plist }" var="power"><c:if test="${power==118 }" >checked="checked"</c:if></c:forEach> />删除<label class='endNode'></label></li>

						<li><input onclick="checkfjd(this,'li6')" class="li6" name="power_id" type="checkbox" value="119"
							<c:forEach items="${plist }" var="power"><c:if test="${power==119 }" >checked="checked"</c:if></c:forEach> />审核<label class='endNode'></label></li>
						<li><input onclick="checkfjd(this,'li6')" class="li6" name="power_id" type="checkbox" value="120"
							<c:forEach items="${plist }" var="power"><c:if test="${power==120 }" >checked="checked"</c:if></c:forEach> />否决<label class='endNode'></label></li>
					</ul></li>
				<li><input id="li7" onclick="checkAll(this,'li7')" name="power_id" type="checkbox" value="151"
							<c:forEach items="${plist }" var="power"><c:if test="${power==151 }" >checked="checked"</c:if></c:forEach> /><label>项目调度查询（未通过）</label>
					<ul>
						<li><input onclick="checkfjd(this,'li7')" class="li7" name="power_id" type="checkbox" value="121"
							<c:forEach items="${plist }" var="power"><c:if test="${power==121 }" >checked="checked"</c:if></c:forEach> />添加<label class='endNode'></label></li>
						<li><input onclick="checkfjd(this,'li7')" class="li7" name="power_id" type="checkbox" value="122"
							<c:forEach items="${plist }" var="power"><c:if test="${power==122 }" >checked="checked"</c:if></c:forEach> />导出<label class='endNode'></label></li>
						<li><input onclick="checkfjd(this,'li7')" class="li7" name="power_id" type="checkbox" value="123"
							<c:forEach items="${plist }" var="power"><c:if test="${power==123 }" >checked="checked"</c:if></c:forEach> />查看<label class='endNode'></label></li>
						<li><input onclick="checkfjd(this,'li7')" class="li7" name="power_id" type="checkbox" value="124"
							<c:forEach items="${plist }" var="power"><c:if test="${power==124 }" >checked="checked"</c:if></c:forEach> />编辑<label class='endNode'></label></li>
						<li><input onclick="checkfjd(this,'li7')" class="li7" name="power_id" type="checkbox" value="125"
							<c:forEach items="${plist }" var="power"><c:if test="${power==125 }" >checked="checked"</c:if></c:forEach> />删除<label class='endNode'></label></li>

						<li><input onclick="checkfjd(this,'li7')" class="li7" name="power_id" type="checkbox" value="126"
							<c:forEach items="${plist }" var="power"><c:if test="${power==126 }" >checked="checked"</c:if></c:forEach> />审核<label class='endNode'></label></li>
						<li><input onclick="checkfjd(this,'li7')" class="li7" name="power_id" type="checkbox" value="127"
							<c:forEach items="${plist }" var="power"><c:if test="${power==127 }" >checked="checked"</c:if></c:forEach> />否决<label class='endNode'></label></li>
					</ul></li>
				<li><input id="li8" onclick="checkAll(this,'li8')" name="power_id" type="checkbox" value="152"
							<c:forEach items="${plist }" var="power"><c:if test="${power==152 }" >checked="checked"</c:if></c:forEach> /><label>部门管理</label>
					<ul>
						<li><input onclick="checkfjd(this,'li8')" class="li8" name="power_id" type="checkbox" value="128"
							<c:forEach items="${plist }" var="power"><c:if test="${power==128 }" >checked="checked"</c:if></c:forEach> />添加<label class='endNode'></label></li>
						<li><input onclick="checkfjd(this,'li8')" class="li8" name="power_id" type="checkbox" value="129"
							<c:forEach items="${plist }" var="power"><c:if test="${power==129 }" >checked="checked"</c:if></c:forEach> />编辑<label class='endNode'></label></li>
						<li><input onclick="checkfjd(this,'li8')" class="li8" name="power_id" type="checkbox" value="130"
							<c:forEach items="${plist }" var="power"><c:if test="${power==130 }" >checked="checked"</c:if></c:forEach> />删除<label class='endNode'></label></li>
					</ul></li>
				<li><input id="li9" onclick="checkAll(this,'li9')" name="power_id" type="checkbox" value="153"
							<c:forEach items="${plist }" var="power"><c:if test="${power==153 }" >checked="checked"</c:if></c:forEach> /><label>角色管理</label>
					<ul>
						<li><input onclick="checkfjd(this,'li9')" class="li9" name="power_id" type="checkbox" value="131"
							<c:forEach items="${plist }" var="power"><c:if test="${power==131 }" >checked="checked"</c:if></c:forEach> />添加<label class='endNode'></label></li>
						<li><input onclick="checkfjd(this,'li9')" class="li9" name="power_id" type="checkbox" value="132"
							<c:forEach items="${plist }" var="power"><c:if test="${power==132 }" >checked="checked"</c:if></c:forEach> />编辑<label class='endNode'></label></li>
						<li><input onclick="checkfjd(this,'li9')" class="li9" name="power_id" type="checkbox" value="133"
							<c:forEach items="${plist }" var="power"><c:if test="${power==133 }" >checked="checked"</c:if></c:forEach> />删除<label class='endNode'></label></li>
						<li><input onclick="checkfjd(this,'li9')" class="li9" name="power_id" type="checkbox" value="134"
							<c:forEach items="${plist }" var="power"><c:if test="${power==134 }" >checked="checked"</c:if></c:forEach> />权限分配<label class='endNode'></label></li>
						<li><input onclick="checkfjd(this,'li9')" class="li9" name="power_id" type="checkbox" value="135"
							<c:forEach items="${plist }" var="power"><c:if test="${power==135 }" >checked="checked"</c:if></c:forEach> />地区分配<label class='endNode'></label></li>
					</ul></li>
				<li><input id="li10" onclick="checkAll(this,'li10')" name="power_id" type="checkbox" value="154"
							<c:forEach items="${plist }" var="power"><c:if test="${power==154 }" >checked="checked"</c:if></c:forEach> /><label>用户管理</label>
					<ul>
						<li><input onclick="checkfjd(this,'li10')" class="li10" name="power_id" type="checkbox" value="136"
							<c:forEach items="${plist }" var="power"><c:if test="${power==136 }" >checked="checked"</c:if></c:forEach> />添加<label class='endNode'></label></li>
						<li><input onclick="checkfjd(this,'li10')" class="li10" name="power_id" type="checkbox" value="137"
							<c:forEach items="${plist }" var="power"><c:if test="${power==137 }" >checked="checked"</c:if></c:forEach> />编辑<label class='endNode'></label></li>
						<li><input onclick="checkfjd(this,'li10')" class="li10" name="power_id" type="checkbox" value="138"
							<c:forEach items="${plist }" var="power"><c:if test="${power==138 }" >checked="checked"</c:if></c:forEach> />删除<label class='endNode'></label></li>
					</ul></li>
				<li><input id="li11" onclick="checkAll(this,'li11')" name="power_id" type="checkbox" value="155"
							<c:forEach items="${plist }" var="power"><c:if test="${power==155 }" >checked="checked"</c:if></c:forEach> /><label>地区管理</label>
					<ul>
						<li><input onclick="checkfjd(this,'li11')" class="li11" name="power_id" type="checkbox" value="139"
							<c:forEach items="${plist }" var="power"><c:if test="${power==139 }" >checked="checked"</c:if></c:forEach> />添加<label class='endNode'></label></li>
						<li><input onclick="checkfjd(this,'li11')" class="li11" name="power_id" type="checkbox" value="140"
							<c:forEach items="${plist }" var="power"><c:if test="${power==140 }" >checked="checked"</c:if></c:forEach> />编辑<label class='endNode'></label></li>
						<li><input onclick="checkfjd(this,'li11')" class="li11" name="power_id" type="checkbox" value="141"
							<c:forEach items="${plist }" var="power"><c:if test="${power==141 }" >checked="checked"</c:if></c:forEach> />删除<label class='endNode'></label></li>
					</ul></li>
				<li><input id="li12" onclick="checkAll(this,'li12')" name="power_id" type="checkbox" value="156"
							<c:forEach items="${plist }" var="power"><c:if test="${power==156 }" >checked="checked"</c:if></c:forEach> /><label>产业分类管理</label>
					<ul>
						<li><input onclick="checkfjd(this,'li12')" class="li12" name="power_id" type="checkbox" value="142"
							<c:forEach items="${plist }" var="power"><c:if test="${power==142 }" >checked="checked"</c:if></c:forEach> />添加<label class='endNode'></label></li>
						<li><input onclick="checkfjd(this,'li12')" class="li12" name="power_id" type="checkbox" value="143"
							<c:forEach items="${plist }" var="power"><c:if test="${power==143 }" >checked="checked"</c:if></c:forEach> />编辑<label class='endNode'></label></li>
						<li><input onclick="checkfjd(this,'li12')" class="li12" name="power_id" type="checkbox" value="144"
							<c:forEach items="${plist }" var="power"><c:if test="${power==144 }" >checked="checked"</c:if></c:forEach> />删除<label class='endNode'></label></li>
					</ul></li>
					<li><input id="li13" onclick="checkAll(this,'li13')" name="power_id" type="checkbox" value="161"
							<c:forEach items="${plist }" var="power"><c:if test="${power==161 }" >checked="checked"</c:if></c:forEach> /><label>项目问题管理</label>
					<ul>
						<li><input onclick="checkfjd(this,'li13')" class="li13" name="power_id" type="checkbox" value="162"
							<c:forEach items="${plist }" var="power"><c:if test="${power==162 }" >checked="checked"</c:if></c:forEach> />添加<label class='endNode'></label></li>
						<li><input onclick="checkfjd(this,'li13')" class="li13" name="power_id" type="checkbox" value="167"
							<c:forEach items="${plist }" var="power"><c:if test="${power==167 }" >checked="checked"</c:if></c:forEach> />查看本人提出的问题<label class='endNode'></label></li>	
						<li><input onclick="checkfjd(this,'li13')" class="li13" name="power_id" type="checkbox" value="163"
							<c:forEach items="${plist }" var="power"><c:if test="${power==163 }" >checked="checked"</c:if></c:forEach> />查看问题详情<label class='endNode'></label></li>
						<li><input onclick="checkfjd(this,'li13')" class="li13" name="power_id" type="checkbox" value="164"
							<c:forEach items="${plist }" var="power"><c:if test="${power==164 }" >checked="checked"</c:if></c:forEach> />审阅<label class='endNode'></label></li>
						<li><input onclick="checkfjd(this,'li13')" class="li13" name="power_id" type="checkbox" value="165"
							<c:forEach items="${plist }" var="power"><c:if test="${power==165 }" >checked="checked"</c:if></c:forEach> />编辑<label class='endNode'></label></li>
						<li><input onclick="checkfjd(this,'li13')" class="li13" name="power_id" type="checkbox" value="166"
							<c:forEach items="${plist }" var="power"><c:if test="${power==166 }" >checked="checked"</c:if></c:forEach> />删除<label class='endNode'></label></li>
					</ul></li>
					<li><input id="li14" onclick="checkAll(this,'li14')" name="power_id" type="checkbox" value="168"
							<c:forEach items="${plist }" var="power"><c:if test="${power==168 }" >checked="checked"</c:if></c:forEach> /><label>消息管理</label>
					<ul>
						<li><input onclick="checkfjd(this,'li14')" class="li14" name="power_id" type="checkbox" value="169"
							<c:forEach items="${plist }" var="power"><c:if test="${power==169 }" >checked="checked"</c:if></c:forEach> />项目申报消息<label class='endNode'></label></li>
						<li><input onclick="checkfjd(this,'li14')" class="li14" name="power_id" type="checkbox" value="170"
							<c:forEach items="${plist }" var="power"><c:if test="${power==170 }" >checked="checked"</c:if></c:forEach> />项目回退消息<label class='endNode'></label></li>
						<li><input onclick="checkfjd(this,'li14')" class="li14" name="power_id" type="checkbox" value="171"
							<c:forEach items="${plist }" var="power"><c:if test="${power==171 }" >checked="checked"</c:if></c:forEach> />问题回复消息<label class='endNode'></label></li>
						<li><input onclick="checkfjd(this,'li14')" class="li14" name="power_id" type="checkbox" value="172"
							<c:forEach items="${plist }" var="power"><c:if test="${power==172 }" >checked="checked"</c:if></c:forEach> />项目问题消息<label class='endNode'></label></li>
						<li><input onclick="checkfjd(this,'li14')" class="li14" name="power_id" type="checkbox" value="174"
							<c:forEach items="${plist }" var="power"><c:if test="${power==174 }" >checked="checked"</c:if></c:forEach> />项目调度消息<label class='endNode'></label></li>
						<li><input onclick="checkfjd(this,'li14')" class="li14" name="power_id" type="checkbox" value="175"
							<c:forEach items="${plist }" var="power"><c:if test="${power==175 }" >checked="checked"</c:if></c:forEach> />调度回退消息<label class='endNode'></label></li>
						<li><input onclick="checkfjd(this,'li14')" class="li14" name="power_id" type="checkbox" value="181"
							<c:forEach items="${plist }" var="power"><c:if test="${power==181 }" >checked="checked"</c:if></c:forEach> />调度否决消息<label class='endNode'></label></li>		
					</ul></li>
					<li><input id="li15" onclick="checkAll(this,'li15')" name="power_id" type="checkbox" value="173"
							<c:forEach items="${plist }" var="power"><c:if test="${power==173 }" >checked="checked"</c:if></c:forEach> /><label>新闻管理</label>


			</ul>
		</div>
		
		
		<div style="float: left;width:50%;">
		<%=dao.queryuList(null) %>
		</div>
		
		<input type="submit" value="确认" />
	</form>

</body>
<script type="text/javascript">		
	$(document).ready(function(){
  	$("li").children("ul").hide();
  	$("ul").parent("li").css("list-style-image","url('Image/forwordright.png')");
  	$(".endNode").parent("li").css("list-style-image","url('Image/forwordright2.png')");
  });
  $("ul").parent("li").children("label").click(function(){
  	if($(this).parent().children("ul").is(":hidden")){
  		$(this).next('ul').toggle(200);
  		$(this).parent().children("ul").show();
  		$(this).parent().children("ul").css("list-style-image","url('Image/forwordright.png')");
  		$(this).parent().css("list-style-image","url('Image/forwordbellow.png')");
  	}else{
  		$(this).parent().children("ul").hide();
  		$(this).parent().css("list-style-image","url('Image/forwordright.png')");
  	}
  });
  
  
  function myfunction(){
  	var list=${jsdqList};
  	for(var k=0;k<list.length;k++){
  		document.getElementById(list[k]).checked=true;
  	}
  }
  
  function checkfjd(obj,id){
  	var fjd=document.getElementById(id);
  	if(obj.checked==true){
  		fjd.checked=true;
  	}
  }
  function checkAll(obj,name){
  				
    			var itemList=document.getElementsByClassName(name);
    			for(var i=0;i<itemList.length;i++){
    				itemList[i].checked=obj.checked;
    			}
    		}
</script>
</html>
