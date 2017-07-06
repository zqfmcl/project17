<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@page import="com.lzcb.bigitem.utils.DbHelper"%>
<%@page import="com.lzcb.bigitem.utils.PageHelper"%>
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
<title>临淄区重点项目信息管理平台</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="CSS/bootstrap.css">
<link rel="stylesheet" type="text/css" href="CSS/index.css">
<script type="text/javascript"
	src="https://api.html5media.info/1.1.8/html5media.min.js">
	
</script>
<script type="text/javascript" src="JS/jquery-3.2.1.min.js"
	charset="UTF-8"></script>
<script type="text/javascript" src="JS/bootstrap.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		//$('.tab-content .item:first').addClass('active');
		//$('#t_zcjd .item:first').addClass('active');		
		if ($(window).width() >= 1200) {
			$('body').css("width", "100%");
		} else {
			$('body').css("width", "1200");
		}
	});
</script>
<%
	String n = request.getParameter("n");
%>
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
			<label> <a href="home.jsp">首页>></a> <%
 	if ("1".equals(n)) {
 		Map m = DbHelper
 				.queryARow("select LMMC from T_WZLM where ID=1");
 		out.println(m.get("LMMC"));
 	} else if ("2".equals(n)) {
 		Map m = DbHelper
 				.queryARow("select LMMC from T_WZLM where ID=2");
 		out.println(m.get("LMMC"));
 	}
 %> </label>
		</div>
		<div id="show_content">
			<div class="list_tz">
				<table class="table table-hover">
					<%
						String sql = "select * from T_NRY where ";
						String condition = " sfxs=1 and SSLM=" + n;
						PageHelper p=PageHelper.getpage(sql + condition, 5, condition);
						String toPage = request.getParameter("toPage");
						String nowp=request.getParameter("nowp");
						if(nowp!=null)p.setNowPage(Integer.parseInt(nowp));
							if ("add".equals(toPage)) {
								p.setNowPage(p.getNowPage() + 1);

							} else if ("sub".equals(toPage)) {
								p.setNowPage(p.getNowPage() - 1);

							}

						int begin = (p.getNowPage() - 1) * p.getRecordNum();
						int end = p.getNowPage() * p.getRecordNum();
						//sql=sql.replaceFirst("select ", "select rownum r,");
						sql = "select * from (select rownum r,t.* from (" + sql + condition
								+ " order by fbsj desc ) t) where r>" + begin
								+ " and r <=" + end+" order by r";

						List list = DbHelper.queryForTable(sql);
						for (int i = 0; i < list.size(); i++) {
							Map rec = (Map) list.get(i);
					%>


					<tr>
						<td style="text-align: left;"><a
							href="show1.jsp?p=<%out.println(rec.get("ID"));%>&n=<%=n %>"
							target="_blank"> <%
 	out.println(rec.get("BT"));
 %> </a> <span style="float: right;font-size: 12px;">发布于 <%=rec.get("FBSJ").toString().split(" ")[0] %></span>
						</td>
					</tr>
					<!-- 少一个} -->
					<%
						}
					%>
				</table>
			</div>
		</div>

		<div id="page">
			<ul class="pager">
				<li><a
					href="<%=(p.getNowPage() > 1 ? "javascript:location.href='list.jsp?toPage=sub&n="+n+"&nowp="+p.getNowPage()+"'"
					: "javascript:void(0)")%>">上一页</a>
				</li>
				<li><a
					href="<%=(p.getSumPage() - p.getNowPage() >= 1 ? "javascript:location.href='list.jsp?toPage=add&n="+n+"&nowp="+p.getNowPage()+"'"
					: "javascript:void(0)")%>">下一页</a>
				</li>

			</ul>
		</div>
	</div>



	<div class="footer"></div>
</body>
</html>