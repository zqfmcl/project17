<%@page import="com.lzcb.bigitem.dao.MessageDaoImpl"%>
<%@page import="com.lzcb.bigitem.dao.MessageDao"%>
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

<title>重大项目申报</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="重大项目申报">
<meta http-equiv="description" content="重大项目申报编辑界面">
<script src="JS/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="CSS/bi.main.css">
<%
	List<Map<String,Object>> qxlist=DbHelper.queryForTable("select * from bi_dqxxb order by sjjd_dm,pxh");
	String option_szqx="";
	for(int i=0;i<qxlist.size();i++)
	{
		Map m=qxlist.get(i);
		option_szqx+="<option value='"+m.get("ID")+"'>";
		option_szqx+=m.get("DQ_NAME")+"</option>";
	}
	
	List<Map<String,Object>> cylist=DbHelper.queryForTable("select * from bi_cyxxb order by sjjd_dm,pxh ");
	String option_sscy="";
	for(int i=0;i<cylist.size();i++)
	{
		Map m=cylist.get(i);
		option_sscy+="<option value='"+m.get("ID")+"'>";
		option_sscy+=m.get("CY_NAME")+"</option>";
	}
	String xmid=request.getParameter("xmid");
	Map xmxx=DbHelper.queryARow("select * from bi_xmxx where id="+xmid);
	List<Map<String,Object>> fjlist=DbHelper.queryForTable("select * from fujian fj where fj.ssbm='bi_xmxx' and fj.ssjldm="+xmid);
	String jsfj="";
  	for(int i=0;i<fjlist.size();i++){
  		Map m=fjlist.get(i);
  		jsfj+="$('#"+m.get("SSJLZD")+"').parent().append('<a href=\"Download.do?fjid="+m.get("ID")+"\">"+m.get("WJMC")+"-下载</a>');";
  		//jsfj+="$('#"+m.get("SSJLZD")+"').parent().parent().prev().find('[id$=\"sfbj\"]').attr('checked','checked');";
  		//jsfj+="$('#"+m.get("SSJLZD")+"').parent().parent().prev().find('[id$=\"jzqk\"]').css('visibility', 'hidden');";
  		//jsfj+="$('#"+m.get("SSJLZD")+"').parent().parent().prev().find('[id$=\"jzqk\"]').parent().prev().css('visibility', 'hidden');";
  		//jsfj+="$('#"+m.get("SSJLZD")+"').parent().parent().css('visibility', 'visible');";
 	}
 	MessageDao medao=new MessageDaoImpl();
 	medao.updateReason(Integer.parseInt(xmid));
 	String reason=DbHelper.queryForString("select REASON from BI_REASON where xmid="+xmid+" order by TIME DESC");
 	List<Map<String,Object>> reasonList=DbHelper.queryForTable("select REASON,TIME from BI_REASON where xmid="+xmid+" order by TIME DESC");
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
</style>
</head>
<body>
	<div class="div-title">
		<span style="font-size: 20px;">维护年度重大项目信息</span> &nbsp;<a
			style="text-decoration: none;font-size: 12px;" target="mainPage"
			href="javascript:history.back(-1)">返回列表</a>
			<a
			style="text-decoration:underline;color:blue; font-size: 12px;cursor: pointer;" target="mainPage"
			onclick="ckfjyy()">查看否决/回退原因</a>
			
	</div>
	<div style="margin-left: 20px;">
		<h5
			style="border-bottom-style:solid; border-bottom-width: 1px; border-bottom-color: #ccc;">年度重大项目编辑</h5>
		<form id="form1" method="post" enctype="multipart/form-data"
			action="Xmsb.do?method=update&xmid=<%=xmid%>">
			<!-- <input type="hidden" name="id" id="id" value="<%=xmid%>"> -->
			<div class="form-editer">
				<table style="width:100%;table-layout: fixed;">
					<col style="width:20%;">
					<col style="width:30%;">
					<col style="width:20%;">
					<col style="width:30%;">
					<tr>
						<td colspan="4"><h4>项目基本情况</h4>
						</td>
					</tr>
					<tr>
						<td>项目名称</td>
						<td><input type="text"
							value="<%=(xmxx.get("XMMC")==null?"":xmxx.get("XMMC"))%>"
							name="xmmc" id="xmmc" />
						</td>
						<td>年份</td>
						<td><input name="nf" id="nf" type="number" max="9999" min="1800" step="1"
							value="<%=(xmxx.get("NF")==null?"":xmxx.get("NF"))%>" />
						</td>
					</tr>
					<tr>
						<td>建设单位</td>
						<td><input name="jsdwmc" id="jsdwmc" type="text"
							value="<%=(xmxx.get("JSDWMC")==null?"":xmxx.get("JSDWMC"))%>" />
						</td>
						<td>重要级别</td>
						<td><input type="hidden" name="zyjb" id="zyjb" value="<%=(xmxx.get("ZYJB")==null?"":xmxx.get("ZYJB"))%>">
						<label for="zyjb1">市重大<input id="zyjb1" type="checkbox" <%=(xmxx.get("ZYJB")!=null&&xmxx.get("ZYJB").toString().contains("1")?"checked='checked'":"") %> onchange="setzyjb()"></label>
						<label for="zyjb2">区重点<input id="zyjb2" type="checkbox" <%=(xmxx.get("ZYJB")!=null&&xmxx.get("ZYJB").toString().contains("2")?"checked='checked'":"") %> onchange="setzyjb()"></label>
						<label for="zyjb3">储备项目<input id="zyjb3" type="checkbox" <%=(xmxx.get("ZYJB")!=null&&xmxx.get("ZYJB").toString().contains("3")?"checked='checked'":"") %> onchange="setzyjb()"></label></td>
					</tr>
					<tr>
						<td>规模及建设内容</td>
						<td><input name="gmjjsnr" id="gmjjsnr" type="text"
							value="<%=(xmxx.get("GMJJSNR")==null?"":xmxx.get("GMJJSNR"))%>" />
						</td>
						<td>建设阶段</td>
						<td><select id="jsjd" name="jsjd">
								<option value="">请选择</option>
								<option value="1">新开工</option>
								<option value="2">续建</option>
						</select></td>
					</tr>
					<tr>
						<td>起始年份</td>
						<td><input type="number" max="9999" min="1800" step="1"
							value="<%=(xmxx.get("QSNF")==null?"":xmxx.get("QSNF"))%>"
							name="qsnf">至<input type="number" max="9999" min="1800" step="1"
							value="<%=(xmxx.get("JSNF")==null?"":xmxx.get("JSNF"))%>"
							name="jsnf">
						</td>
						<td>计划开工时间</td>
					<td >
					<select style=" min-width: 20px;max-width: 60px;float: left;" class="sel" name="jhkgsjn" id="jhkgsjn" >
						<option>0</option>
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
						<option>0</option>
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
					<input name="jhkgsj" id="jhkgsj" type="hidden" value="<%=(xmxx.get("JHKGSJ")==null?"0-0":xmxx.get("JHKGSJ"))%>">
					</td>
					</tr>
					<tr>
						
						<td>所在镇办</td>
						<td><select id="szqx" name="szqx">
								<%=option_szqx%>
						</select></td>
					</tr>
					<tr>
						<td>占地面积</td>
						<td><input name="zdmj" id="zdmj" type="number" max="9999" min="0.00" step="0.01"
							value="<%=(xmxx.get("ZDMJ")==null?"":xmxx.get("ZDMJ"))%>" />(亩)
						</td>
						<td>是否有用地需求</td>
						<td><input name="ydxq" id="ydxq" <%=(xmxx.get("YDXQ")==null?"":"checked='checked'") %> type="checkbox" />
						</td>
					</tr>
					<tr>
						<td>选址四至</td>
						<td><input name="xzsz" id="xzsz" type="text"
							value="<%=(xmxx.get("XZSZ")==null?"":xmxx.get("XZSZ"))%>" />
						</td>
						<td>需新增建设用地指标</td>
						<td><input name="xxzjsydzb" id="xxzjsydzb" type="number" max="9999" min="0.00" step="0.01"
							value="<%=(xmxx.get("XXZJSYDZB")==null?"":xmxx.get("XXZJSYDZB"))%>" /><label id="mu" style="visibility:visible;  ">(亩)</label>
						</td>
					</tr>
					<tr>
						<td colspan="4"><h4>资金来源</h4>
						</td>
					</tr>
					<tr>
						<td>自筹：</td>
						<td><input onblur="setztz()" name="zc" id="zc" type="number" max="9999" min="0.00" step="0.01"
							value="<%=(xmxx.get("ZC")==null?"":xmxx.get("ZC"))%>" />(亿元)</td>
						<td>贷款：</td>
						<td><input onblur="setztz()" name="dk" id="dk" type="number" max="9999" min="0.00" step="0.01"
							value="<%=(xmxx.get("DK")==null?"":xmxx.get("DK"))%>" />(亿元)</td>
					</tr>
					<tr>
						<td>其他：</td>
						<td><input onblur="setztz()" name="qt" id="qt" type="number" max="9999" min="0.00" step="0.01"
							value="<%=(xmxx.get("QT")==null?"":xmxx.get("QT"))%>" />(亿元)</td>
						<td>总投资</td>
						<td><input type="hidden" id="ztz" name="ztz" value="<%=(xmxx.get("ZTZ")==null?"":xmxx.get("ZTZ"))%>"><label id="ztzl"><%=(xmxx.get("ZTZ")==null?"":xmxx.get("ZTZ"))%></label>(亿元)</td>
					</tr>
					<tr>
						<td colspan="4"><h4>预期经济效益</h4>
						</td>
					</tr>
					<tr>
						<td>销售收入</td>
						<td><input name="xssr" id="xssr" type="number" max="9999" min="0.00" step="0.01"
							value="<%=(xmxx.get("XSSR")==null?"":xmxx.get("XSSR"))%>" />(亿元)</td>
						<td>利润</td>
						<td><input name="lr" id="lr" type="number" max="9999" min="0.00" step="0.01"
							value="<%=(xmxx.get("LR")==null?"":xmxx.get("LR"))%>" />(亿元)</td>
					</tr>
					<tr>
						<td>税金</td>
						<td><input name="sj" id="sj" type="number" max="9999" min="0.00" step="0.01"
							value="<%=(xmxx.get("SJ")==null?"":xmxx.get("SJ"))%>" />(亿元)</td>
					</tr>
					<tr>
						<td colspan="4"><h4>当年任务目标</h4>
						</td>
					</tr>
					<tr>
						<td>年度计划投资</td>
						<td><input name="ndjhtz" readonly="readonly" id="ndjhtz" type="number" max="9999" min="0.00" step="0.01"
							value="<%=(xmxx.get("NDJHTZ")==null?"":xmxx.get("NDJHTZ"))%>" />
						</td>
						<td>当年建设内容</td>
						<td><textarea name="dnjsnr" id="dnjsnr"><%=(xmxx.get("DNJSNR")==null?"":xmxx.get("DNJSNR"))%></textarea>
						</td>
					</tr>
					<tr>
						<td>上半年形象进度</td>
						<td><textarea name="sbnxxjd" id="sbnxxjd"><%=(xmxx.get("SBNXXJD")==null?"":xmxx.get("SBNXXJD"))%></textarea>
						</td>
						<td>上半年投资</td>
						<td><input name="sbntz" id="sbntz" type="number" onblur="setndjhtz()" max="9999" min="0.00" step="0.01"
							value="<%=(xmxx.get("SBNTZ")==null?"":xmxx.get("SBNTZ"))%>" />
						</td>
					</tr>
					<tr>
						<td>下半年形象进度</td>
						<td><textarea name="xbnxxjd" id="xbnxxjd"><%=(xmxx.get("XBNXXJD")==null?"":xmxx.get("XBNXXJD"))%></textarea>
						</td>
						<td>下半年投资</td>
						<td><input name="xbntz" id="xbntz" type="number" onblur="setndjhtz()" max="9999" min="0.00" step="0.01"
							value="<%=(xmxx.get("XBNTZ")==null?"":xmxx.get("XBNTZ"))%>" />
						</td>
					</tr>
					
					<tr>
						<td colspan="4"><h4>立项</h4>
						</td>
					</tr>
					<tr>
						<td>是否办结</td>
						<td><input name="lxsfbj" id="lxsfbj" <%=(xmxx.get("LXSFBJ")==null?"":"checked='checked'")%> type="checkbox" />
						</td>
						<td>进展情况</td>
						<td><textarea name="lxjzqk" id="lxjzqk"><%=(xmxx.get("LXJZQK")==null?"":xmxx.get("LXJZQK"))%></textarea>
						</td>
					</tr>
					<tr id="lxtr">
						<td>手续文号</td>
						<td><input name="lxsxwh" id="lxsxwh" type="text"
							value="<%=(xmxx.get("LXSXWH")==null?"":xmxx.get("LXSXWH"))%>" />
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
						<td><input name="hpsfbj" id="hpsfbj" <%=(xmxx.get("HPSFBJ")==null?"":"checked='checked'")%> type="checkbox" />
						</td>
						<td>进展情况</td>
						<td><textarea name="hpjzqk" id="hpjzqk"><%=(xmxx.get("HPJZQK")==null?"":xmxx.get("HPJZQK"))%></textarea>
						</td>
					</tr>
					<tr id="hptr">
						<td>手续文号</td>
						<td><input name="hpsxwh" id="hpsxwh" type="text"
							value="<%=(xmxx.get("HPSXWH")==null?"":xmxx.get("HPSXWH"))%>" />
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
						<td><input name="tdsfbj" id="tdsfbj" <%=(xmxx.get("TDSFBJ")==null?"":"checked='checked'")%> type="checkbox" />
						</td>
						<td>进展情况</td>
						<td><textarea name="tdjzqk" id="tdjzqk"><%=(xmxx.get("TDJZQK")==null?"":xmxx.get("TDJZQK"))%></textarea>
						</td>
					</tr>
					<tr id="tdtr">
						<td>手续文号</td>
						<td><input name="tdsxwh" id="tdsxwh" type="text"
							value="<%=(xmxx.get("TDSXWH")==null?"":xmxx.get("TDSXWH"))%>" />
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
						<td><input name="ldsfbj" id="ldsfbj" <%=(xmxx.get("LDSFBJ")==null?"":"checked='checked'")%> type="checkbox" />
						</td>
						<td>进展情况</td>
						<td><textarea name="ldjzqk" id="ldjzqk"><%=(xmxx.get("LDJZQK")==null?"":xmxx.get("LDJZQK"))%></textarea>
						</td>
					</tr>
					<tr id="ldtr">
						<td>手续文号</td>
						<td><input name="ldsxwh" id="ldsxwh" type="text"
							value="<%=(xmxx.get("LDSXWH")==null?"":xmxx.get("LDSXWH"))%>" />
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
						<td><input name="apsfbj" id="apsfbj" <%=(xmxx.get("APSFBJ")==null?"":"checked='checked'")%> type="checkbox" />
						</td>
						<td>进展情况</td>
						<td><textarea name="apjzqk" id="apjzqk"><%=(xmxx.get("APJZQK")==null?"":xmxx.get("APJZQK"))%></textarea>
						</td>
					</tr>
					<tr id="aptr">
						<td>手续文号</td>
						<td><input name="apsxwh" id="apsxwh" type="text"
							value="<%=(xmxx.get("APSXWH")==null?"":xmxx.get("APSXWH"))%>" />
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
						<td><input name="gcghxksfbj" id="gcghxksfbj" <%=(xmxx.get("GCGHXKSFBJ")==null?"":"checked='checked'")%> type="checkbox" />
						</td>
						<td>进展情况</td>
						<td><textarea name="gcghxkjzqk" id="gcghxkjzqk"><%=(xmxx.get("GCGHXKJZQK")==null?"":xmxx.get("GCGHXKJZQK"))%></textarea>
						</td>
					</tr>
					<tr id="gcghxktr">
						<td>手续文号</td>
						<td><input name="gcghxksxwh" id="gcghxksxwh" type="text"
							value="<%=(xmxx.get("GCGHXKSXWH")==null?"":xmxx.get("GCGHXKSXWH"))%>" />
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
						<td><input name="xfxksfbj" id="xfxksfbj" <%=(xmxx.get("XFXKSFBJ")==null?"":"checked='checked'")%> type="checkbox" />
						</td>
						<td>进展情况</td>
						<td><textarea name="xfxkjzqk" id="xfxkjzqk"><%=(xmxx.get("XFXKJZQK")==null?"":xmxx.get("XFXKJZQK"))%></textarea>
						</td>
					</tr>
					<tr id="xfxktr">
						<td>手续文号</td>
						<td><input name="xfxksxwh" id="xfxksxwh" type="text"
							value="<%=(xmxx.get("XFXKSXWH")==null?"":xmxx.get("XFXKSXWH"))%>" />
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
						<td>进展情况</td>
						<td><textarea name="sgjzqk" id="sgjzqk"><%=(xmxx.get("SGJZQK")==null?"":xmxx.get("SGJZQK"))%></textarea>
						</td>
					</tr>
					<tr id="sgtr">
						<td>手续文号</td>
						<td><input name="sgsxwh" id="sgsxwh" type="text"
							value="<%=(xmxx.get("SGSXWH")==null?"":xmxx.get("SGSXWH"))%>" />
						</td>
						<td>上传附件</td>
						<td><input name="sgscfj" id="sgscfj" type="file" />
						</td>
					</tr>
					<tr>
						<td colspan="4"><h4>联系方式</h4>
						</td>
					</tr>
					<tr>
						<td>项目负责人</td>
						<td><input name="xmfzr" id="xmfzr" type="text"
							value="<%=(xmxx.get("XMFZR")==null?"":xmxx.get("XMFZR"))%>" />
						</td>
						<td>负责人联系电话</td>
						<td><input name="fzrlxdh" id="fzrlxdh" type="text"
							value="<%=(xmxx.get("FZRLXDH")==null?"":xmxx.get("FZRLXDH"))%>" />
						</td>
					</tr>
					<tr>
						<td>调度联系人</td>
						<td><input name="ddlxr" id="ddlxr" type="text"
							value="<%=(xmxx.get("DDLXR")==null?"":xmxx.get("DDLXR"))%>" />
						</td>
						<td>调度联系人电话</td>
						<td><input name="ddlxrdh" id="ddlxrdh" type="text"
							value="<%=(xmxx.get("DDLXRDH")==null?"":xmxx.get("DDLXRDH"))%>" />
						</td>
					</tr>
					<tr>
						<td colspan="4"><h4>备注</h4>
						</td>
					</tr>
				<tr>
					
					<td colspan="4" style="text-align: center;">
						<textarea name="bz" id="bz" style="width: 70%;"><%=(xmxx.get("BZ")==null?"":xmxx.get("BZ"))%></textarea>
					</td>
				</tr>
				</table>
			</div>
			<div style="padding: 15px;">
				<input type="submit" value="保存"  class="btn" style="position: relative;left: 100px;text-align: center;"/> 
				<!-- <input type="button"  class="btn" value="保存并继续"  style="position: relative;left: 150px;text-align: center;"/> -->
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

var jhkgsj=$("#jhkgsj").val();
var year=0;
var month=0;
var strs=new Array();
strs=jhkgsj.split("-");
year=strs[0];
month=strs[1];
$("#jhkgsjn").val(year);
	$("#jhkgsjy").val(month);
	$("#jhkgsjn").change(function(){
		year=$("#jhkgsjn").val();
		jhkgsj=year+"-"+month;
		$("#jhkgsj").val(jhkgsj);

	});
	$("#jhkgsjy").change(function(){
		month=$("#jhkgsjy").val();
		jhkgsj=year+"-"+month;
		$("#jhkgsj").val(jhkgsj);

	});

$("#fjqx").click(function(){
  				$("#fjdiv").hide();
  				$("#form1").css("marginRight","0");
  			});
$("[type='checkbox']").parent().css("text-align","left");
	$("[type='number']").parent().css("text-align","left");
	$("[type='month']").parent().css("text-align","left");
	$("label").parent().css("text-align","left");
  
  
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
			$("#mu").css("visibility", "visible");
			$("#xxzjsydzb").css("visibility", "visible");
			$("#xxzjsydzb").parent().prev().css("visibility", "visible");
		}
		else{
			$("#mu").css("visibility", "hidden");
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
