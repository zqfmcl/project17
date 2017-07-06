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


<title>My JSP 'ltXmwt.jsp' starting page</title>

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
	<div class="div-title">
		<span style="font-size: 20px;">${wt.bt }</span> &nbsp;<a
			style="text-decoration: none;font-size: 12px;" target="mainPage"
			href="XmwtglServlet?method=Wtsblist">返回列表</a>
	</div>
	<hr>
	<div>
	<table align="center" border="1" cellpadding="0" cellspacing="0"
			width="80%" style="margin-bottom:4px">
			<tr>
				<td style="background: #eff4fb;">
					<div>
						<span><font style="color:red">${lzname }(<font
								style="color:blue; font-style:italic">${lzjs }</font>)
						</font>&nbsp;&nbsp;发表于:${wt.lrsj }</span> <span style="float:right">#0</span>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div style="width:100%; min-height:80px;word-wrap:break_word; ">
					<span style="color: blue">问题描述:</span><br>
						${wt.wtms }<br>
						<span style="color: blue">问题情况:</span><br>
						${wt.wtqk }
						</div>
			</td>
			</tr>
			<tr>
				<td style="background: #eff4fb;">
					<div>
						<span style="float:right"><a href="#plnr"
							onClick="huifu(0,${wt.lrr})">回复</a></span>
					</div>
			</td>
			</tr>

		</table>
	<c:forEach items="${plList }" var="pl">
		<table align="center" border="1" cellpadding="0" cellspacing="0"
			width="80%" style="margin-bottom:4px">
			<tr>
				<td style="background: #eff4fb;">
					<div>
						<span><font style="color:red">${pl.plrname }(<font
								style="color:blue; font-style:italic">${pl.plrjs }</font>)
						</font>&nbsp;&nbsp;回复于:${pl.pltime }</span> <span style="float:right">#${pl.plcs }</span>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div style="width:100%; min-height:80px">
						${pl.plnr }</div>
			</td>
			</tr>
			<tr>
				<td style="background: #eff4fb;">
					<div>
						<span style="float:right"><a href="#plnr"
							onClick="huifu(${pl.plcs},${pl.plrid })">回复此评论</a></span>
					</div>
			</td>
			</tr>

		</table>
	</c:forEach>

		<hr>
		<form action="" name="form1" method="post">
		<table align="center" border="0" cellpadding="0" cellspacing="0"
			width="80%" style="margin-bottom: 4px;">
			<tr>
				<td><span style="font-weight:300" >发表回复</span></td>
			</tr>
			<tr>
				<td>
					<div align="center">
						<textarea name="plnr1" id="plnr" style="width:90%; min-height:80px;"></textarea>
					</div>
				</td>
			</tr>
			<tr>
				<td><input type="button" value="发表" onclick="fabiao()" /></td>
			</tr>
		</table>
		</form>
	</div>
	<script type="text/javascript">
		self.parent.parent.frames[0].aa();
		var bplr=${wt.lrr};
		function huifu(cengshu,plrid) {
			
			
			bplr=plrid;
			//var huifu = document.getElementById("plnr");
			//huifu.innerHTML = "回复 #" + cengshu + ":";
			var hf="回复#" + cengshu + ":";
			$("#plnr").val(hf);
		}
		function fabiao(){
			var plnr=$("#plnr").val();
			//alert(plnr);
			var reg=new RegExp("\n","g");
			plnr=plnr.replace(reg,'<br>');
			
			var wtid=${wtid};
			//alert(plnr);
			$("#plnr").val(plnr);
			
			form1.action="${pageContext.request.contextPath }/PinglunServlet?method=addPing&wtid="+wtid+"&bplr="+bplr+"&plnr="+plnr+"";
			
			form1.submit();
		}
	</script>
</body>
</html>
