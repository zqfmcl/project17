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
    
    <title>My JSP 'xmddgl_editer.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="CSS/bi.main.css">
	<link rel="stylesheet" type="text/css" href="CSS/webuploader.css">
	<link rel="stylesheet" type="text/css" href="CSS/diyUpload.css?v=1.0.0">
	<script type="text/javascript" src="JS/jquery-3.2.1.min.js" charset="UTF-8"></script>
	<script type="text/javascript" src="JS/webuploader.html5only.min.js"></script>
	<script type="text/javascript" src="JS/diyUpload.js"></script>
	
	
	<%
	List<Map<String,Object>> qxlist=DbHelper.queryForTable("select * from bi_xmxx order by id desc");
	String option_xm="";
	//String ddid=DbHelper.queryForString("select seq_bi_xmddgl.nextval from dual");
	for(int i=0;i<qxlist.size();i++)
	{
		Map m=qxlist.get(i);
		option_xm+="<option value='"+m.get("ID")+"'>";
		option_xm+=m.get("XMMC")+"</option>";
	}
	String xmid=request.getParameter("xmid");
	Map xmxx=DbHelper.queryARow("select ll.*,xx.xmmc from bi_xmddgl ll,bi_xmxx xx where ll.xm=xx.id and ll.id="+xmid);
	List<Map<String,Object>> fjlist=DbHelper.queryForTable("select * from fujian fj where fj.ssbm='bi_xmddgl' and fj.ssjldm="+xmid+" order by ssjlzd");
	String jsfj="";
	String piclist="<td colspan='4'>";
  	for(int i=0;i<fjlist.size();i++){
  		Map m=fjlist.get(i);
  		if(m.get("SSJLZD").toString().startsWith("xmjztp")){
  			piclist+="<div class='apic'>"+
			"<a href='JSP/xmddgl/picShow.jsp?fjid="+m.get("ID")+"' target='_blank'><img src='Download.do?fjid="+m.get("ID")+"' style='width:340px;height:200px;'></a><input type='button' value='删除'  onclick='delAPic("+m.get("ID")+")'></div>";
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
 	medao.updateDdHtReason(Integer.parseInt(xmid));
 	String reason=DbHelper.queryForString("select REASON from BI_REASON where ddid="+xmid+" and type=2 order by TIME DESC");
 	List<Map<String,Object>> reasonList=DbHelper.queryForTable("select REASON,TIME from BI_REASON where ddid="+xmid+" and type=2 order by TIME DESC");
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
textarea {
	min-height: 0;
	height:80px;
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
.apic{
	margin: 5px;
	display: inline-block;
}
.apic input{
	float: right;
    min-width: 0;
    background-color: #00b7ee;
    color: white;
}
.apic input:hover{
	background-color: #349dd3;
}
#box ul{padding-left:0;}
</style>
  </head>
  
  
  <body>
  <div class="div-title">
		<span style="font-size: 20px;">编辑重大项目调度信息</span> &nbsp;<a
			style="text-decoration: none;font-size: 12px;" target="mainPage"
			href="javascript:history.back(-1)">返回列表</a>
			<a
			style="text-decoration:underline;color:blue; font-size: 12px;cursor: pointer;" target="mainPage"
			onclick="ckfjyy()">查看否决/回退原因</a>
	</div>
	<div style="margin-left: 20px;">
		<h4
			style="border-bottom-style:solid; border-bottom-width: 1px; border-bottom-color: #ccc;">项目调度信息编辑</h4>
		<form id="form1" method="post" enctype="multipart/form-data"
			action="Xmddsb.do?method=update2&xmid=<%=xmid%>">
			<!-- <input type="hidden" name="id" id="id" value="<%=xmid%>"> -->
			<div class="form-editer">
				<table style="width:100%;table-layout: fixed;">
					<col style="width:20%;">
					<col style="width:30%;">
					<col style="width:20%;">
					<col style="width:30%;">
    <tr><td colspan="4"><h4>项目基本情况</h4></td></tr>
    	<tr><td colspan="4"><h4>项目调度情况</h4>
					</td>
				</tr>
				<tr>
					<td>项目</td>
					<td><%=(xmxx.get("XMMC")==null?"":xmxx.get("XMMC"))%>
					</td>
					<td>月份</td>
					<td> 
					<select style=" min-width: 20px;max-width: 60px;float: left;" class="sel" name="jhkgsjn" id="jhkgsjn" >
						<option>2010</option>
						<option>2011</option>
						<option>2012</option>
						<option>2013</option>
						<option>2014</option>
						<option>2015</option>
						<option>2016</option>
						<option>2017</option>
						<option>2018</option>
						<option>2019</option>
						<option>2020</option>
						<option>2021</option>
						<option>2022</option>
						<option>2023</option>
						<option>2024</option>
						<option>2025</option>
						<option>2026</option>
						<option>2027</option>
						<option>2028</option>
						<option>2029</option>
						<option>2030</option>
						<option>2031</option>
						<option>2032</option>
						<option>2033</option>
						<option>2034</option>
						<option>2035</option>
						<option>2036</option>
						<option>2037</option>
						<option>2038</option>
						<option>2039</option>
						<option>2040</option>
						<option>2041</option>
						<option>2042</option>
						<option>2043</option>
						<option>2044</option>
						<option>2045</option>
						<option>2046</option>
						<option>2047</option>
						<option>2048</option>
						<option>2049</option>
						<option>2050</option>
					</select><span style="float:left">年</span>
					<select style=" min-width: 20px;max-width: 60px;float: left;" class="sel" name="jhkgsjy" id="jhkgsjy">
						<option>1</option>
						<option>2</option>
						<option>3</option>
						<option>4</option>
						<option>5</option>
						<option>6</option>
						<option>7</option>
						<option>8</option>
						<option>9</option>
						<option>10</option>
						<option>11</option>
						<option>12</option>
					</select><span style="float:left">月</span>
					<input name="yf" id="yf" value="<%=(xmxx.get("YF")==null?"":xmxx.get("YF"))%>" type="hidden" max="12" min="1" step="1"/>
					</td>
				</tr>
				<tr>
					<td>建设单位</td>
					<td><input name="jsdw" id="jsdw" value="<%=(xmxx.get("JSDW")==null?"":xmxx.get("JSDW"))%>" type="text" readonly="readonly" />
					</td>
					<td>是否开工</td>
					<td><select name ="sfkg">
							<option value="" >请选择</option>
							<option value="0" <%=("0".equals(xmxx.get("SFKG"))?"selected='selected'":"") %> >未开工</option>
							<option value="1" <%=("1".equals(xmxx.get("SFKG"))?"selected='selected'":"") %>>开工</option>
					</select>
					</td>
				</tr>
				
				<tr>
					<td colspan="4"><h4>立项</h4>
					</td>
				</tr>
				<tr>
				
					<td>是否办结</td>
					<td><input <%=(xmxx.get("LXSFBJ")==null?"":"checked='checked'")%> name="lxsfbj" id="lxsfbj" type="checkbox" />
					</td>
					<td>进展情况</td>
					<td><textarea name="lxjzqk" id="lxjzqk" ><%=(xmxx.get("LXJZQK")==null?"":xmxx.get("LXJZQK"))%></textarea>
					</td>
				</tr>
				<tr id="lxtr">
					<td>手续文号</td>
					<td><input name="lxsxwh" id="lxsxwh" value="<%=(xmxx.get("LXSXWH")==null?"":xmxx.get("LXSXWH"))%>" type="text" />
					</td>
					<td>上传附件</td>
					<td><input name="lxscfj" id="lxscfj" type="file" />
					</td>
				</tr>
				<tr>
					<td colspan="4"><h4>环评</h4>
					</td>
				</tr>
				<tr>
					<td>是否办结</td>
					<td><input name="hpsfbj" <%=(xmxx.get("HPSFBJ")==null?"":"checked='checked'")%> id="hpsfbj" type="checkbox" />
					</td>
					<td>进展情况</td>
					<td><textarea name="hpjzqk" id="hpjzqk"><%=(xmxx.get("HPJZQK")==null?"":xmxx.get("HPJZQK"))%></textarea>
					</td>
				</tr>
				<tr id="hptr">
					<td>手续文号</td>
					<td><input name="hpsxwh" id="hpsxwh" value="<%=(xmxx.get("HPSXWH")==null?"":xmxx.get("HPSXWH"))%>" type="text" />
					</td>
					<td>上传附件</td>
					<td><input name="hpscfj" id="hpscfj" type="file" />
					</td>
				</tr>
				<tr>
					<td colspan="4"><h4>土地</h4>
					</td>
				</tr>
				<tr>
					<td>是否办结</td>
					<td><input name="tdsfbj" <%=(xmxx.get("TDSFBJ")==null?"":"checked='checked'")%> id="tdsfbj" type="checkbox" />
					</td>
					<td>进展情况</td>
					<td><textarea name="tdjzqk" id="tdjzqk"><%=(xmxx.get("TDJZQK")==null?"":xmxx.get("TDJZQK"))%></textarea>
					</td>
				</tr>
				<tr id="tdtr">
					<td>手续文号</td>
					<td><input name="tdsxwh" id="tdsxwh" value="<%=(xmxx.get("TDSXWH")==null?"":xmxx.get("TDSXWH"))%>" type="text" />
					</td>
					<td>上传附件</td>
					<td><input name="tdscfj" id="tdscfj" type="file" />
					</td>
				</tr>
				<tr>
					<td colspan="4"><h4>林地</h4>
					</td>
				</tr>
				<tr>
					<td>是否办结</td>
					<td><input name="ldsfbj" <%=(xmxx.get("LDSFBJ")==null?"":"checked='checked'")%> id="ldsfbj" type="checkbox" />
					</td>
					<td>进展情况</td>
					<td><textarea name="ldjzqk" id="ldjzqk"><%=(xmxx.get("LDJZQK")==null?"":xmxx.get("LDJZQK"))%></textarea>
					</td>
				</tr>
				<tr id="ldtr">
					<td>手续文号</td>
					<td><input name="ldsxwh" id="ldsxwh" value="<%=(xmxx.get("LDSXWH")==null?"":xmxx.get("LDSXWH"))%>" type="text" />
					</td>
					<td>上传附件</td>
					<td><input name="ldscfj" id="ldscfj" type="file" />
					</td>
				</tr>
				<tr>
					<td colspan="4"><h4>安评</h4>
					</td>
				</tr>
				<tr>
					<td>是否办结</td>
					<td><input name="apsfbj" <%=(xmxx.get("APSFBJ")==null?"":"checked='checked'")%> id="apsfbj" type="checkbox" />
					</td>
					<td>进展情况</td>
					<td><textarea name="apjzqk" id="apjzqk"><%=(xmxx.get("APJZQK")==null?"":xmxx.get("APJZQK"))%></textarea>
					</td>
				</tr>
				<tr id="aptr">
					<td>手续文号</td>
					<td><input name="apsxwh" id="apsxwh" value="<%=(xmxx.get("APSXWH")==null?"":xmxx.get("APSXWH"))%>"  type="text" />
					</td>
					<td>上传附件</td>
					<td><input name="apscfj" id="apscfj" type="file" />
					</td>
				</tr>
				<tr>
					<td colspan="4"><h4>工程规划</h4>
					</td>
				</tr>
				<tr>
					<td>是否办结</td>
					<td><input name="gcghxksfbj" <%=(xmxx.get("GCGCGHXKXKSFBJ")==null?"":"checked='checked'")%> id="gcghxksfbj" type="checkbox" />
					</td>
					<td>进展情况</td>
					<td><textarea name="gcghxkjzqk" id="gcghxkjzqk"><%=(xmxx.get("GCGHXKJZQK")==null?"":xmxx.get("GCGHXKJZQK"))%></textarea>
					</td>
				</tr>
				<tr id="gcghxktr">
					<td>手续文号</td>
					<td><input name="gcghxksxwh" id="gcghxksxwh" value="<%=(xmxx.get("GCGHXKSXWH")==null?"":xmxx.get("GCGHXKSXWH"))%>" type="text" />
					</td>
					<td>上传附件</td>
					<td><input name="gcghxkscfj" id="gcghxkscfj" type="file" />
					</td>
				</tr>
				<tr>
					<td colspan="4"><h4>消防许可</h4>
					</td>
				</tr>
				<tr>
					<td>是否办结</td>
					<td><input name="xfxksfbj" <%=(xmxx.get("XFXKSFBJ")==null?"":"checked='checked'")%> id="xfxksfbj"  type="checkbox" />
					</td>
					<td>进展情况</td>
					<td><textarea name="xfxkjzqk" id="xfxkjzqk"><%=(xmxx.get("XFXKJZQK")==null?"":xmxx.get("XFXKJZQK"))%></textarea>
					</td>
				</tr>
				<tr id="xfxktr">
					<td>手续文号</td>
					<td><input name="xfxksxwh" id="xfxksxwh" value="<%=(xmxx.get("XFXKSXWH")==null?"":xmxx.get("XFXKSXWH"))%>" type="text" />
					</td>
					<td>上传附件</td>
					<td><input name="xfxkscfj" id="xfxkscfj" type="file" />
					</td>
				</tr>
				<tr>
					<td colspan="4"><h4>施工</h4>
					</td>
				</tr>
				<tr>
					<td>是否办结</td>
					<td><input name="sgsfbj" id="sgsfbj" <%=(xmxx.get("SGSFBJ")==null?"":"checked='checked'")%> type="checkbox" />
					</td>
					<td class="sgtd">进展情况</td>
					<td class="sgtd"><textarea name="sgscqk" id="sgscqk"><%=(xmxx.get("SGSCQK")==null?"":xmxx.get("SGJZQK"))%></textarea>
					</td>
				</tr>
				<tr id="sgtr">
					<td>手续文号</td>
					<td><input name="sgsxwh" id="sgsxwh" value="<%=(xmxx.get("SGSXWH")==null?"":xmxx.get("SGSXWH"))%>" type="text" />
					</td>
					<td>上传附件</td>
					<td><input name="sgscfj" id="sgscfj" type="file" />
					</td>
				</tr>
				<tr>
					<td colspan="4"><h4>项目进展</h4>
					</td>
				</tr>
				<tr>
				<td>土建工程(亿元)</td><td><input name="tjgc" id="tjgc" value="<%=(xmxx.get("TJGC")==null?"":xmxx.get("TJGC"))%>" onblur="setjzbywctz()" type="number" max="9999" min="0.00" step="0.01" /></td>
    			<td>设备购置安装(亿元)</td><td><input name="sbgzaz" id="sbgzaz" value="<%=(xmxx.get("SBGZAZ")==null?"":xmxx.get("SBGZAZ"))%>" onblur="setjzbywctz()" type="number" max="9999" min="0.00" step="0.01" /></td>
    		</tr>
    		<tr>
    			<td>土地等费用(亿元)</td><td><input name="tddfy" id="tddfy" value="<%=(xmxx.get("TDDFY")==null?"":xmxx.get("TDDFY"))%>" onblur="setjzbywctz()" type="number" max="9999" min="0.00" step="0.01" /></td>
    			<td>年度计划投资(亿元)</td><td><input name="ndjhtz" id="ndjhtz" type="text" value="<%=(xmxx.get("NDJHTZ")==null?"":xmxx.get("NDJHTZ"))%>"   readonly="readonly"/> </td>
    		</tr>
    		<tr>
    			<td>当月完成投资(亿元)</td>
    			<td><input type="hidden" id="jzbyywctz" name="jzbyywctz" value="<%=(xmxx.get("JZBYYWCTZ")==null?"":xmxx.get("JZBYYWCTZ"))%>"><label id="jzbyywctzl"></label>(亿元)</td>
    			<td>截至本月已完成投资</td><td><input name="dywctz" id="dywctz" type="text" value="<%=(xmxx.get("DYWCTZ")==null?"":xmxx.get("DYWCTZ"))%>"/></td>
    		</tr>
    		<tr>
    			<td>形象进度</td><td colspan="3"><textarea name="xxjd" id="xxjd" ><%=(xmxx.get("XXJD")==null?"":xmxx.get("XXJD"))%></textarea></td>
    		</tr>
    		<tr>
					<td colspan="4"><h4>联系方式</h4>
					</td>
				</tr>
				<tr>
					<td>区县负责人</td>
					<td><input name="qxfzr" id="qxfzr" value="<%=(xmxx.get("QXFZR")==null?"":xmxx.get("QXFZR"))%>" type="text" readonly="readonly"/>
					</td>
					<td>责任部门</td>
					<td><input name="zrbm" id="zrbm" value="<%=(xmxx.get("QXFZR")==null?"":xmxx.get("QXFZR"))%>" type="text"  readonly="readonly"/>
					</td>
				</tr>
				<tr>
					<td>调度联系人</td>
					<td><input name="ddlxr" id="ddlxr" value="<%=(xmxx.get("QXFZR")==null?"":xmxx.get("QXFZR"))%>" type="text"  readonly="readonly"/>
					</td>
					<td>调度联系人电话</td>
					<td><input name="lxfs" id="lxfs" value="<%=(xmxx.get("QXFZR")==null?"":xmxx.get("QXFZR"))%>" type="text" readonly="readonly"/>
					</td>
				</tr>
				<tr>
					<td colspan="4"><h4>备注</h4>
					</td>
				</tr>
    		<tr>
    			<td colspan="4" style="text-align: center;"><textarea name="bz" id="bz" style="width: 70%;" ><%=(xmxx.get("BZ")==null?"":xmxx.get("BZ"))%></textarea></td>
    		</tr>
    		<tr>
    			<%=piclist %>
    			
    		</tr>
				
    	</table>
    	<div id="box" margin="50px auto"; width="600px;" min-height="400px;" >
			<div id="test" ></div>
			</div>
    	</div>
    	<div style="padding: 15px;">
				<input type="submit" value="保存"  class="btn" style="position: relative;left: 100px;text-align: center;"/> 
		</div>
    </form>
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

  var yf=$("#yf").val();
var year=0;
var month=0;
var strs=new Array();
strs=yf.split("-");
year=strs[0];
month=strs[1];
$("#jhkgsjn").val(year);
	$("#jhkgsjy").val(month);
	$("#jhkgsjn").change(function(){
		year=$("#jhkgsjn").val();
		yf=year+"-"+month;
		$("#yf").val(yf);

	});
	$("#jhkgsjy").change(function(){
		month=$("#jhkgsjy").val();
		yf=year+"-"+month;
		$("#yf").val(yf);

	});
   $('#test').diyUpload({
	url:'http://localhost:8080/Bigitem/UploadServlet.do?ddid=<%=xmid%>',
	success:function( data ) {
		console.info( data );
	},
	error:function( err ) {
		console.info( err );	
	}
});
  
  
  
  
  function delAPic(id,o){
  	if(window.confirm("确定要删除吗？")){
  	$.get("Xmddsb.do?method=delpic&fjid="+id,function(data,status){
  	console.log(data);
  		var json=eval("(" + data + ")");
  		if(json.errcode=="0")
    		$(o).parent().remove();
    	alert(json.errcode+json.msg);
  	});
  	}
  }
  
  $("[type='checkbox']").parent().css("text-align","left");
	$("[type='number']").parent().css("text-align","left");
	$("[type='month']").parent().css("text-align","left");
	$("label").parent().css("text-align","left");
  <%=(xmxx.get("YDXQ")==null?"":"$('#xxzjsydzb').css('visibility', 'hidden'); $('#xxzjsydzb').parent().prev().css('visibility', 'hidden');")%>
  
  $("[id$='sfbj']").parent().parent().next().css("visibility", "hidden");
  <%=jsfj%>
  $("[id$='sfbj']").on('change',function(){
  	setsfbj(this);
  });
  $("[type='checkbox']").parent().css("text-align","left");
	$("[type='number']").parent().css("text-align","left");
	$("[type='month']").parent().css("text-align","left");
	$("label").parent().css("text-align","left");
  <%=(xmxx.get("YDXQ")==null?"":"$('#xxzjsydzb').css('visibility', 'hidden'); $('#xxzjsydzb').parent().prev().css('visibility', 'hidden');")%>
  
  $("[id$='sfbj']").parent().parent().next().css("visibility", "hidden");
  <%=jsfj%>
  $("[id$='sfbj']").on('change',function(){
  	setsfbj(this);
  });
  $(document).ready(function(){
		setsfbj($("#lxsfbj"));
		setsfbj($("#hpsfbj"));
		setsfbj($("#tdsfbj"));
		setsfbj($("#ldsfbj"));
		setsfbj($("#apsfbj"));
		setsfbj($("#gcghxksfbj"));
		setsfbj($("#xfxksfbj"));
		setsfbj($("#sgsfbj"));
	});
  function setsfbj(a){
  	if(true == $(a).is(':checked')){
  		$(a).parent().next().css("visibility", "hidden");
  		$(a).parent().next().next().css("visibility", "hidden");
  		$(a).parent().parent().next().css("visibility", "visible");
  	}else{
  		$(a).parent().next().css("visibility", "visible");
  		$(a).parent().next().next().css("visibility", "visible");
  		$(a).parent().parent().next().css("visibility", "hidden");
  	}
  }
  
  $("#ydxq").on("change",function(){
		if (true == $(this).is(':checked')) {
			$("#xxzjsydzb").css("visibility", "visible");
			$("#xxzjsydzb").parent().prev().css("visibility", "visible");
		}
		else{
		 	$("#xxzjsydzb").css("visibility", "hidden");
		 	$("#xxzjsydzb").parent().prev().css("visibility", "hidden");
		 }
	});
  
  
  

	function setzyjb(){
		var s="";
		if(true == $("#zyjb1").is(':checked'))s+="1";
		if(true == $("#zyjb2").is(':checked'))s+="2";
		if(true == $("#zyjb3").is(':checked'))s+="3";
		document.getElementById("zyjb").value=s;
	}
	function settzwcbl(){
		var m=0;
		m=parseFloat(Number(document.getElementById("dywctz").value/document.getElementById("ndjhtz").value));
		document.getElementById("tzwcbl").value=m.toFixed(2);
		document.getElementById("tzwcbll").innerHTML=m.toFixed(2);
		
		
	}
	function setjzbywctz(){
		var s=0;
		s+=Number(document.getElementById("tjgc").value)+
		Number(document.getElementById("sbgzaz").value)+
		Number(document.getElementById("tddfy").value);
		document.getElementById("jzbyywctz").value=s;
		document.getElementById("jzbyywctzl").innerHTML=s;
	}
	function xmchange(value){
    var selectedOption=value.options[value.selectedIndex];  
	window.location.href='Xmddsb.do?method=getxm&xmid='+selectedOption.value;	
	}
	function setztz(){
		var s=0;
		s+=Number(document.getElementById("zc").value)+
		Number(document.getElementById("dk").value)+
		Number(document.getElementById("qt").value);
		document.getElementById("ztz").value=s;
		document.getElementById("ztzl").innerHTML=s;
	}
	function setndjhtz(){
		var s=0;
		s+=Number(document.getElementById("sbntz").value)+
		Number(document.getElementById("xbntz").value);
		document.getElementById("ndjhtz").value=s;
	}
  
  $('#zyjb').val('<%=xmxx.get("ZYJB")%>');
  $('#jsjd').val('<%=xmxx.get("JSJD")%>');
  $('#sscy').val('<%=xmxx.get("SSCY")%>');
  $('#szqx').val('<%=xmxx.get("SZQX")%>');
</script>
  
</html>
