<%@page import="com.lzcb.bigitem.utils.PageHelper"%>
<%@page import="com.lzcb.bigitem.utils.DbHelper"%>
<%@page import="com.lzcb.bigitem.dao.XmsbDaoImpl"%>
<%@page import="com.lzcb.bigitem.dao.XmsbDao"%>
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
    
    <title>当年市重大区重点项目</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
<%
	//XmsbDao dao=new XmsbDaoImpl();
	PageHelper pgh=(PageHelper)request.getSession().getAttribute("page");
	System.out.print(pgh);
	String feny="<td style='color:blue;' onclick='javascript:location.href=\"Xmsb.do?method=fenydn&toPage="+pgh.getNowPage()+"\"'>"+pgh.getNowPage()+"</td>";
	if(pgh.getNowPage()>1){
	feny="<td onclick='javascript:location.href=\"Xmsb.do?method=fenydn&toPage="+(pgh.getNowPage()-1)+"\"'>"+(pgh.getNowPage()-1)+"</td>"+feny;
	}
	if(pgh.getNowPage()>2){
	feny="<td onclick='javascript:location.href=\"Xmsb.do?method=fenydn&toPage="+(pgh.getNowPage()-2)+"\"'>"+(pgh.getNowPage()-2)+"</td>"+feny;
	}
	if(pgh.getSumPage()-pgh.getNowPage()>=1){
	feny+="<td onclick='javascript:location.href=\"Xmsb.do?method=fenydn&toPage="+(pgh.getNowPage()+1)+"\"'>"+(pgh.getNowPage()+1)+"</td>";
	}
	if(pgh.getSumPage()-pgh.getNowPage()>=2){
	feny+="<td onclick='javascript:location.href=\"Xmsb.do?method=fenydn&toPage="+(pgh.getNowPage()+2)+"\"'>"+(pgh.getNowPage()+2)+"</td>";
	}
	List list=(List)request.getAttribute("list");//dao.queryTable("select * from bi_xmxx", null);
	String tableL="";
	String tableR="";
	for(int i=0;i<list.size();i++){
		Map rec=(Map)list.get(i);
		tableL+="<tr>";
		tableR+="<tr>";
		tableL+="<td>"+rec.get("NF")+"</td>";
		tableL+="<td>"+rec.get("XMMC")+"</td>";
		tableL+="<td>"+rec.get("JSDWMC")+"</td>";
		
		tableR+="<td>"+rec.get("GMJJSNR")+"</td>";
		tableR+="<td>"+rec.get("JSJDMC")+"</td>";

		tableR+="<td>"+rec.get("ZTZ")+"</td>";
		tableR+="<td>"+rec.get("NDJHTZ")+"</td>";
		tableR+="<td>"+rec.get("DNJSNR")+"</td>";
		tableR+="<td>"+rec.get("SBNTZ")+"</td>";
		tableR+="<td>"+rec.get("SBNXXJD")+"</td>";
		tableR+="<td>"+rec.get("XBNTZ")+"</td>";
		tableR+="<td>"+rec.get("XBNXXJD")+"</td>";
		//tableR+="<td>"+rec.get("JHKGSJ")+"</td>";
		tableR+="<td>"+rec.get("SHBZMC")+"</td>";
		tableR+="<td><a data-num-p='0202' href='Xmsb.do?method=show&xmid="+rec.get("ID")+"'>查看</a> "+
		"<a data-num-p='0206' onclick=\"huitui("+rec.get("ID")+")\">回退</a></td>";
		tableL+="</tr>";
		tableR+="</tr>";
	}
	tableL=tableL.replaceAll("null", "");
	tableR=tableR.replaceAll("null", "");
	
	List<Map<String,Object>> qxlist=DbHelper.queryForTable("select * from bi_dqxxb order by sjjd_dm,pxh");
	String option_szqx="<option value=''/>请选择</option>";
	for(int i=0;i<qxlist.size();i++)
	{
		Map m=qxlist.get(i);
		option_szqx+="<option value='"+m.get("ID")+"'>";
		option_szqx+=m.get("DQ_NAME")+"</option>";
	}
	
	List<Map<String,Object>> cylist=DbHelper.queryForTable("select * from bi_cyxxb order by sjjd_dm,pxh ");
	String option_sscy="<option value=''/>请选择</option>";
	for(int i=0;i<cylist.size();i++)
	{
		Map m=cylist.get(i);
		option_sscy+="<option value='"+m.get("ID")+"'>";
		option_sscy+=m.get("CY_NAME")+"</option>";
	}
%>
<link rel="stylesheet" type="text/css" href="CSS/bi.main.css">
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
.tlist td{ text-align:center;}
</style>
  </head>
  
  <body>
  <div class="title"><span class="tcontext">当年重大项目</span></div>
  <form method="post" action="Xmk.do?method=dnxm">
    <table class="condition">
    <tr>
    <td style="width:10%">重要级别：</td>
    <td style="width:50%;text-align: left;">
    <input type="checkbox" name="zyjb" value="1" id="zyjb1" style="min-width:2px; " <c:forEach items="${zyjb }" var="jb"><c:if test="${jb==1 }">checked="checked" </c:if> </c:forEach> />市重大
    <input type="checkbox" name="zyjb" value="2" id="zyjb2" style="min-width:2px; " <c:forEach items="${zyjb }" var="jb"><c:if test="${jb==2 }">checked="checked" </c:if> </c:forEach> />区重点
    <input type="checkbox" name="zyjb" value="3" id="zyjb3" style="min-width:2px;"<c:forEach items="${zyjb }" var="jb"><c:if test="${jb==3 }">checked="checked" </c:if> </c:forEach> />储备项目
    
    </td>
    <td style="width:10%">项目名称：</td><td style="width:20%"><input type="text" name="q_xmmc" id="q_xmmc" style="width:100%"/></td>
    </tr>
    <tr>
    <td style="width:10%">建设阶段：</td><td style="width:20%"><select name="q_jsjd" style="width:120px">
    			<option value="">请选择</option>
    			<option value="1">新开工</option>
    			<option value="2">续建</option>
    			</select>
    </td><td style="width:10%">所在镇办：</td><td style="width:20%"><select name="q_szqx" style="width:120px">
    			<%=option_szqx %>
    			</select></td>
    
    
    <tr>
    <td colspan="6">
    	<input type="submit" value="搜索" class="btn"/> 
    	<input type="button" data-num-p="0201" value="导出" class="btn" onclick="javascript:location.href='Xmsb.do?method=exlExp'"/>
    	<!--<input type="button" value="默认导出" class="btn" onclick="javascript:location.href=''"/>-->
    </tr>
    </table>
  </form>
  <div class="tlist">
    <div class="mutiTable" style="margin: 0px;padding: 0px;">
  		<div class="header" style="margin: 0px;padding: 0px;">
  			<div class="header-left" style="width:380px;float: left;">
  			<table id="table1" style="width:380px;border-right-width: 1px;">
  			<col style="width:80px;">
  			<col style="width:150px;">
  			<col style="width:150px;">
  			<tr style="height:72px;">
  			<th scope="col">年份</th>
  			<th scope="col">项目名称</th>
  			<th scope="col">建设单位</th></tr>
  			</table></div>
  			<div class="header-right" style="width:650px;float: left;">
  			<table id="table2" style="width:1500px;border-left-width: 0px;">
  			<col style="width:200px;">
  			<col style="width:100px;">
  			
  			<col style="width:100px;">
  			<col style="width:90px;">
  			<col style="width:160px;">
  			<col style="width:90px;">
  			<col style="width:160px;">
  			<col style="width:90px;">
  			<col style="width:160px;">
  			<col style="width:100px;">
  			<col style="width:250px;">
  			<tr>
  			<th scope="col" rowspan="3">建设规模及主要内容</th>
  			<th scope="col" rowspan="3">建设阶段</th>
  			
  			<th scope="col" rowspan="3">总投资</th>
  			<th scope="col" colspan="2">当年任务目标</th>
  			<th scope="col" colspan="4">当年分阶段任务目标</th>
  			<th scope="col" rowspan="3">审核状态</th>
  			<th scope="col" rowspan="3">操作</th>
  			</tr>
  			<tr>
  			<th scope="col" rowspan="2">年度计划投资</th>
  			<th scope="col" rowspan="2">当年建设内容</th>
  			<th scope="col" colspan="2">上半年</th>
  			<th scope="col" colspan="2">下半年</th>
  			</tr>
  			<tr>
  			<th scope="col">上半年投资</th>
  			<th scope="col">上半年形象进度</th>
  			<th scope="col">下半年投资</th>
  			<th scope="col">下半年形象进度</th>
  			</tr>
  			</table></div>
  		</div>
  		<div class="table-left" style="padding-bottom: 17px;float: left;">
  			<table id="table3" style="width:380px;border-top-width: 0px;">
  				<col style="width:80px;">
  				<col style="width:150px;">
  				<col style="width:150px;">
  				<%=tableL %>
  			</table>
  		</div>
  		<div class="table-right" style="width:650px;overflow-x:scroll;overflow-y:scroll;float: left;">
  			<table id="table4" style="width:1500px;border-left-width: 0px;border-top-width: 0px;">
  			<col style="width:200px;">
  			<col style="width:100px;">
  			
  			<col style="width:100px;">
  			<col style="width:90px;">
  			<col style="width:160px;">
  			<col style="width:90px;">
  			<col style="width:160px;">
  			<col style="width:90px;">
  			<col style="width:160px;">
  			<col style="width:100px;">
  			<col style="width:250px;">
  			<%=tableR %>
  			</table>
  		</div>
    	<div style="float: left;">
    		<table class="changePage">
    			<tr><td style="background-image: url('Image/upPage.gif');" onclick="<%=(pgh.getNowPage()>1?"javascript:location.href='Xmsb.do?method=fenydn&toPage=sub'":"") %>"></td>
    			<%=feny %>
    			<td style="background-image: url('Image/downPage.gif');" onclick="<%=(pgh.getSumPage()-pgh.getNowPage()>=1?"javascript:location.href='Xmsb.do?method=fenydn&toPage=add'":"") %>"></td>
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
   <div id="fjdiv" style="position: fixed;right:15%;top:50px;display: none;">
    	<table border="1"  bordercolor="#000000" >
	    	<tr>
		    	<td style="width:18px;float: right;color: red;height:100px;border-color: white;">否决原因</td>
		    	<td><textarea id="reason" style="vertical-align:top;min-height: 100px;min-width: 800px"></textarea></td>
	  	    </tr>
	  	    <tr>
	  	    	<td align="right" colspan="2" style="border-top-color: white; "><input id="fjqr" type="button" value="确认">  <input id="fjqx" type="button" value="取消"></td>
	  	    </tr>
    	</table> 			
  </div>
   </div>
   <div class="showmsg" id="showmsg">${msg }</div>
  </body>
  <script type="text/javascript" src="JS/jquery-3.2.1.min.js"></script>
  <script type="text/javascript" src="JS/bi.load.js"></script>
  <script type="text/javascript">
  document.getElementById("table2").rows[0].cells[0].height=document.getElementById("table1").rows[0].cells[0].offsetHeight; 
  document.getElementById("table4").rows[0].cells[0].height=document.getElementById("table3").rows[0].cells[0].offsetHeight; 
   function huitui(xmid){
  	$("#reason").val('');
  			$("#fjdiv").show();
  			$("#fjqx").click(function(){
  				$("#fjdiv").hide();
  			});
  			$("#fjqr").click(function(){
  				$("#fjdiv").hide();
  				var reason=$("#reason").val();
  				var reg=new RegExp("\n","g");
				reason=reason.replace(reg,'<br>');
  				url="Xmk.do?method=dnhuit&reason="+reason+"&xmid="+xmid;
    			window.location.href=url;
  				
  			});
  }
  manageView("<%=request.getSession().getAttribute("power").toString()%>","02");
  function feny(sel){
  location.href="Xmsb.do?method=chgPagedn&pNum="+sel.options[sel.selectedIndex].value;
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
	$(".header-right").width($(".header").innerWidth()-390-20);
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
