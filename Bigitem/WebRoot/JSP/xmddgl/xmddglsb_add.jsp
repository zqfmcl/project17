<%@page import="com.lzcb.bigitem.dao.YonghuDaoImpl"%>
<%@page import="com.lzcb.bigitem.dao.YonghuDao"%>
<%@page import="com.lzcb.bigitem.dao.DiquDaoImpl"%>
<%@page import="com.lzcb.bigitem.dao.DiquDao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@page import="com.lzcb.bigitem.utils.DbHelper"%>
<%@page import="com.lzcb.bigitem.Entity.Tuser"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'xmddgl_add.jsp' starting page</title>
    
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
	<script type="text/javascript" src="JS/diyUpload1.0.js"></script>
	
	

<%
	
	SimpleDateFormat sdfn=new SimpleDateFormat("yyyy");
	SimpleDateFormat sdfm=new SimpleDateFormat("MM");
	String year=sdfn.format(new Date());
	String month=sdfm.format(new Date());
 	Map xmxx=(Map)request.getAttribute("xmxx");
	Tuser user=(Tuser)request.getSession().getAttribute("user");
	List<Map<String,Object>> fjlist=DbHelper.queryForTable("select * from fujian fj where fj.ssbm='bi_xmxx' "+(xmxx!=null&&xmxx.get("ID")!=null?"and fj.ssjldm="+xmxx.get("ID"):""));
	String jsfj="";
	String ddid=DbHelper.queryForString("select seq_bi_xmddgl.nextval from dual");
	if(xmxx!=null){
  	for(int i=0;i<fjlist.size();i++){
  		Map m=fjlist.get(i);
  		jsfj+="$('#"+m.get("SSJLZD")+"').parent().append('<a href=\"Download.do?fjid="+m.get("ID")+"\">"+m.get("WJMC")+"-下载</a>');";
  		jsfj+="$('#"+m.get("SSJLZD")+"').parent().parent().prev().find('[id$=\"sfbj\"]').attr('checked','checked');";
  		jsfj+="$('#"+m.get("SSJLZD")+"').parent().parent().prev().find('[id$=\"jzqk\"]').css('visibility', 'hidden');";
  		jsfj+="$('#"+m.get("SSJLZD")+"').parent().parent().prev().find('[id$=\"jzqk\"]').parent().prev().css('visibility', 'hidden');";
  		jsfj+="$('#"+m.get("SSJLZD")+"').parent().parent().css('visibility', 'visible');";
 	}
	}
	DiquDao dqdao=new DiquDaoImpl();
	YonghuDao yhdao=new YonghuDaoImpl();
	List<Integer> jsdqlist=yhdao.findDqidById(user.getId());
		
			List<Integer> dq_list=dqdao.findXjjd(user.getDq_id());
			if(dq_list==null){
				dq_list=new ArrayList<Integer>();
			}if(jsdqlist!=null){
				dq_list.addAll(jsdqlist);
			}
			dq_list.add(user.getDq_id());
			String str="";
			for(int i=0;i<dq_list.size();i++){
				if(i<dq_list.size()-1){
					str+="SZQX="+dq_list.get(i)+" or ";
				}else{
					str+=" SZQX="+dq_list.get(i);
				}				
			}
	List<Map<String,Object>> qxlist=DbHelper.queryForTable("select ID,XMMC from bi_xmxx where shbz='T' and ("+str+") order by id desc");
	String option_xm="<option value='-1'>请选择<option>";
	for(int i=0;i<qxlist.size();i++)
	{
		Map m=qxlist.get(i);
		option_xm+="<option "+(xmxx!=null&&xmxx.get("ID")!=null&&xmxx.get("ID").equals(m.get("ID"))?"selected='selected'":"")+" value='"+m.get("ID")+"'>";
		option_xm+=m.get("XMMC")+"</option>";
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
textarea {
	min-height: 0;
	height:80px;
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
#box ul{padding-left:0;}
</style>

  </head>
  
  <body>
	<div class="div-title">
		<span style="font-size: 20px;">添加项目调度信息</span> &nbsp;<a
			style="text-decoration: none;font-size: 12px;" target="mainPage"
			href="Xmddsb.do?method=select">返回列表</a>
	</div>
	<div style="margin-left: 20px;">
		<h4
			style="border-bottom-style:solid; border-bottom-width: 1px; border-bottom-color: #ccc;">重大项目调度</h4>
		<form id="form1" method="post" enctype="multipart/form-data" action="Xmddsb.do?method=add&ddid=<%=ddid%>">
		<input type="hidden" name="lrr" value="<%=user.getId()%>">
		<div class="form-editer">
			<table style="width:100%;table-layout: fixed;">
				<col style="width:20%;">
				<col style="width:30%;">
				<col style="width:20%;">
				<col style="width:30%;">
				<tr>
					<td colspan="4"><h4>项目调度情况</h4>
					</td>
				</tr>
				<tr>
					<td>项目<font color="red">*</font></td>
					<td><select name="xm" onchange='xmchange(this)'><%=option_xm %></select></td>
					<td>月份<font color="red">*</font></td>
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
					<input name="yf" id="yf"  type="hidden" /> 
					</td>
				</tr>
				<tr>
					<td>建设单位</td>
					<td><input readonly="readonly" name="jsdw" id="jsdw" type="text" value="<%=((xmxx!=null&&xmxx.get("JSDWMC")!=null)?xmxx.get("JSDWMC"):"") %>"/>
					</td>
					<td>是否开工<font color="red">*</font></td>
					<td><select name="sfkg" style="max-width: 80px;float: left;">
							<option value="">请选择</option>
							<option value="1">开工</option>
							<option value="0">未开工</option>
					</select></td>
				</tr>
				
				<tr>
					<td colspan="4"><h4>立项</h4>
					</td>
				</tr>
				<tr>
				
					<td>是否办结<font color="red">*</font></td>
					<td><input <%=(xmxx!=null&&xmxx.get("LXSFBJ")!=null?"checked='checked'":"")%> name="lxsfbj" id="lxsfbj" type="checkbox" />
					</td>
					<td>进展情况</td>
					<td><textarea name="lxjzqk" id="lxjzqk" ><%=((xmxx!=null&&xmxx.get("LXJZQK")!=null)?xmxx.get("LXJZQK"):"") %></textarea>
					</td>
				</tr>
				<tr id="lxtr">
					<td>手续文号</td>
					<td><input name="lxsxwh" id="lxsxwh" value="<%=((xmxx!=null&&xmxx.get("LXSXWH")!=null)?xmxx.get("LXSXWH"):"") %>" type="text" />
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
					<td>是否办结<font color="red">*</font></td>
					<td><input <%=(xmxx!=null&&xmxx.get("HPSFBJ")!=null?"checked='checked'":"")%> name="hpsfbj" id="hpsfbj" type="checkbox" />
					</td>
					<td>进展情况</td>
					<td><textarea name="hpjzqk" id="hpjzqk"><%=((xmxx!=null&&xmxx.get("HPJZQK")!=null)?xmxx.get("HPJZQK"):"") %></textarea>
					</td>
				</tr>
				<tr id="hptr">
					<td>手续文号</td>
					<td><input name="hpsxwh" id="hpsxwh" value="<%=((xmxx!=null&&xmxx.get("HPJZQK")!=null)?xmxx.get("HPJZQK"):"") %>" type="text" />
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
					<td>是否办结<font color="red">*</font></td>
					<td><input <%=(xmxx!=null&&xmxx.get("TDSFBJ")!=null?"checked='checked'":"")%> name="tdsfbj" id="tdsfbj" type="checkbox" />
					</td>
					<td>进展情况</td>
					<td><textarea name="tdjzqk" id="tdjzqk"><%=((xmxx!=null&&xmxx.get("TDJZQK")!=null)?xmxx.get("TDJZQK"):"") %></textarea>
					</td>
				</tr>
				<tr id="tdtr">
					<td>手续文号</td>
					<td><input name="tdsxwh" id="tdsxwh" value="<%=((xmxx!=null&&xmxx.get("TDSXWH")!=null)?xmxx.get("TDSXWH"):"") %>" type="text" />
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
					<td>是否办结<font color="red">*</font></td>
					<td><input <%=(xmxx!=null&&xmxx.get("LDSFBJ")!=null?"checked='checked'":"")%> name="ldsfbj" id="ldsfbj" type="checkbox" />
					</td>
					<td>进展情况</td>
					<td><textarea name="ldjzqk" id="ldjzqk"><%=((xmxx!=null&&xmxx.get("LDJZQK")!=null)?xmxx.get("LDJZQK"):"") %></textarea>
					</td>
				</tr>
				<tr id="ldtr">
					<td>手续文号</td>
					<td><input name="ldsxwh" id="ldsxwh" value="<%=((xmxx!=null&&xmxx.get("LDSXWH")!=null)?xmxx.get("LDSXWH"):"") %>" type="text" />
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
					<td>是否办结<font color="red">*</font></td>
					<td><input <%=(xmxx!=null&&xmxx.get("APSFBJ")!=null?"checked='checked'":"")%> name="apsfbj" id="apsfbj" type="checkbox" />
					</td>
					<td>进展情况</td>
					<td><textarea name="apjzqk" id="apjzqk"><%=((xmxx!=null&&xmxx.get("APJZQK")!=null)?xmxx.get("APJZQK"):"") %></textarea>
					</td>
				</tr>
				<tr id="qttr">
					<td>手续文号</td>
					<td><input name="apsxwh" id="apsxwh" value="<%=((xmxx!=null&&xmxx.get("APSXWH")!=null)?xmxx.get("APSXWH"):"") %>"  type="text" />
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
					<td>是否办结<font color="red">*</font></td>
					<td><input <%=(xmxx!=null&&xmxx.get("GCGHXKSFBJ")!=null?"checked='checked'":"")%> name="gxghxksfbj" id="gcghxksfbj" type="checkbox" />
					</td>
					<td>进展情况</td>
					<td><textarea name="gcghxkjzqk" id="gcghxkjzqk"><%=((xmxx!=null&&xmxx.get("GCGHXKJZQK")!=null)?xmxx.get("GCGHXKJZQK"):"") %></textarea>
					</td>
				</tr>
				<tr id="ghtr">
					<td>手续文号</td>
					<td><input name="gcghxksxwh" id="gcghxksxwh" value="<%=((xmxx!=null&&xmxx.get("GCGHXKSXWH")!=null)?xmxx.get("GCGHXKSXWH"):"") %>" type="text" />
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
					<td>是否办结<font color="red">*</font></td>
					<td><input <%=(xmxx!=null&&xmxx.get("XFXKSFBJ")!=null?"checked='checked'":"")%> name="xfxksfbj" id="xfxksfbj"  type="checkbox" />
					</td>
					<td>进展情况</td>
					<td><textarea name="xfxkjzqk" id="xfxkjzqk"><%=((xmxx!=null&&xmxx.get("XFXKJZQK")!=null)?xmxx.get("XFXKJZQK"):"") %></textarea>
					</td>
				</tr>
				<tr id="xfxktr">
					<td>手续文号</td>
					<td><input name="xfxksxwh" id="xfxksxwh" value="<%=((xmxx!=null&&xmxx.get("XFXKSXWH")!=null)?xmxx.get("XFXKSXWH"):"") %>" type="text" />
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
					<td>是否办结<font color="red">*</font></td>
					<td><input <%=(xmxx!=null&&xmxx.get("SGSFBJ")!=null?"checked='checked'":"")%> name="sgsfbj" id="sgsfbj" type="checkbox" />
					</td>
					<td class="sgtd">进展情况</td>
					<td class="sgtd"><textarea name="sgscqk" id="sgscqk"><%=((xmxx!=null&&xmxx.get("SGSCQK")!=null)?xmxx.get("SGSCQK"):"") %></textarea>
					</td>
				</tr>
				<tr id="sgtr">
					<td>手续文号</td>
					<td><input name="sgsxwh" id="sgsxwh" value="<%=((xmxx!=null&&xmxx.get("SGSXWH")!=null)?xmxx.get("SGSXWH"):"") %>" type="text" />
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
    			<td>土建工程(亿元)</td><td><input name="tjgc" id="tjgc" value="0.00" onblur="setjzbywctz()" type="number" max="9999" min="0.00" step="0.01" /></td>
    			<td>设备购置安装(亿元)</td><td><input name="sbgzaz" id="sbgzaz" value="0.00" onblur="setjzbywctz()" type="number" max="9999" min="0.00" step="0.01" /></td>
    		</tr>
    		<tr>
    			<td>土地等费用(亿元)</td><td><input name="tddfy" id="tddfy" value="0.00" onblur="setjzbywctz()" type="number" max="9999" min="0.00" step="0.01" /></td>
    			<td>年度计划投资(亿元)</td><td><input name="ndjhtz" id="ndjhtz" type="number" disabled="true" value="<%=((xmxx!=null&&xmxx.get("NDJHTZ")!=null)?xmxx.get("NDJHTZ"):"") %>"  /> </td>
    		</tr>
    		<tr>
    			<td >当月完成投资<font color="red">*</font>(亿元)</td>
    			<td><input type="hidden" id="jzbyywctz" name="jzbyywctz" value="0.00"><label id="jzbyywctzl"></label>(亿元)</td>
    			<td>截至本月已完成投资<font color="red">*</font></td><td><input name="dywctz" id="dywctz" value="0.00" type="number" max="9999" min="0.00" step="0.01" onblur="settzwcbl()"/></td>
    		</tr>
    		<tr>
    			<td>投资完成比例</td><td colspan="3"><input type="hidden" name="tzwcbl" id="tzwcbl" value="0.00"><label id="tzwcbll"></label>(比例)</td>
    		</tr>
    		<tr>
    			<td>进展图片</td><td><div id="box" style="float:left" margin="50px auto"; width="600px;" min-height="400px;" >
						<div id="test" ></div>
					</div>
    			</td>
    		</tr>
    		<tr>
    			<td>形象进度<font color="red">*</font></td><td colspan="3"><textarea name="xxjd" id="xxjd"></textarea></td>
    		</tr>
    		<tr>
					<td colspan="4"><h4>联系方式</h4>
					</td>
				</tr>
				<tr>
					<td>区县负责人</td>
					<td><input name="qxfzr" id="qxfzr" type="text" />
					</td>
					<td>责任部门</td>
					<td><input name="zrbm" id="zrbm" type="text" />
					</td>
				</tr>
				<tr>
					<td>调度联系人</td>
					<td><input name="ddlxr" id="ddlxr" type="text" value="<%=((xmxx!=null&&xmxx.get("DDLXR")!=null)?xmxx.get("DDLXR"):"") %>"/>
					</td>
					<td>调度联系人电话</td>
					<td><input name="lxfs" id="lxfs" type="text" value="<%=((xmxx!=null&&xmxx.get("DDLXRDH")!=null)?xmxx.get("DDLXRDH"):"") %>"/>
					</td>
				</tr>
				<tr>
					<td colspan="4"><h4>备注</h4>
					</td>
				</tr>
    		<tr>
    			<td colspan="4" style="text-align: center;"><textarea name="bz" id="bz" style="width:70%;"></textarea></td>
    		</tr>
    		
			</table>
			<!-- <div id="box" margin="50px auto"; width="600px;" min-height="400px;" >
			<div id="test" ></div>
			</div> -->
		</div>
		
		<div style="padding: 15px;">
				<input type="button" value="保存"  class="btn" style="position: relative;left: 100px;text-align: center;" onclick="checkForm()"/> 
			</div>
			
			
		</form>
	</div>
	<div class="showmsg" id="showmsg">${msg }</div>
</body>
  <script type="text/javascript">
  var year=<%=year%>;
	var month=<%=month%>;
	var yf="";
	yf=year+"-"+month;
	$("#yf").val(yf);

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
	url:'http://localhost:8080/Bigitem/UploadServlet.do?ddid=<%=ddid%>',
	success:function( data ) {
		console.info( data );
	},
	error:function( err ) {
		console.info( err );	
	}
});
  
  
	$("[type='checkbox']").parent().css("text-align","left");
	$("[type='number']").parent().css("text-align","left");
	$("[type='month']").parent().css("text-align","left");
	$("label").parent().css("text-align","left");
	
	$("#xxzjsydzb").css("visibility", "hidden");
	$("#xxzjsydzb").parent().prev().css("visibility", "hidden");
	$("[id$='sfbj']").parent().parent().next().css("visibility", "hidden");
	<%=jsfj%>
	$("[id$='sfbj']").on('change', function() {
		if (true == $(this).is(':checked')) {
			$(this).parent().next().css("visibility", "hidden");
			$(this).parent().next().next().css("visibility", "hidden");
			$(this).parent().parent().next().css("visibility", "visible");
		} else {
			$(this).parent().next().css("visibility", "visible");
			$(this).parent().next().next().css("visibility", "visible");
			$(this).parent().parent().next().css("visibility", "hidden");
		}
	});
	$("#sfyydxq").on("change",function(){
		if (true == $(this).is(':checked')) {
			$("#xxzjsydzb").css("visibility", "visible");
			$("#xxzjsydzb").parent().prev().css("visibility", "visible");
		}
		else{
		 	$("#xxzjsydzb").css("visibility", "hidden");
		 	$("#xxzjsydzb").parent().prev().css("visibility", "hidden");
		 }
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
	function setzyjb(){
		var s="";
		if(true == $("#zyjb1").is(':checked'))s+="1";
		if(true == $("#zyjb2").is(':checked'))s+="2";
		if(true == $("#zyjb3").is(':checked'))s+="3";
		document.getElementById("zyjb").value=s;
	}
	function setndjhtz(){
		var s=0;
		s+=Number(document.getElementById("sbntz").value)+
		Number(document.getElementById("xbntz").value);
		document.getElementById("ndjhtz").value=s;
	}
	function xmchange(value){
    var selectedOption=value.options[value.selectedIndex];  
	window.location.href='Xmddsb.do?method=getxm&xmid='+selectedOption.value;	
	}
	function setjzbywctz(){
		var s=0;
		s+=Number(document.getElementById("tjgc").value)+
		Number(document.getElementById("sbgzaz").value)+
		Number(document.getElementById("tddfy").value);
		document.getElementById("jzbyywctz").value=s;
		document.getElementById("jzbyywctzl").innerHTML=s;
	}
	function settzwcbl(){
		var m=0;
		var n=document.getElementById("ndjhtz").value;
		if(n!=""&&n!=null&&n!=undefined){
		m=parseFloat(Number(document.getElementById("dywctz").value/document.getElementById("ndjhtz").value));
		document.getElementById("tzwcbl").value=m.toFixed(2);
		document.getElementById("tzwcbll").innerHTML=m.toFixed(2);
		}else{document.getElementById("tzwcbl").value=m.toFixed(2);
		document.getElementById("tzwcbll").innerHTML=m.toFixed(2);}
		
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
		setsfbj($("#lxsfbj"));
		setsfbj($("#hbsfbj"));
		setsfbj($("#tdsfbj"));
		setsfbj($("#ldsfbj"));
		setsfbj($("#qtsfbj"));
		setsfbj($("#ghsfbj"));
		setsfbj($("#xfxksfbj"));
		setsfbj($("#sgsfbj"));
	});
	
</script>
</html>
