<%@page import="com.lzcb.bigitem.Entity.Tuser"%>
<%@page import="com.lzcb.bigitem.utils.PageHelper"%>
<%@page import="com.lzcb.bigitem.utils.DbHelper"%>
<%@page import="com.lzcb.bigitem.dao.XwlmDaoImpl"%>
<%@page import="com.lzcb.bigitem.dao.XwlmDao"%>
<%@page import="com.lzcb.bigitem.dao.NryDaoImpl"%>
<%@page import="com.lzcb.bigitem.dao.NryDao"%>
<%@page import="com.ckfinder.connector.ConnectorServlet"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'nry_add.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript" src="ckeditor1.0/ckeditor.js"></script>
	<script type="text/javascript" src="ckfinder/ckfinder.js"></script>
	<script src="JS/jquery-3.2.1.min.js"></script>
	<link rel="stylesheet" type="text/css" href="CSS/bi.main.css">
	<link rel="stylesheet" type="text/css" href="CSS/webuploader.css">
	<link rel="stylesheet" type="text/css" href="CSS/diyUpload.css?v=1.0.0">
	<script type="text/javascript" src="JS/webuploader.html5only.min.js"></script>
	<script type="text/javascript" src="JS/diyUpload.js"></script>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

<%
		Map xmxx=(Map)request.getAttribute("xmxx");
		String ddid=DbHelper.queryForString("select seq_t_nry.nextval from dual");
		Tuser user=(Tuser)request.getSession().getAttribute("user");
		List<Map<String,Object>> qxlist=DbHelper.queryForTable("select * from t_wzlm  order by id desc");
		String option_xm="<option value='-1'>请选择<option>";
		for(int i=0;i<qxlist.size();i++)
	{
		Map m=qxlist.get(i);
		option_xm+="<option "+(xmxx!=null&&xmxx.get("ID")!=null&&xmxx.get("ID").equals(m.get("ID"))?"selected='selected'":"")+" value='"+m.get("ID")+"'>";
		option_xm+=m.get("LMMC")+"</option>";
	}    
 %>
<style type="text/css">
.div-title {
	padding: 10px;
	border-bottom-style: solid; border-bottom-width : 1px;
	border-bottom-color: #ccc;
	border-bottom-width: 1px;
}
.form-editer{
	padding:10px;
	border-width: 1px;
	border-style: solid;
	border-color: #ccc;
	border-radius:3px;
}
[type="checkbox"]{
	min-width: 0px;
}
td{
	padding: 5px;
	vertical-align: top;
	text-align: right;
}
[colspan="4"]{
	font-weight: 100;
	border-bottom-style: solid;
	border-bottom-width:1px;
	border-top-style: solid;
	border-top-width:1px;
	border-color: #ccc;
	text-align: left;
	vertical-align: middle;
}
input,select,textarea{
	text-align: left;
}
[type="number"]{
	min-width: 48px;
}
[type="text"],select,textarea{
	width: 100%;
}
.showmsg{
	padding: 20px;
	font-size: 14px;
	position: fixed;
	top: 0px;
	margin-left: 45%; 
	height: 20px;
	opacity:0;
	background-color: #f7e1e1;
}
#box ul{padding-left:0;}
</style>
</head>
<body>
	<div class="div-title">
		<span style="font-size: 20px;">添加新闻栏目</span> &nbsp;<a
			style="text-decoration: none;font-size: 12px;" target="mainPage"
			href="javascript:history.back(-1)">返回列表</a>
	</div>
	<div style="margin-left: 20px;">
		<h5
			style="border-bottom-style:solid; border-bottom-width: 1px; border-bottom-color: #ccc;">添加新闻栏目</h5>
		<form id="form1" method="post"  action="Nry.do?method=add1&ddid=<%=ddid%>" >
		<!-- enctype="multipart/form-data" -->
		<input type="hidden" name="fbz" value="<%=user.getId()%>">
		<input type="hidden" name="slt" value="<%=ddid%>">
		<div class="form-editer">
			<table style="width:100%;table-layout: fixed;">
				<col style="width:20%;">
				<col style="width:30%;">
				<col style="width:20%;">
				<col style="width:30%;">
				<tr>
					<td colspan="4"><h5>新闻栏目</h5>
					</td>
				</tr>
				<tr>
					<td>所属栏目*</td>
					<td>
					<select name="sslm" onchange='xmchange(this)'><%=option_xm %></select>
					</td>
					
				</tr>
				<tr>
					<td>标题*</td>
					<td><input type="text" name="bt" id="bt" />
					</td>
					
				
				<tr>
					<td>首页显示</td>
					<td><select name="sfxs">
					  		<option value="">请选择</option>
							<option value="1">显示</option>
							<option value="0">不显示</option>
					  </select>
					</td>
				</tr>
				<tr>
					<td>是否推荐</td>
					<td><select name="sftj">
					  		<option value="">请选择</option>
							<option value="1">推荐</option>
							<option value="0">不推荐</option>
					  </select>
					</td>
				</tr>		
				<tr>
					<td>正文*</td>
					<td><textarea name="zw" id="TextArea1" cols="20" rows="2" class="ckeditor"></textarea>
					</td>
				</tr>	
					
					
			</table>
			<div id="box" margin="50px auto"; width="600px;" min-height="400px;" >
			<div id="test" ></div>
			</div>
		</div>
			<div style="padding: 15px;">
				<input type="button" value="保存"  class="btn" style="position: relative;left: 100px;text-align: center;" onclick = "checkForm()" /> 
			</div>
		</form>
	</div>
	<div class="showmsg" id="showmsg">${msg }</div>
</body>
<script type="text/javascript">
	function savAndCon(){
		var a=$("#form1").attr("action");
		$("#form1").attr("action",a+"&cont=1");
		$("#form1").submit();
	}
	CKEDITOR.replace('TextArea1');

	$("[type='checkbox']").parent().css("text-align","left");
	$("[type='number']").parent().css("text-align","left");
	$("[type='month']").parent().css("text-align","left");
	$("label").parent().css("text-align","left");
	
	
	$('#test').diyUpload({
	url:'http://localhost:8080/Bigitem/UploadServlet1.do?ddid=<%=ddid%>',
	success:function( data ) {
		console.info( data );
	},
	error:function( err ) {
		console.info( err );	
	}
});
	function xmchange(value){
    var selectedOption=value.options[value.selectedIndex];  
	window.location.href='Nry.do?method=getxm&xmid='+selectedOption.value;	
	}
	function checkForm() { 
		pass = true; 
		$("td:contains('*')").next().find("input").each(function(){ 
		if(this.value == '') { 
		text = $(this).parent().prev().text(); 
		alert(text+"是必填项"); 
		this.focus(); 
		pass = false; 
		return false;//跳出each 
	} 
	}); 
		if(pass==true){document.getElementById("form1").submit();}
	} 
	
	function fnshowmsg(){
	var div=$("#showmsg");
	div.animate({opacity:'1'},"9000");
    div.animate({opacity:'0.0'},"12000");
	}
	$(document).ready(function(){
		<%=(request.getAttribute("msg")==null?"":"fnshowmsg();")%>
		
	});
</script>
</html>