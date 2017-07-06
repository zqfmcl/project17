<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<%@page import="com.lzcb.bigitem.dao.XmddsbImpl"%>
<%@page import="com.lzcb.bigitem.dao.XmddsbDao"%>
<%@page import="com.lzcb.bigitem.utils.PageHelper"%>
<%@page import="com.lzcb.bigitem.utils.DbHelper"%>
<%@page import="java.util.List"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'xmddglsb_main.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <%
	//XmddsbDao dao=new XmddsbImpl();
	
	PageHelper pgh=(PageHelper)request.getSession().getAttribute("page");
	System.out.print(pgh);
	String feny="<td style='color:blue;' onclick='javascript:location.href=\"Xmddsb.do?method=feny&toPage="+pgh.getNowPage()+"\"'>"+pgh.getNowPage()+"</td>";
	if(pgh.getNowPage()>1){
	feny="<td onclick='javascript:location.href=\"Xmddsb.do?method=feny&toPage="+(pgh.getNowPage()-1)+"\"'>"+(pgh.getNowPage()-1)+"</td>"+feny;
	}
	if(pgh.getNowPage()>2){
	feny="<td onclick='javascript:location.href=\"Xmddsb.do?method=feny&toPage="+(pgh.getNowPage()-2)+"\"'>"+(pgh.getNowPage()-2)+"</td>"+feny;
	}
	if(pgh.getSumPage()-pgh.getNowPage()>=1){
	feny+="<td onclick='javascript:location.href=\"Xmddsb.do?method=feny&toPage="+(pgh.getNowPage()+1)+"\"'>"+(pgh.getNowPage()+1)+"</td>";
	}
	if(pgh.getSumPage()-pgh.getNowPage()>=2){
	feny+="<td onclick='javascript:location.href=\"Xmddsb.do?method=feny&toPage="+(pgh.getNowPage()+2)+"\"'>"+(pgh.getNowPage()+2)+"</td>";
	}
	List list=(List)request.getAttribute("list");
	String tableL="";
	String tableR="";
	for(int i=0;i<list.size();i++){
		Map rec=(Map)list.get(i);
		tableL+="<tr>";
		tableR+="<tr>";
		tableL+="<td>"+rec.get("YF")+"</td>";
		tableL+="<td>"+rec.get("XMMC")+"</td>";
		tableL+="<td>"+rec.get("JSDW")+"</td>";
		tableR+="<td>"+rec.get("NDJHTZ")+"</td>";
		tableR+="<td>"+rec.get("SFKG")+"</td>";
		
		tableR+="<td>"+rec.get("JZBYYWCTZ")+"</td>";
		tableR+="<td>"+rec.get("DYWCTZ")+"</td>";
		tableR+="<td>"+rec.get("TJGC")+"</td>";
		tableR+="<td>"+rec.get("SBGZAZ")+"</td>";
		tableR+="<td>"+rec.get("TDDFY")+"</td>";
		tableR+="<td>"+rec.get("TZWCBL")+"</td>";
		tableR+="<td>"+rec.get("XXJD")+"</td>";
		
		if("".equals(rec.get("SHBS"))||rec.get("SHBS")==null){
			tableR+="<td style=\"color:red; \">"+"待审核"+"</td>";
		}else if("未通过".equals(rec.get("SHBS"))){
			tableR+="<td style=\"color:blue; \">"+rec.get("SHBS")+"</td>";
		}else{
			tableR+="<td>"+rec.get("SHBS")+"</td>";
		}
		tableR+="<td><a data-num-p='0503' href='Xmddsb.do?method=show&xmid="+rec.get("ID")+"'>查看</a> "+
		"<a data-num-p='0504' href='JSP/xmddgl/xmddglsb_editer.jsp?xmid="+rec.get("ID")+"'>编辑</a> "+
		"<a data-num-p='0505' href='javascript:dodel("+rec.get("ID")+")'>删除</a> "+
		"<a data-num-p='0506' href='javascript:doshen("+rec.get("ID")+")'>审核</a> "+
		"<a data-num-p='0507' onclick=\"foujue("+rec.get("ID")+","+rec.get("XM")+")\" >否决</a></td>";
		//"<a    >回退</a>
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
  <div class="title"><span class="tcontext">项目调度管理</span></div>
  <form method="post" action="Xmddsb.do?method=select">
    <table class="condition">
    <tr>
    <td style="width:10%">项目月份：</td><td style="width:20%"><input type="text" name="q_yf" id="q_yf" style="width:40%"/></td>
    <td style="width:10%">重要级别：</td>
    <td style="width:50%;text-align: left;">
    <input type="checkbox" name="zyjb" value="1" id="zyjb1" style="min-width:2px; "  />市重大
    <input type="checkbox" name="zyjb" value="2" id="zyjb2" style="min-width:2px; " />区重点
    <input type="checkbox" name="zyjb" value="3" id="zyjb3" style="min-width:2px;" />储备项目   
    </td>
    
    </tr>
    <tr>
    <td style="width:10%">是否开工：</td><td style="width:20%"><select name="q_jsjd" style="width:40%">
    			<option value="">请选择</option>
    			<option value="1">开工</option>
    			<option value="2">未开工</option>
    			</select>
    </td>
    <td style="width:10%">项目名称：</td><td style="width:20%"><input type="text" name="q_xm" id="q_xm" style="width:40%"/></td>
    </tr>
    
    <tr>
    <td colspan="6">
    	<input type="submit" value="搜索" class="btn"/> 
    	<input data-num-p="0501" type="button" value="添加" class="btn" onclick="javascript:location.href='JSP/xmddgl/xmddglsb_add.jsp'"/>  
    	<input data-num-p="0502" type="button" value="导出" class="btn" onclick="javascript:location.href='Xmddsb.do?method=exlExp'"/>
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
  			
  			<th scope="col">月份</th>
  			<th scope="col">项目名称</th>
  			<th scope="col">建设单位</th></tr>
  			</table></div>
  			<div class="header-right" style="width:650px;margin-right: 0;float: left;">
  			<table id="table2" style="width:1200px;border-left-width: 0px;">
  			<col style="width:70px;">
  			<col style="width:70px;">
  			<col style="width:70px;">
  			<col style="width:70px;">
  			<col style="width:70px;">
  			<col style="width:70px;">
  			<col style="width:70px;">
  			<col style="width:70px;">
  			<col style="width:370px;">
  			<col style="width:70px;">
  			<col style="width:200px;">
  			<tr>
  			<th scope="col" rowspan="3">年度计划投资</th>
  			<th scope="col" rowspan="3">是否开工</th>
  			<th scope="col" rowspan="3">当月已完成投资</th>
  			<th scope="col" rowspan="3">当月至今已完成</th>
  			<th scope="col" rowspan="3">土建工程</th>
  			<th scope="col" rowspan="3">设备安装费用</th>
  			<th scope="col" rowspan="3">土地等费用</th>
  			<th scope="col" rowspan="3">投资完成比例</th>
  			<th scope="col" rowspan="3">形象进度</th>
  			<th scope="col" rowspan="3">审核标识</th>
  			<th scope="col" rowspan="3">操作</th>
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
  			<table id="table4"  style="width:1200px;border-left-width: 0px;border-top-width: 0px;">
  			<col style="width:70px;">
  			<col style="width:70px;">
  			<col style="width:70px;">
  			<col style="width:70px;">
  			<col style="width:70px;">
  			<col style="width:70px;">
  			<col style="width:70px;">
  			<col style="width:70px;">
  			<col style="width:370px;">
  			<col style="width:70px;">
  			<col style="width:200px;">
  			<%=tableR %>
  			</table>
  		</div>
    	<div style="float: left;">
    		<table class="changePage">
    			<tr><td style="background-image: url('Image/upPage.gif');" onclick="<%=(pgh.getNowPage()>1?"javascript:location.href='Xmddsb.do?method=feny&toPage=sub'":"") %>"></td>
    			<%=feny %>
    			<td style="background-image: url('Image/downPage.gif');" onclick="<%=(pgh.getSumPage()-pgh.getNowPage()>=1?"javascript:location.href='Xmddsb.do?method=feny&toPage=add'":"") %>"></td>
    			<td  style="width: 88px;">
    			<select style="min-width: 48px;width:48px;" onchange="feny(this)">
    				<option value="5">5</option>
    				<option value="10" <%=(pgh.getRecordNum()==10?"selected='selected'":"") %>>10</option>
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
  document.getElementById("table1").rows[0].cells[0].height=document.getElementById("table2").rows[0].cells[0].offsetHeight; 
  //document.getElementById("table3").rows[0].cells[0].height=document.getElementById("table4").rows[0].cells[0].offsetHeight;
  var table4=document.getElementById("table4").rows[0].cells[0].offsetHeight;  
  $("#table3 tr:eq(0) td:eq(0)").css("height",table4);
  
  
   function foujue(ddid,xmid2){
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
  				url="Xmddsb.do?method=fouj&reason="+reason+"&xmid2="+xmid2+"&ddid="+ddid;
    			window.location.href=url;
  				
  			});
  } 

  function doshen(id){
  	if(window.confirm("是否确认审核？")){
    			url="Xmddsb.do?method=shenh&xmid="+id;
    			window.location.href=url;
    }
  }
  
  function huitui(ddid,xmid2){
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
  				url="Xmddsb.do?method=huit&reason="+reason+"&xmid2="+xmid2+"&ddid="+ddid;
    			window.location.href=url;
  				
  			});
  }
  manageView("<%=request.getSession().getAttribute("power").toString()%>","05");
  function dodel(id){
  	if(window.confirm("是否确认删除？")){
    			url="Xmddsb.do?method=del&xmid="+id;
    			window.location.href=url;
    }
  }
  function feny(sel){
  location.href="Xmddsb.do?method=chgPage&pNum="+sel.options[sel.selectedIndex].value;
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
  
  
  
  
  
  
  