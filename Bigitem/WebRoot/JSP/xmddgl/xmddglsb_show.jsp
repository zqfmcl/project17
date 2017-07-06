<%@page import="com.lzcb.bigitem.dao.MessageDaoImpl"%>
<%@page import="com.lzcb.bigitem.dao.MessageDao"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@page import="com.lzcb.bigitem.utils.DbHelper"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'xmddglsb_show.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="CSS/bi.main.css">
	<link rel="stylesheet" type="text/css" href="CSS/webuploader.css">
	<link rel="stylesheet" type="text/css" href="CSS/diyUpload.css?v=1.0.0">
	<link rel="stylesheet" type="text/css" href="CSS/style_pic.css"  >
	
	<script type="text/javascript" src="JS/jquery-3.2.1.min.js" charset="UTF-8"></script>
	<script type="text/javascript" src="JS/webuploader.html5only.min.js"></script>
	<script type="text/javascript" src="JS/diyUpload.js"></script>
	<script type="text/javascript" src="JS/jquey-bigic.js"></script> 

	
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  <%
	Map xmxx=(Map)request.getAttribute("xmddgl");
	String xmid=request.getParameter("xmid");
	List<Map<String,Object>> fjlist=DbHelper.queryForTable("select * from fujian fj where fj.ssbm='bi_xmddgl' and fj.ssjldm="+xmid+" order by ssjlzd");
	String jsfj="";
	String piclist="<td colspan='4'>";
	//System.out.println("AAA"+fjlist.get("WJLJ"));
  	for(int i=0;i<fjlist.size();i++){
  		Map m=fjlist.get(i);
  		if(m.get("SSJLZD").toString().startsWith("xmjztp")){

  			piclist+="<div class='apic'>"+
  			"<img src='Download.do?fjid="+m.get("ID")+"' style='width:340px;height:200px;'></div>";

  			continue;
  		}
  		jsfj+="$('#"+m.get("SSJLZD")+"').parent().append('<a href=\"Download.do?fjid="+m.get("ID")+"\">"+m.get("WJMC")+"-下载</a>');";
  		//jsfj+="$('#"+m.get("SSJLZD")+"').parent().parent().prev().find('[id$=\"sfbj\"]').attr('checked','checked');";
  		//jsfj+="$('#"+m.get("SSJLZD")+"').parent().parent().prev().find('[id$=\"jzqk\"]').css('visibility', 'hidden');";
  		//jsfj+="$('#"+m.get("SSJLZD")+"').parent().parent().prev().find('[id$=\"jzqk\"]').parent().prev().css('visibility', 'hidden');";
  		//jsfj+="$('#"+m.get("SSJLZD")+"').parent().parent().css('visibility', 'visible');";
 	}
 	piclist+="</td>";
 	MessageDao medao=new MessageDaoImpl();
 	medao.updateDdFjReason(Integer.parseInt(xmid));
 	String reason=DbHelper.queryForString("select REASON from BI_REASON where ddid="+xmid+" and type=1 order by TIME DESC");
 	List<Map<String,Object>> reasonList=DbHelper.queryForTable("select REASON,TIME from BI_REASON where ddid="+xmid+" and type=1 order by TIME DESC");
	String reasonstr="";
	if(reasonList.size()>0){
		reasonstr="<table border=\"1\"  bordercolor=\"#000000\">";
		for(int i=0;i<reasonList.size();i++){
			Map<String, Object> m = reasonList.get(i);
			reasonstr+="<tr>"+m.get("TIME")+"</tr>";
			reasonstr+="<hr>";
			reasonstr+="<tr>"+m.get("REASON")+"</tr>";
			reasonstr+="<hr>";
		}
		reasonstr+="</table>";
		
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

.form-editer td {
	padding: 9px;
	vertical-align: top;
	text-align: right;
	border-bottom-style: solid;
	border-bottom-width: 1px;
	border-top-style: solid;
	border-top-width: 1px;
	border-right-width: 1px;
	border-right-style: solid;
	border-color: #cccccc;
}

.form-editer tr td:last-child
{
border-right-style:none;
}

.form-editer [colspan="4"] {
	background-color:eaeaea;
	font-weight: 100;
	text-align: left;
	vertical-align: middle;
}
.form-editer [colspan="4"] h4{
	margin-bottom: 0px;
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
#picEditer{
	visibility: hidden;
	outline-style: solid;
	outline-color: #2196F3;
	margin-left: -150px;
	background-color: #197fd0;
	/*margin-top: -150px;*/
	width: 340px;
	max-heigcghxkt: 340px;
}
#piclist{
	width:100%;
	margin-top: 2px;
	background-color: white;
	border-top-style: solid;
	border-width:1px;
	max-heigcghxkt: 281px;
	overflow-x: hidden;
    overflow-y: scroll;
}
.apic{
	margin: 5px;
	display: inline-block;
}
#lclose:hover{
	background-color: #036ba5;
	border-radius:3px;
}
[type="button"]{
	min-width: 100px;
}
#piclist a{
	width:280px;
	white-space:nowrap;
	overflow:hidden;
	text-overflow:ellipsis;
}
</style>
  </head>
  
  <body>
  <div class="div-title">
		<span style="font-size: 20px;">重大项目调度信息</span> &nbsp;<a
			style="text-decoration: none;font-size: 12px;" target="mainPage"
			href="javascript:history.back(-1)">返回列表</a>
			<a
			style="text-decoration:underline;color:blue; font-size: 12px;cursor: pointer;" target="mainPage"
			onclick="ckfjyy()">查看否决/回退原因</a>
	</div>
	<div style="margin-left: 20px;">
		<h5
			style="border-bottom-style:solid; border-bottom-width: 1px; border-bottom-color: #ccc;">重大项目调度</h5>
		<div id="form1" class="form-editer">
			<table  style="width:100%;table-layout: fixed;">
				<col style="width:20%;">
				<col style="width:30%;">
				<col style="width:20%;">
				<col style="width:30%;">
    	<tr><td colspan="4"><h4>项目调度情况</h4></td></tr>
				<tr>
					<td>项目</td>
					<td style="text-align: left;"><%=(xmxx.get("XMMC")==null?"":xmxx.get("XMMC"))%>
					</td>
					<td>月份</td>
					<td style="text-align: left;"><%=(xmxx.get("YF")==null?"":xmxx.get("YF"))%>
					</td>
				</tr>
				<tr>
					<td>建设单位</td>
					<td style="text-align: left;"><%=(xmxx.get("JSDW")==null?"":xmxx.get("JSDW"))%>
					</td>
					<td >是否开工</td>
					<td style="text-align: left;"><% if("0".equals(xmxx.get("SFKG"))) {out.print("未开工");}else if("1".equals(xmxx.get("SFKG"))) {out.print("开工");} %>
					</td>
				</tr>
    	
    	<tr><td colspan="4"><h4>立项</h4></td></tr>
    	<tr>
    	<% 
    		boolean lxbj=xmxx.get("LXSFBJ")==null;
    		String lx="<td>是否办结</td><td><input disabled='disabled' type='checkbox' "+(lxbj?"":"checked='checked'")+"/></td>";
    		if(lxbj)lx+="<td>进展情况</td><td style=\"text-align: left;\">"+(xmxx.get("LXJZQK")==null?"":xmxx.get("LXJZQK"))+"</td>";
    		else{
    			Map m=DbHelper.queryARow("select * from fujian fj where fj.ssbm='bi_xmddgl' and fj.ssjlzd='lxscfj' and fj.ssjldm="+xmxx.get("ID"));
    			lx+="</tr><tr><td>手续文号</td><td>"+(xmxx.get("LXSXWH")==null?"":xmxx.get("LXSXWH"))+"</td><td>上传附件</td><td>"+
    				(m==null?"":"<a href='Download.do?fjid="+m.get("ID")+"'>"+m.get("WJMC")+"-下载</a>")+"</td>";
    		}
    	 %>
    		<%=lx %>
    	</tr>
    	<tr><td colspan="4"><h4>环评</h4></td></tr>
    	<tr>
    	<% 
    		boolean hpbj=xmxx.get("HPSFBJ")==null;
    		String hp="<td>是否办结</td><td><input disabled='disabled' type='checkbox' "+(hpbj?"":"checked='checked'")+"/></td>";
    		if(hpbj)hp+="<td>进展情况</td><td style=\"text-align: left;\">"+(xmxx.get("HPJZQK")==null?"":xmxx.get("HPJZQK"))+"</td>";
    		else{
    			Map m=DbHelper.queryARow("select * from fujian fj where fj.ssbm='bi_xmddgl' and fj.ssjlzd='hpscfj' and fj.ssjldm="+xmxx.get("ID"));
    			hp+="</tr><tr><td>手续文号</td><td style=\"text-align: left;\">"+(xmxx.get("HPSXWH")==null?"":xmxx.get("HPSXWH"))+"</td><td>上传附件</td><td>"+
    				(m==null?"":"<a href='Download.do?fjid="+m.get("ID")+"'>"+m.get("WJMC")+"-下载</a>")+"</td>";
    		}
    	 %>
    		<%=hp %>
    	</tr>
    	<tr><td colspan="4"><h4>土地</h4></td></tr>
    	<tr>
    	<% 
    		boolean tdbj=xmxx.get("TDSFBJ")==null;
    		String td="<td>是否办结</td><td ><input disabled='disabled' type='checkbox' "+(tdbj?"":"checked='checked'")+"/></td>";
    		if(tdbj)td+="<td>进展情况</td><td style=\"text-align: left;\">"+(xmxx.get("TDJZQK")==null?"":xmxx.get("TDJZQK"))+"</td>";
    		else{
    			Map m=DbHelper.queryARow("select * from fujian fj where fj.ssbm='bi_xmddgl' and fj.ssjlzd='tdscfj' and fj.ssjldm="+xmxx.get("ID"));
    			td+="</tr><tr><td>手续文号</td><td>"+(xmxx.get("TDSXWH")==null?"":xmxx.get("TDSXWH"))+"</td><td>上传附件</td><td>"+
    				(m==null?"":"<a href='Download.do?fjid="+m.get("ID")+"'>"+m.get("WJMC")+"-下载</a>")+"</td>";
    		}
    	 %>
    		<%=td %>
    	</tr>
    	<tr><td colspan="4"><h4>林地</h4></td></tr>
    	<tr>
    	<% 
    		boolean ldbj=xmxx.get("LDSFBJ")==null;
    		String ld="<td>是否办结</td><td><input disabled='disabled' type='checkbox' "+(ldbj?"":"checked='checked'")+"/></td>";
    		if(ldbj)ld+="<td>进展情况</td><td style=\"text-align: left;\">"+(xmxx.get("LDJZQK")==null?"":xmxx.get("LDJZQK"))+"</td>";
    		else{
    			Map m=DbHelper.queryARow("select * from fujian fj where fj.ssbm='bi_xmddgl' and fj.ssjlzd='ldscfj' and fj.ssjldm="+xmxx.get("ID"));
    			ld+="</tr><tr><td>手续文号</td><td style=\"text-align: left;\">"+(xmxx.get("LDSXWH")==null?"":xmxx.get("LDSXWH"))+"</td><td>上传附件</td><td>"+
    				(m==null?"":"<a href='Download.do?fjid="+m.get("ID")+"'>"+m.get("WJMC")+"-下载</a>")+"</td>";
    		}
    	 %>
    		<%=ld %>
    	</tr>
    	<tr><td colspan="4"><h4>安评</h4></td></tr>
    	<tr>
    	<% 
    		boolean apbj=xmxx.get("APSFBJ")==null;
    		String ap="<td>是否办结</td><td><input disabled='disabled' type='checkbox' "+(apbj?"":"checked='checked'")+"/></td>";
    		if(apbj)ap+="<td>进展情况</td><td style=\"text-align: left;\">"+(xmxx.get("APJZQK")==null?"":xmxx.get("APJZQK"))+"</td>";
    		else{
    			Map m=DbHelper.queryARow("select * from fujian fj where fj.ssbm='bi_xmddgl' and fj.ssjlzd='apscfj' and fj.ssjldm="+xmxx.get("ID"));
    			ap+="</tr><tr><td>手续文号</td><td style=\"text-align: left;\">"+(xmxx.get("APSXWH")==null?"":xmxx.get("APSXWH"))+"</td><td>上传附件</td><td>"+
    				(m==null?"":"<a href='Download.do?fjid="+m.get("ID")+"'>"+m.get("WJMC")+"-下载</a>")+"</td>";
    		}
    	 %>
    		<%=ap %>
    	</tr>
    	<tr><td colspan="4"><h4>工程规划</h4></td></tr>
    	<tr>
    	<% 
    		boolean gcgcghxkxkbj=xmxx.get("GCGHXKSFBJ")==null;
    		String gcgcghxkxk="<td>是否办结</td><td><input disabled='disabled' type='checkbox' "+(gcgcghxkxkbj?"":"checked='checked'")+"/></td>";
    		if(gcgcghxkxkbj)gcgcghxkxk+="<td>进展情况</td><td style=\"text-align: left;\">"+(xmxx.get("GCGHXKJZQK")==null?"":xmxx.get("GCGHXKJZQK"))+"</td>";
    		else{
    			Map m=DbHelper.queryARow("select * from fujian fj where fj.ssbm='bi_xmddgl' and fj.ssjlzd='gcghxkscfj' and fj.ssjldm="+xmxx.get("ID"));
    			gcgcghxkxk+="</tr><tr><td>手续文号</td><td style=\"text-align: left;\">"+(xmxx.get("GCGCGHXKXKSXWH")==null?"":xmxx.get("GCGCGHXKXKSXWH"))+"</td><td>上传附件</td><td>"+
    				(m==null?"":"<a href='Download.do?fjid="+m.get("ID")+"'>"+m.get("WJMC")+"-下载</a>")+"</td>";
    		}
    	 %>
    		<%=gcgcghxkxk %>
    	</tr>
    	<tr><td colspan="4"><h4>消防许可</h4></td></tr>
    	<tr>
    	<% 
    		boolean xfxkbj=xmxx.get("XFXKSFBJ")==null;
    		String xfxk="<td>是否办结</td><td><input disabled='disabled' type='checkbox' "+(xfxkbj?"":"checked='checked'")+"/></td>";
    		if(xfxkbj)xfxk+="<td>进展情况</td><td style=\"text-align: left;\">"+(xmxx.get("XFXKJZQK")==null?"":xmxx.get("XFXKJZQK"))+"</td>";
    		else{
    			Map m=DbHelper.queryARow("select * from fujian fj where fj.ssbm='bi_xmxx' and fj.ssjlzd='xfxkscfj' and fj.ssjldm="+xmxx.get("ID"));
    			xfxk+="</tr><tr><td>手续文号</td><td style=\"text-align: left;\">"+(xmxx.get("XFXKSXWH")==null?"":xmxx.get("XFXKSXWH"))+"</td><td>上传附件</td><td>"+
    				(m==null?"":"<a href='Download.do?fjid="+m.get("ID")+"'>"+m.get("WJMC")+"-下载</a>")+"</td>";
    		}
    	 %>
    		<%=xfxk %>
    	</tr>
    	<tr><td colspan="4"><h4>施工</h4></td></tr>
    	<tr>
    	<% 
    		boolean sgbj=xmxx.get("SGSFBJ")==null;
    		String sg="<td>是否办结</td><td><input disabled='disabled' type='checkbox' "+(sgbj?"":"checked='checked'")+"/></td>";
    		if(sgbj)sg+="<td>进展情况</td><td style=\"text-align: left;\">"+(xmxx.get("SGJZQK")==null?"":xmxx.get("SGJZQK"))+"</td>";
    		else{
    			Map m=DbHelper.queryARow("select * from fujian fj where fj.ssbm='bi_xmxx' and fj.ssjlzd='sgscfj' and fj.ssjldm="+xmxx.get("ID"));
    			sg+="</tr><tr><td>手续文号</td><td style=\"text-align: left;\">"+(xmxx.get("SGSXWH")==null?"":xmxx.get("SGSXWH"))+"</td><td>上传附件</td><td>"+
    				(m==null?"":"<a href='Download.do?fjid="+m.get("ID")+"'>"+m.get("WJMC")+"-下载</a>")+"</td>";
    		}
    	 %>
    		<%=sg %>
    	</tr>
    	<tr>
					<td colspan="4"><h4>项目进展</h4>
					</td>
				</tr>
				<tr>
    			<td>土建工程</td><td style="text-align: left;"><%=(xmxx.get("TJGC")==null?"":xmxx.get("TJGC"))%></td>
    			<td>设备购置安装</td><td style="text-align: left;"><%=(xmxx.get("SBGZAZ")==null?"":xmxx.get("SBGZAZ"))%></td>
    		</tr>
    		<tr>
    			<td>土地等费用</td><td style="text-align: left;"><%=(xmxx.get("TDDFY")==null?"":xmxx.get("TDDFY"))%></td>
    			<td>年度计划投资</td><td style="text-align: left;"><%=(xmxx.get("NDJHTZ")==null?"":xmxx.get("NDJHTZ"))%></td>
    		</tr>
    		<tr>
    			<td>当月完成投资</td><td style="text-align: left;"><%=(xmxx.get("JZBYYWCTZ")==null?"":xmxx.get("JZBYYWCTZ"))%></td>
    			<td>截至本月已完成投资</td><td style="text-align: left;"><%=(xmxx.get("DYWCTZ")==null?"":xmxx.get("DYWCTZ"))%></td>
    		</tr>
    		<tr>
    			<td>投资完成比例</td><td style="text-align: left;"><%=(xmxx.get("TZWCBL")==null?"":xmxx.get("TZWCBL"))%></td>
    			<td>是否存在问题</td><td style="text-align: left;"><%=(xmxx.get("SFCZWT")==null?"":xmxx.get("SFCZWT"))%></td>
    		</tr>
    		<tr>
				<td>形象进度</td><td colspan="3" style="text-align: left;"><%=(xmxx.get("XXJD")==null?"":xmxx.get("XXJD"))%></td>
    		</tr>
    		<tr>
    			<%=piclist %>
    		</tr>
    		<tr><td colspan="4"><h4>联系方式</h4></td></tr>
    	<tr>
    		<td>区县负责人</td><td style="text-align: left;"><%=(xmxx.get("QXFZR")==null?"":xmxx.get("QXFZR"))%></td>
    		<td>责任部门</td><td style="text-align: left;"><%=(xmxx.get("ZRBM")==null?"":xmxx.get("ZRBM"))%></td>
    	</tr>
    	<tr>
    		<td>调度联系人</td><td style="text-align: left;"><%=(xmxx.get("DDLXR")==null?"":xmxx.get("DDLXR"))%></td>
    		<td>调度联系人电话</td><td style="text-align: left;"><%=(xmxx.get("LXFS")==null?"":xmxx.get("LXFS"))%></td>
    	</tr>
    		<tr>
				<td colspan="4"><h4>备注</h4>
				</td>
			</tr>
    		<tr>   			
    			<td colspan="4"><%=(xmxx.get("BZ")==null?"":xmxx.get("BZ"))%></td><td></td>
    		</tr>
    		
    		
				
    	</table>
    	</div> 
    	<div id="fjdiv" style="width:200px;height:300px; position: fixed;right:0px;top:50px;">
    	<table border="1"  bordercolor="#ccc" >
    		<tr><td colspan="2" style="text-align:left; color: blue;height:20px"><a
			style="text-decoration:underline; ;font-size: 12px;cursor: pointer;" target="mainPage"
			onclick="ckfjyyls()">查看历史记录</a><input style="min-width: 0px;" id="fjqx" type="button" value="关闭"></td></tr>
	    	<tr>
		    	
		    	<td><div id="reason" style="background-color:white;text-align:left; vertical-align:top;min-height: 400px;min-width: 180px;max-height: 400px;max-width: 180px;overflow: scroll;"><%=reason==null?"":reason %></div></td>
	  	    </tr>
	  	    
    	</table> 
  		</div>
  <div id="fjlsdiv" style="display:none; width:200px;height:300px; position: fixed;right:0px;top:50px;">
    	<table border="1"  bordercolor="#ccc" >
    		<tr><td colspan="2" style="text-align:left; color: red;height:20px">否决原因历史记录<input style="min-width: 0px;" id="lsfjqx" type="button" value="关闭" onclick="lsfjqx()"></td></tr>
	    	<tr>
		    	
		    	<td><div id="lsreason" style="background-color:white;text-align:left; vertical-align:top;min-height: 400px;min-width: 180px;max-height: 400px;max-width: 180px;overflow: scroll;"><%=reasonstr %></div></td>
	  	    </tr>
	  	    
    	</table> 			
  </div>
			</div>
  </body>
  <script type="text/javascript">
    self.parent.parent.frames[0].aa();//调用消息管理刷新的
    var reason=$("#reason").text();
$("#form1").css("marginRight","200px");

if(reason==""){
	$("#fjdiv").hide();
	$("#form1").css("marginRight","0");
}
function ckfjyy(){
	
	$("#fjlsdiv").hide();
	$("#fjdiv").show();
	$("#form1").css("marginRight","200px");
}
function ckfjyyls(){
	$("#fjdiv").hide();
	$("#fjlsdiv").show();
	$("#form1").css("marginRight","200px");
}
function lsfjqx(){
	$("#fjlsdiv").hide();
	$("#form1").css("marginRight","0");
}
$("#fjqx").click(function(){
  				$("#fjdiv").hide();
  				$("#form1").css("marginRight","0");
  			});
  	$(function(){
		$('img').bigic();
	});
  
  
	$("[type='checkbox']").parent().css("text-align", "left");
	$("label").parent().css("text-align", "left");
	function showPic(id){
  	var ps=document.getElementById("picShower");
  	ps.src="Download.do?fjid="+id;
  	$('#picShower').css("visibility", "visible");
  }
 
 

</script>
</html>
