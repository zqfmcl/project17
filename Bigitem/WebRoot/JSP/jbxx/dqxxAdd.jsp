<%@page import="com.lzcb.bigitem.utils.DbHelper"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'dqxxEditer.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script src="JS/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="CSS/bi.main.css">
<style type="text/css">
.div-title {
	padding: 10px;
	border-bottom-style: solid;
	border-bottom-width: 1px;
	border-bottom-color: #ccc;
	border-bottom-width: 1px;
}

.form-editer {
	padding: 10px;
	border-width: 1px;
	border-style: solid;
	border-color: #ccc;
	border-radius: 3px;
}

td {
	padding: 5px;
	vertical-align: top;
	text-align: right;
}

input, select, textarea {
	text-align: left;
}
.btn{
	min-height: 0px;
	text-align: center;
}

[type="text"], select, textarea {
	width: 100%;
}
</style>
<%
	List<Map<String,Object>> list=DbHelper.queryForTable("select * from bi_dqxxb order by pxh,DQ_NAME");
	String option="<option value=''>根节点</option>";
	for(int i=0;i<list.size();i++)
	{
		Map m=list.get(i);
		option+="<option value='"+m.get("ID")+"'>";
		option+=m.get("DQ_NAME")+"</option>";
	}
 %>
  </head>
  
  <body>
  <div class="div-title">
		<span style="font-size: 20px;">添加地区</span> &nbsp;<a
			style="text-decoration: none;font-size: 12px;" target="mainPage"
			href="javascript:history.back(-1)">返回列表</a>
	</div>
	
	<div style="margin-left: 20px;">
	<h5
			style="border-bottom-style:solid; border-bottom-width: 1px; border-bottom-color: #ccc;">添加地区信息</h5>
		
		<form action="Jbxx.do?method=dqxxAdd" id="form1" name="form1" method="post">
		<div class="form-editer">
			<table>
    		<tr>
    			<td>名称：</td><td><input id="dqmc" name="dqmc" type="text"/></td>
    		</tr><tr>
    			<td>父级：</td>
    			<td>
    				<select name="sjjd">
    					<%=option %>
    				</select>
    			</td>
    		</tr><tr>
    			<td>排序</td><td><input id="pxh" name="pxh" type="text"/></td>
    		</tr><tr>
    			<td>备注</td><td><input id="bz" name="bz" type="text"/></td>
    		</tr><tr>
    			<td><input type="submit" class="btn" value="保存"/></td><td><input class="btn" type="button" onclick="savNgo()" value="保存并继续编辑"/></td>
    		</tr>
    	</table>
		</div>
		</form>
	</div>
  </body>
  <script type="text/javascript">
  	function savNgo(){
  		$("#form1").attr("action","Jbxx.do?method=dqxxcont");
  		document.getElementById("form1").submit();
  	}
  </script>
</html>
