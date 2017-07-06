<%@page import="com.lzcb.bigitem.utils.DbHelper"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
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
<meta http-equiv="description" content="重大项目申报查看界面">
<script src="JS/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="CSS/bi.main.css">
<%
	Map xmxx = (Map) request.getAttribute("xmxx");
%>
<style type="text/css">
body{
	background-color: f0f2f5;
}
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
</style>
</head>

<body>
	<div class="div-title">
		<span style="font-size: 20px;">年度重大项目信息</span> &nbsp;<a
			style="text-decoration: none;font-size: 12px;" target="mainPage"
			href="javascript:history.back(-1)">返回列表</a>
	</div>
	<div style="margin-left: 20px;">
		<h5
			style="border-bottom-style:solid; border-bottom-width: 1px; border-bottom-color: #ccc;">年度重大项目申报</h5>
		<div class="form-editer">
			<table style="width:100%;table-layout: fixed;">
				<col style="width:20%;">
				<col style="width:30%;">
				<col style="width:20%;">
				<col style="width:30%;">
				<tr>
					<td colspan="4"><h4>项目基本情况</h4></td>
				</tr>
				<tr>
					<td>项目名称</td>
					<td><label><%=(xmxx.get("XMMC") == null ? "" : xmxx.get("XMMC"))%></label>
					</td>
					<td>年份</td>
					<td><label><%=(xmxx.get("NF") == null ? "" : xmxx.get("NF"))%></label>
					</td>
				</tr>
				<tr>
					<td>建设单位</td>
					<td><label><%=(xmxx.get("JSDWMC") == null ? "" : xmxx.get("JSDWMC"))%></label>
					</td>
					<td>重要级别</td>
					<td><label for="zyjb1">市重大<input id="zyjb1" disabled="disabled" type="checkbox" <%=(xmxx.get("ZYJB")!=null&&xmxx.get("ZYJB").toString().contains("1")?"checked='checked'":"") %>"></label>
						<label for="zyjb2">区重点<input id="zyjb2" disabled="disabled" type="checkbox" <%=(xmxx.get("ZYJB")!=null&&xmxx.get("ZYJB").toString().contains("2")?"checked='checked'":"") %>"></label>
						<label for="zyjb3">储备项目<input id="zyjb3" disabled="disabled" type="checkbox" <%=(xmxx.get("ZYJB")!=null&&xmxx.get("ZYJB").toString().contains("3")?"checked='checked'":"") %>></label>
					</td>
				</tr>
				<tr>
					<td>规模及建设内容</td>
					<td><label><%=(xmxx.get("GMJJSNR") == null ? "" : xmxx.get("GMJJSNR"))%></label>
					</td>
					<td>建设阶段</td>
					<td><label><%=(xmxx.get("JSJDMC") == null ? "" : xmxx.get("JSJDMC"))%></label>
					</td>
				</tr>
				<tr>
					<td>起始年份</td>
					<td><label><%=(xmxx.get("QSNF") == null ? "" : xmxx.get("QSNF"))%>至
							<%=(xmxx.get("JSNF") == null ? "" : xmxx.get("JSNF"))%></label></td>
					<td>计划开工时间</td>
					<td><label><%=(xmxx.get("JHKGSJ") == null ? "" : xmxx.get("JHKGSJ"))%></label>
					</td>
				</tr>
				<tr>
					
					<td>所在镇办</td>
					<td><label><%=(xmxx.get("DQMC") == null ? "" : xmxx.get("DQMC"))%></label>
					</td>
				</tr>
				<tr>
					<td>占地面积</td>
					<td><label><%=(xmxx.get("ZDMJ") == null ? "" : xmxx.get("ZDMJ")+"(亩)")%></label>
					</td>
					<td>是否有用地需求</td>
					<td><input disabled="disabled" type="checkbox"
						<%=(xmxx.get("YDXQ") == null ? "" : "checked='checked'")%> /></td>
				</tr>
				<tr>
					<td>选址四至</td>
					<td><label><%=(xmxx.get("XZSZ") == null ? "" : xmxx.get("XZSZ"))%></label>
					</td>
					<td><%=(xmxx.get("YDXQ") == null ? "" : "需新增建设用地指标")%></td>
					<td><label><%=(xmxx.get("YDXQ") != null
					&& xmxx.get("XXZJSYDZB") != null
					? xmxx.get("XXZJSYDZB")+"(亩)"
					: "")%></label></td>
				</tr>
				<tr>
					<td colspan="4"><h4>资金来源</h4></td>
				</tr>
				<tr>
					<td>自筹：</td>
					<td><label><%=(xmxx.get("ZC") == null ? "" : xmxx.get("ZC"))%>(亿元)</label>
					</td>
					<td>贷款：</td>
					<td><label><%=(xmxx.get("DK") == null ? "" : xmxx.get("DK"))%>(亿元)</label>
					</td>
				</tr>
				<tr>
					<td>其他：</td>
					<td><label><%=(xmxx.get("QT") == null ? "" : xmxx.get("QT"))%>(亿元)</label>
					</td>
					<td>总投资</td>
					<td><label><%=(xmxx.get("ZTZ") == null ? "" : xmxx.get("ZTZ"))%>(亿元)</label>
					</td>
				</tr>
				<tr>
					<td colspan="4"><h4>预期经济效益</h4></td>
				</tr>
				<tr>
					<td>销售收入</td>
					<td><label><%=(xmxx.get("XSSR") == null ? "" : xmxx.get("XSSR"))%>(亿元)</label>
					</td>
					<td>利润</td>
					<td><label><%=(xmxx.get("LR") == null ? "" : xmxx.get("LR"))%>(亿元)</label>
					</td>
				</tr>
				<tr>
					<td>税金</td>
					<td><label><%=(xmxx.get("SJ") == null ? "" : xmxx.get("SJ"))%>(亿元)</label>
					</td>
				</tr>
				<tr>
					<td colspan="4"><h4>当年任务目标</h4></td>
				</tr>
				<tr>
					<td>年度计划投资</td>
					<td><label><%=(xmxx.get("NDJHTZ") == null ? "" : xmxx.get("NDJHTZ"))%></label>
					</td>
					<td>当年建设内容</td>
					<td><label><%=(xmxx.get("DNJSNR") == null ? "" : xmxx.get("DNJSNR"))%></label>
					</td>
				</tr>
				<tr>
					<td>上半年形象进度</td>
					<td><label><%=(xmxx.get("SBNXXJD") == null ? "" : xmxx.get("SBNXXJD"))%></label>
					</td>
					<td>上半年投资</td>
					<td><label><%=(xmxx.get("SBNTZ") == null ? "" : xmxx.get("SBNTZ"))%></label>
					</td>
				</tr>
				<tr>
					<td>下半年形象进度</td>
					<td><label><%=(xmxx.get("XBNXXJD") == null ? "" : xmxx.get("XBNXXJD"))%></label>
					</td>
					<td>下半年投资</td>
					<td><label><%=(xmxx.get("XBNTZ") == null ? "" : xmxx.get("XBNTZ"))%></label>
					</td>
				</tr>
				
				<tr>
					<td colspan="4"><h4>立项</h4></td>
				</tr>
				<tr>
					<%
						boolean lxbj = xmxx.get("LXSFBJ") == null;
						String lx = "<td>是否办结</td><td><input type='checkbox' disabled='disabled' "
								+ (lxbj ? "" : "checked='checked'") + "/></td>";
						if (lxbj)
							lx += "<td>进展情况</td><td>"
									+ (xmxx.get("LXJZQK") == null ? "" : xmxx.get("LXJZQK"))
									+ "</td>";
						else {
							Map m = DbHelper
									.queryARow("select fj.ID,fj.WJMC,dd.XM from fujian fj inner join BI_XMDDGL dd on fj.SSJLDM=dd.ID and fj.SSBM='bi_xmddgl'  inner join BI_XMXX xm on xm.ID=dd.XM and dd.XM="+xmxx.get("ID")+" and fj.ssjlzd='lxscfj' order by fj.ID DESC");
							if(m==null){
								 m = DbHelper
									.queryARow("select * from fujian fj where fj.ssbm='bi_xmxx' and fj.ssjlzd='lxscfj' and fj.ssjldm="
											+ xmxx.get("ID"));
							}				
							
							lx += "</tr><tr><td>手续文号</td><td>"
									+ (xmxx.get("LXSXWH") == null ? "" : xmxx.get("LXSXWH"))
									+ "</td><td>上传附件</td><td>"
									+ (m == null ? "" : "<a href='Download.do?fjid="
											+ m.get("ID") + "'>" + m.get("WJMC")
											+ "-下载</a>") + "</td>";
						}
					%>
					<%=lx%>
				</tr>
				<tr>
					<td colspan="4"><h4>环评</h4></td>
				</tr>
				<tr>
					<%
						boolean hpbj = xmxx.get("HPSFBJ") == null;
						String hp = "<td>是否办结</td><td><input type='checkbox' disabled='disabled' "
								+ (hpbj ? "" : "checked='checked'") + "/></td>";
						if (hpbj)
							hp += "<td>进展情况</td><td>"
									+ (xmxx.get("HPJZQK") == null ? "" : xmxx.get("HPJZQK"))
									+ "</td>";
						else {
							Map m = DbHelper
									.queryARow("select * from fujian fj where fj.ssbm='bi_xmxx' and fj.ssjlzd='hpscfj' and fj.ssjldm="
											+ xmxx.get("ID"));
							hp += "</tr><tr><td>手续文号</td><td>"
									+ (xmxx.get("HPSXWH") == null ? "" : xmxx.get("HPSXWH"))
									+ "</td><td>上传附件</td><td>"
									+ (m == null ? "" : "<a href='Download.do?fjid="
											+ m.get("ID") + "'>" + m.get("WJMC")
											+ "-下载</a>") + "</td>";
						}
					%>
					<%=hp%>
				</tr>
				<tr>
					<td colspan="4"><h4>土地</h4></td>
				</tr>
				<tr>
					<%
						boolean tdbj = xmxx.get("TDSFBJ") == null;
						String td = "<td>是否办结</td><td><input type='checkbox' disabled='disabled' "
								+ (tdbj ? "" : "checked='checked'") + "/></td>";
						if (tdbj)
							td += "<td>进展情况</td><td>"
									+ (xmxx.get("TDJZQK") == null ? "" : xmxx.get("TDJZQK"))
									+ "</td>";
						else {
							Map m = DbHelper
									.queryARow("select * from fujian fj where fj.ssbm='bi_xmxx' and fj.ssjlzd='tdscfj' and fj.ssjldm="
											+ xmxx.get("ID"));
							td += "</tr><tr><td>手续文号</td><td>"
									+ (xmxx.get("TDSXWH") == null ? "" : xmxx.get("TDSXWH"))
									+ "</td><td>上传附件</td><td>"
									+ (m == null ? "" : "<a href='Download.do?fjid="
											+ m.get("ID") + "'>" + m.get("WJMC")
											+ "-下载</a>") + "</td>";
						}
					%>
					<%=td%>
				</tr>
				<tr>
					<td colspan="4"><h4>林地</h4></td>
				</tr>
				<tr>
					<%
						boolean ldbj = xmxx.get("LDSFBJ") == null;
						String ld = "<td>是否办结</td><td><input type='checkbox' disabled='disabled' "
								+ (ldbj ? "" : "checked='checked'") + "/></td>";
						if (ldbj)
							ld += "<td>进展情况</td><td>"
									+ (xmxx.get("LDJZQK") == null ? "" : xmxx.get("LDJZQK"))
									+ "</td>";
						else {
							Map m = DbHelper
									.queryARow("select * from fujian fj where fj.ssbm='bi_xmxx' and fj.ssjlzd='ldscfj' and fj.ssjldm="
											+ xmxx.get("ID"));
							ld += "</tr><tr><td>手续文号</td><td>"
									+ (xmxx.get("LDSXWH") == null ? "" : xmxx.get("LDSXWH"))
									+ "</td><td>上传附件</td><td>"
									+ (m == null ? "" : "<a href='Download.do?fjid="
											+ m.get("ID") + "'>" + m.get("WJMC")
											+ "-下载</a>") + "</td>";
						}
					%>
					<%=ld%>
				</tr>
				<tr>
					<td colspan="4"><h4>安评</h4></td>
				</tr>
				<tr>
					<%
						boolean apbj = xmxx.get("APSFBJ") == null;
						String ap = "<td>是否办结</td><td><input type='checkbox' disabled='disabled' "
								+ (apbj ? "" : "checked='checked'") + "/></td>";
						if (apbj)
							ap += "<td>进展情况</td><td>"
									+ (xmxx.get("APJZQK") == null ? "" : xmxx.get("APJZQK"))
									+ "</td>";
						else {
							Map m = DbHelper
									.queryARow("select * from fujian fj where fj.ssbm='bi_xmxx' and fj.ssjlzd='apscfj' and fj.ssjldm="
											+ xmxx.get("ID"));
							ap += "</tr><tr><td>手续文号</td><td>"
									+ (xmxx.get("APSXWH") == null ? "" : xmxx.get("APSXWH"))
									+ "</td><td>上传附件</td><td>"
									+ (m == null ? "" : "<a href='Download.do?fjid="
											+ m.get("ID") + "'>" + m.get("WJMC")
											+ "-下载</a>") + "</td>";
						}
					%>
					<%=ap%>
				</tr>
				<tr>
					<td colspan="4"><h4>工程规划</h4></td>
				</tr>
				<tr>
					<%
						boolean gcghxkbj = xmxx.get("GCGHXKSFBJ") == null;
						String gcghxk = "<td>是否办结</td><td><input type='checkbox' disabled='disabled' "
								+ (gcghxkbj ? "" : "checked='checked'") + "/></td>";
						if (gcghxkbj)
							gcghxk += "<td>进展情况</td><td>"
									+ (xmxx.get("GCGHXKJZQK") == null ? "" : xmxx
											.get("GCGHXKJZQK")) + "</td>";
						else {
							Map m = DbHelper
									.queryARow("select * from fujian fj where fj.ssbm='bi_xmxx' and fj.ssjlzd='gcghxkscfj' and fj.ssjldm="
											+ xmxx.get("ID"));
							gcghxk += "</tr><tr><td>手续文号</td><td>"
									+ (xmxx.get("GCGHXKSXWH") == null ? "" : xmxx
											.get("GCGHXKSXWH"))
									+ "</td><td>上传附件</td><td>"
									+ (m == null ? "" : "<a href='Download.do?fjid="
											+ m.get("ID") + "'>" + m.get("WJMC")
											+ "-下载</a>") + "</td>";
						}
					%>
					<%=gcghxk%>
				</tr>
				<tr>
					<td colspan="4"><h4>消防许可</h4></td>
				</tr>
				<tr>
					<%
						boolean xfxkbj = xmxx.get("XFXKSFBJ") == null;
						String xfxk = "<td>是否办结</td><td><input type='checkbox' disabled='disabled' "
								+ (xfxkbj ? "" : "checked='checked'") + "/></td>";
						if (xfxkbj)
							xfxk += "<td>进展情况</td><td>"
									+ (xmxx.get("XFXKJZQK") == null ? "" : xmxx
											.get("XFXKJZQK")) + "</td>";
						else {
							Map m = DbHelper
									.queryARow("select * from fujian fj where fj.ssbm='bi_xmxx' and fj.ssjlzd='xfxkscfj' and fj.ssjldm="
											+ xmxx.get("ID"));
							xfxk += "</tr><tr><td>手续文号</td><td>"
									+ (xmxx.get("XFXKSXWH") == null ? "" : xmxx
											.get("XFXKSXWH"))
									+ "</td><td>上传附件</td><td>"
									+ (m == null ? "" : "<a href='Download.do?fjid="
											+ m.get("ID") + "'>" + m.get("WJMC")
											+ "-下载</a>") + "</td>";
						}
					%>
					<%=xfxk%>
				</tr>
				<tr>
					<td colspan="4"><h4>施工</h4></td>
				</tr>
				<tr>
					<%
						boolean sgbj = xmxx.get("SGSFBJ") == null;
						String sg = "<td>是否办结</td><td><input type='checkbox' disabled='disabled' "
								+ (sgbj ? "" : "checked='checked'") + "/></td>";
						if (sgbj)
							sg += "<td>进展情况</td><td>"
									+ (xmxx.get("SGJZQK") == null ? "" : xmxx.get("SGJZQK"))
									+ "</td>";
						else {
							Map m = DbHelper
									.queryARow("select * from fujian fj where fj.ssbm='bi_xmxx' and fj.ssjlzd='sgscfj' and fj.ssjldm="
											+ xmxx.get("ID"));
							sg += "</tr><tr><td>手续文号</td><td>"
									+ (xmxx.get("SGSXWH") == null ? "" : xmxx.get("SGSXWH"))
									+ "</td><td>上传附件</td><td>"
									+ (m == null ? "" : "<a href='Download.do?fjid="
											+ m.get("ID") + "'>" + m.get("WJMC")
											+ "-下载</a>") + "</td>";
						}
					%>
					<%=sg%>
				</tr>
				<tr>
					<td colspan="4"><h4>联系方式</h4></td>
				</tr>
				<tr>
					<td>项目负责人</td>
					<td><label><%=(xmxx.get("XMFZR") == null ? "" : xmxx.get("XMFZR"))%></label>
					</td>
					<td>负责人联系电话</td>
					<td><label><%=(xmxx.get("FZRLXDH") == null ? "" : xmxx.get("FZRLXDH"))%></label>
					</td>
				</tr>
				<tr>
					<td>调度联系人</td>
					<td><label><%=(xmxx.get("DDLXR") == null ? "" : xmxx.get("DDLXR"))%></label>
					</td>
					<td>调度联系人电话</td>
					<td><label><%=(xmxx.get("DDLXRDH") == null ? "" : xmxx.get("DDLXRDH"))%></label>
					</td>
				</tr>
				<tr>
					<td colspan="4"><h4>备注</h4>
					</td>
				</tr>
				<tr>
					<td>备注</td>
					<td colspan="3"><label><%=(xmxx.get("BZ") == null ? "" : xmxx.get("BZ"))%></label>
					</td>
				</tr>
			</table>
		</div>
	</div>
</body>
<script type="text/javascript">
	$("[type='checkbox']").parent().css("text-align", "left");
	$("label").parent().css("text-align", "left");
</script>
</html>
