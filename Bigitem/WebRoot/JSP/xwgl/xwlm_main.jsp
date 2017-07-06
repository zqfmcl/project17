<%@page import="com.lzcb.bigitem.utils.PageHelper"%>
<%@page import="com.lzcb.bigitem.utils.DbHelper"%>
<%@page import="com.lzcb.bigitem.dao.XwlmDaoImpl"%>
<%@page import="com.lzcb.bigitem.dao.XwlmDao"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'xwlm_main.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script src="JS/jquery-3.2.1.min.js"></script>
	<link rel="stylesheet" type="text/css" href="CSS/bi.main.css">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

 <%
	//XmsbDao dao=new XmsbDaoImpl();
	PageHelper pgh=(PageHelper)request.getSession().getAttribute("page");
	String feny="<td style='color:blue;' onclick='javascript:location.href=\"Xmsb.do?method=feny&toPage="+pgh.getNowPage()+"\"'>"+pgh.getNowPage()+"</td>";
	if(pgh.getNowPage()>1){
	feny="<td onclick='javascript:location.href=\"Xwlm.do?method=feny&toPage="+(pgh.getNowPage()-1)+"\"'>"+(pgh.getNowPage()-1)+"</td>"+feny;
	}
	if(pgh.getNowPage()>2){
	feny="<td onclick='javascript:location.href=\"Xwlm.do?method=feny&toPage="+(pgh.getNowPage()-2)+"\"'>"+(pgh.getNowPage()-2)+"</td>"+feny;
	}
	if(pgh.getSumPage()-pgh.getNowPage()>=1){
	feny+="<td onclick='javascript:location.href=\"Xwlm.do?method=feny&toPage="+(pgh.getNowPage()+1)+"\"'>"+(pgh.getNowPage()+1)+"</td>";
	}
	if(pgh.getSumPage()-pgh.getNowPage()>=2){
	feny+="<td onclick='javascript:location.href=\"Xwlm.do?method=feny&toPage="+(pgh.getNowPage()+2)+"\"'>"+(pgh.getNowPage()+2)+"</td>";
	}
	List list=(List)request.getAttribute("list");//dao.queryTable("select * from bi_xmxx", null);
	String table="";
	for(int i=0;i<list.size();i++){
		Map rec=(Map)list.get(i);
		table+="<tr>";
		table+="<td>"+rec.get("LMMC")+"</td>";
		table+="<td>"+rec.get("LMFL")+"</td>";
		table+="<td>"+rec.get("MYORDER")+"</td>";
		table+="<td><a  href='Xwlm.do?method=show&xmid="+rec.get("ID")+"'>查看</a> "+
		"<a  href='JSP/xwgl/xwlm_edit.jsp?xmid="+rec.get("ID")+"'>编辑</a> "+
		"<a  href='javascript:dodel("+rec.get("ID")+")'>删除</a> ";
		table+="</tr>";
	}
	table=table.replaceAll("null", "");
	
%>
 <style type="text/css">
  	
  	.title,form,.tlist{
  		width:95%;
  		margin-top:26px;
  		margin-right:20px;
  		margin-bottom:20px;
  		margin-left:20px;
  	}
  	.title{
  		padding: 25px;
  		padding-bottom: 25px;
  		padding-left: 25px;
  		padding-right: 0px;
  		padding-top: 25px;
  	}
  	.title .tcontext{
  		font-size: 24;
  	}
  	form,.tlist{
  		padding: 10px;
  	}
  	div,form{
  		background-color: white;
  	}
  	form td{
  		padding: 5px;
  	}
  	
  	from input,select{
  		width:100px;
  	}
.tlist table{
	margin: 0;
	border-left-style:solid;
	border-left-width:1px;
	border-top-style:solid;
	border-top-width:1px;
	border-color:#ccc;
	border-collapse: collapse;
}
.tlist div{
	margin: 0px;
	white-space: normal;
	text-overflow:ellipsis;
	border-collapse: collapse;
	overflow: hidden;
}
.tlist th,.tlist td{
	word-wrap:break-word;
	word-break:break-all;
	border-right-style: solid;
	border-right-width: 1px;
	border-bottom-style: solid;
	border-bottom-width: 1px;
	border-color:#ccc;
	margin:0px;
	display: table-cell;
	overflow: hidden;
	overflow-x:hidden;
	overflow-y:hidden;
	text-overflow:ellipsis;
	white-space: normal;
}
.tlist tr{
	margin: 0px;
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
#table1 td{ text-align:center;}
#table1 tr:nth-child(even){
background: #F5F5F5;
}
</style>
  </head>
  
  <body>
  <div class="title"><span class="tcontext">新闻栏目</span></div>
  <form method="post" action="Xwlm.do?method=select">
    <table class="condition">
   
    
    
    <tr>
    <td colspan="6">
    	<input type="button"  value="添加" class="btn" onclick="javascript:location.href='JSP/xwgl/xwlm_add.jsp'"/>  
    </tr>
    </table>
  </form>
  <div class="tlist">
    <div class="mutiTable" style="max-height:440px;margin: 0px;padding: 0px;">
    <div class="mutiTable"
			style="max-height:400px;margin: 0px;padding: 0px;">
			<table id="table1" cellpadding="1px" border="0" cellspacing="1"
				cellpadding="0" style="width:100%">
				<tr>
					<th rowspan="1" style="width:20%">栏目名称</th>
					<th rowspan="1" style="width:18%">栏目分类</th>
					<th rowspan="1" style="width:22%">排序</th>
					<th rowspan="1" style="width:20%">操作</th>
				</tr>
				<%=table %>
  			</table></div>
  			
  		</div>

    	<div style="margin-top: 10px;">

    		<table class="changePage">
    			<tr><td style="background-image: url('Image/upPage.gif');" onclick="<%=(pgh.getNowPage()>1?"javascript:location.href='Xwlm.do?method=feny&toPage=sub'":"") %>"></td>
    			<%=feny %>
    			<td style="background-image: url('Image/downPage.gif');" onclick="<%=(pgh.getSumPage()-pgh.getNowPage()>=1?"javascript:location.href='Xwlm.do?method=feny&toPage=add'":"") %>"></td>
    			<td  style="width: 88px;">
    			<select style="min-width: 48px;width:48px;" onchange="feny(this)">
    				<option value="5">5</option>
    				<option value="10" <%=(pgh.getRecordNum()==10?"selected='selected'":"") %>>10</option>
    				<option value="20" <%=(pgh.getRecordNum()==20?"selected='selected'":"") %>>20</option>
    				<option value="50" <%=(pgh.getRecordNum()==50?"selected='selected'":"") %>>50</option>
    			</select>每页</td></tr>
    		</table>
   </div>
   </div>
   <div class="showmsg" id="showmsg">${msg }</div>
  </body>
  <script type="text/javascript" src="JS/jquery-3.2.1.min.js"></script>
  <script type="text/javascript" src="JS/bi.load.js"></script>
  <script type="text/javascript">
  //$("tr:odd").css("background-color","#F5F5F5"); 
    //$("#table1 tr:even").css("background-color","#F5F5F5"); 
  manageView("<%=request.getSession().getAttribute("power").toString()%>","01");
  
 
  function dodel(id){
  	if(window.confirm("是否确认删除？")){
    			url="Xwlm.do?method=del&xmid="+id;
    			window.location.href=url;
    }
  }
  
function suitHeight(){
	var bgc=true;
	var l=$(".table-left").children().find("tr:first");
	var r=$(".table-right").children().find("tr:first");
	while(l.length>0){
		if(l.height()>r.height()){
			r.height(l.height());
		}else l.height(r.height());
		if(!bgc){
			l.css("background-color","#f5f5f5");
			r.css("background-color","#f5f5f5");
		}
		bgc=!bgc;
		l=l.next();
		r=r.next();
	}
	$(".table-left").height($(".table-right").innerHeight()-17);
	$(".header-right").width($(".header").innerWidth()-390-17);
	$(".table-right").width($(".header").innerWidth()-390);
}

$(window).resize(function(){
	suitHeight();
});
$(".table-right").scroll(function(){
	$(".table-left").scrollTop($(".table-right").scrollTop());
	$(".header-right").scrollLeft($(".table-right").scrollLeft());
});
$(document).ready(function(){
	suitHeight();
	$("td").children("a").attr("class","btn-intable");
	<%=(request.getAttribute("msg")==null?"":"fnshowmsg();")%>
});
function fnshowmsg(){
	var div=$("#showmsg");
	div.animate({opacity:'1'},"9000");
    div.animate({opacity:'0.0'},"12000");
}
</script>
</html>