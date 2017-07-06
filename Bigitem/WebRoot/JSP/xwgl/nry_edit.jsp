<%@page import="com.lzcb.bigitem.utils.PageHelper"%>
<%@page import="com.lzcb.bigitem.utils.DbHelper"%>
<%@page import="com.lzcb.bigitem.dao.XwlmDaoImpl"%>
<%@page import="com.lzcb.bigitem.dao.XwlmDao"%>
<%@page import="com.lzcb.bigitem.dao.NryDaoImpl"%>
<%@page import="com.lzcb.bigitem.dao.NryDao"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'nry_edit.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script src="JS/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="ckeditor/ckeditor.js"></script>
	<script type="text/javascript" src="ckfinder/ckfinder.js"></script>
	<link rel="stylesheet" type="text/css" href="CSS/bi.main.css">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  <%
	
	String xmid=request.getParameter("xmid");
	Map xmxx=DbHelper.queryAClob("select * from t_nry ll left join t_wzlm xx on ll.sslm=xx.id where ll.id="+xmid,"ZW");
	List<Map<String,Object>> fjlist=DbHelper.queryForTable("select * from fujian fj where fj.ssbm='t_wzlm' and fj.ssjldm="+xmid);
	String jsfj="";
  	for(int i=0;i<fjlist.size();i++){
  		Map m=fjlist.get(i);
  		jsfj+="$('#"+m.get("SSJLZD")+"').parent().append('<a href=\"Download.do?fjid="+m.get("ID")+"\">"+m.get("WJMC")+"-下载</a>');";
  		//jsfj+="$('#"+m.get("SSJLZD")+"').parent().parent().prev().find('[id$=\"sfbj\"]').attr('checked','checked');";
  		//jsfj+="$('#"+m.get("SSJLZD")+"').parent().parent().prev().find('[id$=\"jzqk\"]').css('visibility', 'hidden');";
  		//jsfj+="$('#"+m.get("SSJLZD")+"').parent().parent().prev().find('[id$=\"jzqk\"]').parent().prev().css('visibility', 'hidden');";
  		//jsfj+="$('#"+m.get("SSJLZD")+"').parent().parent().css('visibility', 'visible');";
 	}
%>
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

[type="checkbox"] {
	min-width: 0px;
}

td {
	padding: 5px;
	vertical-align: top;
	text-align: right;
}

[colspan="4"] {
	font-weight: 100;
	border-bottom-style: solid;
	border-bottom-width: 1px;
	border-top-style: solid;
	border-top-width: 1px;
	border-color: #ccc;
	text-align: left;
	vertical-align: middle;
}

input,select,textarea {
	text-align: left;
}

[type="number"] {
	min-width: 48px;
}

[type="text"],select,textarea {
	width: 100%;
}
</style>
</head>
<body>
	<div class="div-title">
		<span style="font-size: 20px;">编辑新闻栏目</span> &nbsp;<a
			style="text-decoration: none;font-size: 12px;" target="mainPage"
			href="javascript:history.back(-1)">返回列表</a>
	</div>
	<div style="margin-left: 20px;">
		<h5
			style="border-bottom-style:solid; border-bottom-width: 1px; border-bottom-color: #ccc;">编辑新闻栏目</h5>
		<form id="form1" method="post" enctype="multipart/form-data" action="Nry.do?method=update&xmid=<%=xmid%>" >
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
					<%=(xmxx.get("LMMC")==null?"":xmxx.get("LMMC"))%>
					</td>
					
				</tr>
				<tr>
					<td>标题*</td>
					<td><input type="text" name="bt" id="bt" value="<%=(xmxx.get("BT")==null?"":xmxx.get("BT"))%>"/>
					</td>
					
				
				<tr>
					<td>首页显示</td>
					<td><select name ="sfxs">
							<option value="">请选择</option>
							<option value="1" <%=("1".equals(xmxx.get("SFXS").toString())?"selected='selected'":"") %> >显示</option>
							<option value="0" <%=("0".equals(xmxx.get("SFXS").toString())?"selected='selected'":"") %>>不显示</option>
					</select>
					</td>
				</tr>
				<tr>
					<td>是否推荐</td>
					<td><select name ="sftj">
							<option value="">请选择</option>
							<option value="1" <%=("1".equals(xmxx.get("SFTJ").toString())?"selected='selected'":"") %> >推荐</option>
							<option value="0" <%=("0".equals(xmxx.get("SFTJ").toString())?"selected='selected'":"") %>>不推荐</option>
					</select>
					</td>
				</tr>		
				<tr>
					<td>正文*</td>
					<td><textarea name="zw" id="TextArea1" cols="20" rows="2" class="ckeditor"><%=(xmxx.get("ZW")==null?"":xmxx.get("ZW"))%></textarea>
					</td>
				</tr>		
				
					
			</table>
		</div>
			<div style="padding: 15px;">
				<input type="button" value="保存"  class="btn" style="position: relative;left: 100px;text-align: center;" onclick = "checkForm()" /> 
			</div>
		</form>
	</div>
	<div class="showmsg" id="showmsg">${msg }</div>
</body>
<script type="text/javascript">
$("[type='checkbox']").parent().css("text-align","left");
	$("[type='number']").parent().css("text-align","left");
	$("[type='month']").parent().css("text-align","left");
	$("label").parent().css("text-align","left");
 
  
 	function xmchange(value){
    var selectedOption=value.options[value.selectedIndex];  
	window.location.href='Xmddsb.do?method=getxm&xmid='+selectedOption.value;	
	}
  
  
	CKEDITOR.replace('TextArea1');
	
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
	
</script>
</html>