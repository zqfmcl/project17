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

<title>用户</title>

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
#table1 td{ text-align:center;}
</style>

</head>

<body>

	<div class="title">
		<span class="tcontext">用户管理</span>
	</div>
	<div style="margin-left: 20px;margin-right: 20px;">
		<form id="form1" name="form1"
			action="${pageContext.request.contextPath}/YongServlet?method=YongList"
			method="post">
			<%--当前页 --%>
			<input type="hidden" name="userdqid" value="${user.dq_id }" />
			<input type="hidden" id="currentPage" name="currentPage"
				value="${pageBean.currentPage }" />
			<%--每页显示记录数 --%>
			<input type="hidden" id="pageSizeId" name="pageSize"
				value="${pageBean.pageSize }" />
			<table class="condition">
				<tr>
					<td style="width:15%"><span>用户角色:</span></td>
					<td style="width:60%">
					<select name="js_query" >
						<option value="0">不选</option>
						<c:forEach items="${jsList }" var="js">
							<option value="${js.id}" <c:forEach items="${yhc.js_query }" var="jsid">
									<c:choose>
										<c:when test="${jsid == js.id }">
											selected="selected"
										</c:when>
										<c:otherwise></c:otherwise>
									</c:choose>
								</c:forEach> >
								${js.js_name }
							</option>
						
						</c:forEach>
					</select>
					
					<!--<c:forEach items="${jsList }" var="js">
							<input style="min-width:15px" type="checkbox" name="js_query"
								value="${js.id}"
								<c:forEach items="${yhc.js_query }" var="jsid">
									<c:choose>
										<c:when test="${jsid == js.id }">
											checked="checked"
										</c:when>
										<c:otherwise></c:otherwise>
									</c:choose>
								</c:forEach> />${js.js_name }
						</c:forEach> -->
						
						</td>
					<td style="width:10%"><span>Email</span></td>
					<td style="width:15%"><input type="text" name="email_query"
						value="${param['email_query'] }" size="50px"></td>
				</tr>
				<tr>
					<td style="width:15%"><span>登录账号名</span></td>
					<td style="width:60%"><input type="text" name="userid_query"
						value="${param['userid_query'] }" size="50px"></td>
					
				<tr>

				</tr>
			</table>
			<input type="button" class="btn" value="搜索"
				onclick="form1.action='${pageContext.request.contextPath }/YongServlet?method=YongList&currentPage=1';form1.submit();">&nbsp;&nbsp;
				<input data-num-p='1001' type="button" class="btn" value="添加"
				onclick="window.location.href='${pageContext.request.contextPath}/YongServlet?method=YongGet'">
		</form>

	</div>
	<div class="tlist">
		<div class="mutiTable"
			style="=margin: 0px;padding: 0px;">
			<table id="table1" cellpadding="1px" border="0" cellspacing="1"
				cellpadding="0" style="width:100%">
				<tr>
					<th rowspan="1" style="width:5%">ID</th>
					<th rowspan="1" style="width:13%">登录账号</th>
					<th rowspan="1" style="width:12%">登录用户名</th>
					<th rowspan="1" style="width:10%">所属地区</th>
					<th rowspan="1" style="width:20%">Email</th>
					<th rowspan="1" style="width:5%">激活</th>
					<th rowspan="1" style="width:25%">用户角色</th>
					<th rowspan="1" style="width:10%">编辑</th>

				</tr>
				
				

				<c:forEach items="${yhList }" var="yh">
					<tr>
						<td>${yh.id}</td>
						<td>${yh.userid }</td>
						<td>${yh.username }</td>
						<td>${yh.dq_name }</td>
						<td>${yh.email }</td>
						<td>${yh.jhzt }</td>
						<td>${yh.yhjs }</td>
						<td><input data-num-p='1002' type="button" name="edit" value="编辑"
							class="btn-intable"
							onclick="window.location.href='${pageContext.request.contextPath}/YongServlet?method=YongQuery&id=${yh.id }'" />
							<input data-num-p='1003' type="button" name="delete" value="删除" class="btn-intable"
							onclick="delJuese(${yh.id})" /></td>
					</tr>
				</c:forEach>
			</table>
			<table class="changePage" border="1"
				style="width:100%;table-layout: fixed;overflow:hidden;margin-top: 20px;">
				<tr>
					<c:choose>
						<c:when test="${pageBean.currentPage==pageBean.firstPage}">
							<td><img alt="首页"
								src="${pageContext.request.contextPath }/Image/upPage.gif"></td>
							<td><img alt="上一页"
								src="${pageContext.request.contextPath }/Image/upPage.gif"></td>
						</c:when>
						<c:otherwise>
							<td><img alt="首页" onclick="firstPage()"
								src="${pageContext.request.contextPath }/Image/upPage.gif"></td>
							<td><img alt="上一页"
								onclick="window.location.href='${pageContext.request.contextPath }/YongServlet?method=YongList&currentPage=${pageBean.prePage}&pageSize=${pageBean.pageSize}&userid_query=${param['userid_query'] }&bmid_query=${param['bmid_query']}&js_query=${param['js_query'] }&email_query=${param['email_query'] }'"
								src="${pageContext.request.contextPath }/Image/upPage.gif"></td>
						</c:otherwise>
					</c:choose>
					<c:if test="${pageBean.currentPage>2 }">
						<td><a
							onclick="window.location.href='${pageContext.request.contextPath }/YongServlet?method=YongList&currentPage=${pageBean.currentPage-2 }&pageSize=${pageBean.pageSize}&userid_query=${param['userid_query'] }&bmid_query=${param['bmid_query']}&js_query=${param['js_query'] }&email_query=${param['email_query'] }'"
							style="width: 28px;height: 29px;background-color: white;">${pageBean.currentPage-2 }</a></td>
					</c:if>
					<c:if test="${pageBean.currentPage>1 }">
						<td style="color:blue;"><a
							href="${pageContext.request.contextPath }/YongServlet?method=YongList&currentPage=${pageBean.currentPage-1 }&pageSize=${pageBean.pageSize}&userid_query=${param['userid_query'] }&bmid_query=${param['bmid_query']}&js_query=${param['js_query'] }&email_query=${param['email_query'] }">${pageBean.currentPage-1 }</a>
					</c:if>
					<td style="color:blue;"><a style="font: bolder;">${pageBean.currentPage }</a>
						<c:if test="${pageBean.totalPage-pageBean.currentPage>=1 }">
							<td><a
								href="${pageContext.request.contextPath }/YongServlet?method=YongList&currentPage=${pageBean.currentPage+1 }&pageSize=${pageBean.pageSize}&userid_query=${param['userid_query'] }&bmid_query=${param['bmid_query']}&js_query=${param['js_query'] }&email_query=${param['email_query'] }">${pageBean.currentPage+1 }</a></td>
						</c:if> <c:if test="${pageBean.totalPage-pageBean.currentPage>=2 }">
							<td><a
								href="${pageContext.request.contextPath }/YongServlet?method=YongList&currentPage=${pageBean.currentPage+2 }&pageSize=${pageBean.pageSize}&userid_query=${param['userid_query'] }&bmid_query=${param['bmid_query']}&js_query=${param['js_query'] }&email_query=${param['email_query'] }">${pageBean.currentPage+2 }</a></td>
						</c:if> <c:choose>
							<c:when test="${pageBean.currentPage==pageBean.totalPage}">
								<td><img alt="下一页"
									src="${pageContext.request.contextPath }/Image/downPage.gif"></td>
								<td><img alt="末页"
									src="${pageContext.request.contextPath }/Image/downPage.gif"></td>

							</c:when>
							<c:otherwise>
								<td><img alt="下一页"
									onclick="window.location.href='${pageContext.request.contextPath }/YongServlet?method=YongList&currentPage=${pageBean.nextPage }&pageSize=${pageBean.pageSize}&userid_query=${param['userid_query'] }&bmid_query=${param['bmid_query']}&js_query=${param['js_query'] }&email_query=${param['email_query'] }'"
									src="${pageContext.request.contextPath }/Image/downPage.gif"></td>
								<td><img alt="末页" onclick="lastPage()"
									src="${pageContext.request.contextPath }/Image/downPage.gif"></td>
							</c:otherwise>
						</c:choose>
					<td style="width:95px"><select id="pageSize"
						style="min-width: 48px;width:48px;" onchange="changePageSize()">
							<option value="2"
								<c:if test="${pageBean.pageSize==2 }">selected="selected"</c:if>>2</option>
							<option value="5"
								<c:if test="${pageBean.pageSize==5 }">selected="selected"</c:if>>5</option>
							<option value="10"
								<c:if test="${pageBean.pageSize==10 }">selected="selected"</c:if>>10</option>
							<option value="15"
								<c:if test="${pageBean.pageSize==15 }">selected="selected"</c:if>>15</option>
					</select> 每页</td>
					<td style="width:60%;text-align: right;">
						当前为第${pageBean.currentPage }页/共${pageBean.totalPage }页&nbsp;
						共${pageBean.totalCount }条数据&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>

				</tr>

			</table>
		</div>
	</div>
	 <script type="text/javascript" src="JS/bi.load.js"></script>
  <script type="text/javascript">
  $("#table1 tr:even").css("background-color","#F5F5F5"); 
  manageView("<%=request.getSession().getAttribute("power").toString()%>","10");
		function firstPage() {
			url = "${pageContext.request.contextPath }/YongServlet?method=YongList&currentPage=${pageBean.firstPage }&pageSize=${pageBean.pageSize}&userid_query=${param['userid_query'] }&bmid_query=${param['bmid_query']}&js_query=${param['js_query'] }&email_query=${param['email_query'] }";
			window.location.href = url;
		}
		function lastPage() {
			url = "${pageContext.request.contextPath }/YongServlet?method=YongList&currentPage=${pageBean.totalPage }&pageSize=${pageBean.pageSize}&userid_query=${param['userid_query'] }&bmid_query=${param['bmid_query']}&js_query=${param['js_query'] }&email_query=${param['email_query'] }";
			window.location.href = url;
		}

		function delJuese(id) {
			if (window.confirm("是否确认删除")) {
				url = "${pageContext.request.contextPath}/YongServlet?method=YongDel&id="
						+ id;
				window.location.href = url;
			}
		}
		function changePageSize() {
			//1.得到用户输入
			var pageSize = document.getElementById("pageSize").value;
			//判断规则：只能输入1-2个的数字
			var reg = /^[1-9][0-9]?$/;
			if (!reg.test(pageSize)) {
				alert("只能输入1-2位的数字");
				return;
			}
			//2.请求ListEmpServlet，同时发送参数(pageSize)
			//document.getElementById("pageSizeId").value=pageSize;

			//document.getElementById("form1").submit();
			url = "${pageContext.request.contextPath }/YongServlet?method=YongList&currentPage=1&pageSize="
					+ pageSize + "&userid_query=${param['userid_query'] }&bmid_query=${param['bmid_query']}&js_query=${param['js_query'] }&email_query=${param['email_query'] }";
			window.location.href = url;

		}

		/*跳转页面*/
		function changePage() {
			var curPage = document.getElementById("curPage").value;
			var reg = /^[1-9][0-9]?$/;
			if (!reg.test(curPage)) {
				alert("只能输入1-2位的数字");
				return;
			}
			/*如果输入的页码大于等于总页数*/
			var totalPage = "${pageBean.totalPage}";
			if (curPage > totalPage) {
				alert("已经超过总页数");
				return;
			}

			var url = "${pageContext.request.contextPath}/YongServlet?method=YongList&currentPage="
					+ curPage + "&pageSize=${pageBean.pageSize}&userid_query=${param['userid_query'] }&bmid_query=${param['bmid_query']}&js_query=${param['js_query'] }&email_query=${param['email_query'] }";
			window.location.href = url;
		}
	</script>
</body>
</html>
