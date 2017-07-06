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

<title>部门列表</title>

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
	<br />
	<div class="title">
		<span class="tcontext">部门管理</span>
	</div>

	&nbsp;&nbsp;&nbsp;&nbsp;<input data-num-p='0801' type="button" value="添加" class="btn"
		onclick="window.location.href='${pageContext.request.contextPath}/DepartmentServlet?method=DeptGet'" />
	<div class="tlist">
		<div class="mutiTable"
			style="max-height:440px;margin: 0px;padding: 0px;">

			<table id="table1" cellpadding="1px" border="0" cellspacing="1"
				cellpadding="0" style="width:100%">
				<tr>
					<th id="id_ID" style="width:15%">ID</th>
					<th id="id_DM" style="width:15%">代码</th>
					<th id="id_MC" style="width:40%">名称</th>
					<th id="id_PXH" style="width:15%">排序号</th>
					<th id="id_BJ" style="width:15%">编辑</th>
				</tr>
				<c:forEach items="${deptList }" var="dept">
					<tr>
						<td>${dept.id }</td>
						<td>${dept.bm_dm }</td>
						<td>${dept.bm_longname }</td>
						<td>${dept.bm_pxh }</td>
						<td><input data-num-p='0802' type="button" name="edit" value="编辑"
							class="btn-intable"
							onclick="window.location.href='${pageContext.request.contextPath}/DepartmentServlet?method=DeptQuery&id=${dept.id }'" />&nbsp;&nbsp;
							<input data-num-p='0803' type="button" name="delete" value="删除" class="btn-intable"
							onclick="delDept(${dept.id})" /></td>
					</tr>
				</c:forEach>
				<tr>
			
				</tr>
			</table>
			<div style="float: left;">
				<table class="changePage" border="1"
					style="width:100%;table-layout: fixed;overflow:hidden;">
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
									onclick="window.location.href='${pageContext.request.contextPath }/DepartmentServlet?method=DeptList&currentPage=${pageBean.prePage}&pageSize=${pageBean.pageSize}'"
									src="${pageContext.request.contextPath }/Image/upPage.gif"></td>
							</c:otherwise>
						</c:choose>
						<c:if test="${pageBean.currentPage>2 }">
							<td><a
								onclick="window.location.href='${pageContext.request.contextPath }/DepartmentServlet?method=DeptList&currentPage=${pageBean.currentPage-2 }&pageSize=${pageBean.pageSize}'"
								style="width: 28px;height: 29px;background-color: white;">${pageBean.currentPage-2 }</a></td>
						</c:if>
						<c:if test="${pageBean.currentPage>1 }">
							<td><a
								href="${pageContext.request.contextPath }/DepartmentServlet?method=DeptList&currentPage=${pageBean.currentPage-1 }&pageSize=${pageBean.pageSize}">${pageBean.currentPage-1 }</a>
						</c:if>
						<td style="color:blue;"><a style="font: bolder;">${pageBean.currentPage }</a>
							<c:if test="${pageBean.totalPage-pageBean.currentPage>=1 }">
								<td><a
									href="${pageContext.request.contextPath }/DepartmentServlet?method=DeptList&currentPage=${pageBean.currentPage+1 }&pageSize=${pageBean.pageSize}">${pageBean.currentPage+1 }</a></td>
							</c:if> <c:if test="${pageBean.totalPage-pageBean.currentPage>=2 }">
								<td><a
									href="${pageContext.request.contextPath }/DepartmentServlet?method=DeptList&currentPage=${pageBean.currentPage+2 }&pageSize=${pageBean.pageSize}">${pageBean.currentPage+2 }</a></td>
							</c:if> <c:choose>
								<c:when test="${pageBean.currentPage==pageBean.totalPage}">
									<td><img alt="下一页"
										src="${pageContext.request.contextPath }/Image/downPage.gif"></td>
									<td><img alt="末页"
										src="${pageContext.request.contextPath }/Image/downPage.gif"></td>

								</c:when>
								<c:otherwise>
									<td><img alt="下一页"
										onclick="window.location.href='${pageContext.request.contextPath }/DepartmentServlet?method=DeptList&currentPage=${pageBean.nextPage }&pageSize=${pageBean.pageSize}'"
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
					 共${pageBean.totalCount }条数据&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					 </td>
				
			</tr>

		</table>
		</div>
		</div>
	</div>
	 <script type="text/javascript" src="JS/bi.load.js"></script>
  <script type="text/javascript">
  manageView("<%=request.getSession().getAttribute("power").toString()%>","08");
	
		function firstPage() {
			url = "${pageContext.request.contextPath }/DepartmentServlet?method=DeptList&currentPage=${pageBean.firstPage }&pageSize=${pageBean.pageSize}";
			window.location.href = url;
		}
		function lastPage() {
			url = "${pageContext.request.contextPath }/DepartmentServlet?method=DeptList&currentPage=${pageBean.totalPage }&pageSize=${pageBean.pageSize}";
			window.location.href = url;
		}

		function delDept(id) {
			if (window.confirm("是否确认删除")) {
				url = "${pageContext.request.contextPath}/DepartmentServlet?method=DeptDel&id="
						+ id;
				window.location.href = url;
			}
		}

		/*改变每页显示记录数*/
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
			var url = "${pageContext.request.contextPath}/DepartmentServlet?method=DeptList&currentPage=1&pageSize="
					+ pageSize;
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

			var url = "${pageContext.request.contextPath}/DepartmentServlet?method=DeptList&currentPage="
					+ curPage + "&pageSize=${pageBean.pageSize}";
			window.location.href = url;
		}
	</script>
</body>
</html>
