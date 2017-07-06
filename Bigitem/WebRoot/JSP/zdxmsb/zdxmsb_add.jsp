<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.lzcb.bigitem.Entity.Tuser"%>
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
<meta http-equiv="description" content="重大项目申报新增界面">
<script src="JS/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="CSS/bi.main.css">
<%

	SimpleDateFormat sdfn=new SimpleDateFormat("yyyy");
	SimpleDateFormat sdfm=new SimpleDateFormat("MM");
	String year=sdfn.format(new Date());
	String month=sdfm.format(new Date());
	Tuser user=(Tuser)request.getSession().getAttribute("user");
	List<Map<String,Object>> qxlist=DbHelper.queryForTable("select * from bi_dqxxb order by sjjd_dm,pxh");
	String option_szqx="";
	for(int i=0;i<qxlist.size();i++)
	{
		Map m=qxlist.get(i);
		option_szqx+="<option "+(m.get("ID").equals(user.getDq_id()+"")?"selected='seleted'":"")+" value='"+m.get("ID")+"'>";
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


</style>
</head>
<body>
	<div class="div-title">
		<span style="font-size: 20px;">添加年度重大项目信息</span> &nbsp;<a
			style="text-decoration: none;font-size: 12px;" target="mainPage"
			href="javascript:history.back(-1)">返回列表</a>
	</div>
	<div style="margin-left: 20px;">
		<h4
			style="border-bottom-style:solid; border-bottom-width: 1px; border-bottom-color: #ccc;">年度重大项目申报</h4>
		<form id="form1" method="post" enctype="multipart/form-data" action="Xmsb.do?method=add" >
		<input type="hidden" name="lrr" value="<%=user.getId()%>">
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
					<td>项目名称<font color="red">*</font></td>
					<td><input type="text" name="xmmc" id="xmmc" />
					</td>
					<td>年份</td>
					<td><input name="nf" id="nf" value="<%=(Calendar.getInstance().get(Calendar.YEAR)) %>" type="number" max="9999" min="1800" step="1"/>
					</td>
				</tr>
				<tr>
					<td>建设单位</td>
					<td><input name="jsdwmc" id="jsdwmc" type="text" />
					</td>
					<td>重要级别<font color="red">*</font></td>
					<td><input type="hidden" name="zyjb" id="zyjb" value="">
						<label for="zyjb1">市重大<input id="zyjb1" type="checkbox" onchange="setzyjb()"></label>
						<label for="zyjb2">区重点<input id="zyjb2" type="checkbox" onchange="setzyjb()"></label>
						<label for="zyjb3">储备项目<input id="zyjb3" type="checkbox" onchange="setzyjb()"></label></td>
				</tr>
				<tr>
					<td>规模及建设内容<font color="red">*</font></td>
					<td><textarea name="gmjjsnr" id="gmjjsnr"></textarea>
					</td>
					<td>建设阶段<font color="red">*</font></td>
					<td><select name="jsjd" style="max-width: 80px;float: left;">
							<option value="">请选择</option>
							<option value="1">新开工</option>
							<option value="2">续建</option>
					</select></td>
				</tr>
				<tr>
					<td>起始年份</td>
					<td><input  value="<%=(Calendar.getInstance().get(Calendar.YEAR)) %>" type="number" max="9999" min="1800" step="1" name="qsnf" >至
					<input  value="<%=(Calendar.getInstance().get(Calendar.YEAR)) %>" type="number" max="9999" min="1800" step="1"
						name="jsnf">
					</td>
					<td>计划开工时间</td>
					<td >
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
					<input name="jhkgsj" id="jhkgsj" type="hidden" >
					</td>
				</tr>
				<tr>
					
					<td>所在镇办<font color="red">*</font></td>
					<td><select name="szqx" style="max-width: 80px;float: left;">
							<%=option_szqx%>
					</select></td>
				</tr>
				<tr>
					<td>占地面积</td>
					<td><input name="zdmj" id="zdmj" type="number" max="9999" min="0.00" step="0.01" />(亩)
					</td>
					<td>是否有用地需求<font color="red">*</font></td>
					<td><input name="ydxq" id="ydxq" type="checkbox" />
					</td>
				</tr>
				<tr>
					<td>选址四至</td>
					<td><textarea name="xzsz" id="xzsz"></textarea>
					</td>
					<td>需新增建设用地指标</td>
					<td><input name="xxzjsydzb" id="xxzjsydzb" type="number" max="9999" min="0.00" step="0.01" /><label id="mu" style="visibility:hidden; ">(亩)</label>
					</td>
				</tr>
				<tr>
					<td colspan="4"><h4>资金来源</h4>
					</td>
				</tr>
				<tr>
					<td>自筹<font color="red">*</font>：</td>
					<td><input value="0.00" onblur="setztz()" name="zc" id="zc" type="number" max="9999" min="0.00" step="0.01" />(亿元)</td>
					<td>贷款<font color="red">*</font>：</td>
					<td><input value="0.00" onblur="setztz()" name="dk" id="dk" type="number" max="9999" min="0.00" step="0.01" />(亿元)</td>
				</tr>
				<tr>
					<td>其他：</td>
					<td><input value="0.00" onblur="setztz()" name="qt" id="qt" type="number" max="9999" min="0.00" step="0.01" />(亿元)</td>
					<td>总投资</td>
					<td><input type="hidden" id="ztz" name="ztz" value="0.00"><label id="ztzl"></label>(亿元)</td>
				</tr>
				<tr>
					<td colspan="4"><h4>预期经济效益</h4>
					</td>
				</tr>
				<tr>
					<td>销售收入</td>
					<td><input value="0.00" name="xssr" id="xssr" type="number" max="9999" min="0.00" step="0.01" />(亿元)</td>
					<td>利润</td>
					<td><input value="0.00" name="lr" id="lr" type="number" max="9999" min="0.00" step="0.01" />(亿元)</td>
				</tr>
				<tr>
					<td>税金</td>
					<td><input value="0.00" name="sj" id="sj" type="number" max="9999" min="0.00" step="0.01" />(亿元)</td>
				</tr>
				<tr>
					<td colspan="4"><h4>当年任务目标</h4>
					</td>
				</tr>
				<tr>
					<td>年度计划投资</td>
					<td colspan="3"><input name="ndjhtz"  id="ndjhtz" type="number" max="9999" min="0.00" step="0.01"/>(亿元)
					</td>
					
				</tr>
				<tr><td>当年建设内容</td>
					<td colspan="3"><textarea name="dnjsnr" id="dnjsnr"></textarea>
					</td></tr>
				<tr>
					<td>上半年形象进度</td>
					<td><textarea name="sbnxxjd" id="sbnxxjd"></textarea>
					</td>
					<td>上半年投资</td>
					<td><input name="sbntz" id="sbntz" type="number" onblur="setndjhtz()" max="9999" min="0.00" step="0.01" />(亿元)
					</td>
				</tr>
				<tr>
					<td>下半年形象进度</td>
					<td><textarea name="xbnxxjd" id="xbnxxjd"></textarea>
					</td>
					<td>下半年投资</td>
					<td><input name="xbntz" id="xbntz" type="number" onblur="setndjhtz()" max="9999" min="0.00" step="0.01" />(亿元)
					</td>
				</tr>
				
				<tr>
					<td colspan="4"><h4>立项</h4>
					</td>
				</tr>
				<tr>
					<td>是否办结<font color="red">*</font></td>
					<td><input name="lxsfbj" id="lxsfbj" type="checkbox" />
					</td>
					<td>进展情况</td>
					<td><textarea name="lxjzqk" id="lxjzqk" ></textarea>
					</td>
				</tr>
				<tr id="lxtr">
					<td>手续文号</td>
					<td><input name="lxsxwh" id="lxsxwh" type="text" />
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
					<td><input name="hpsfbj" id="hpsfbj" type="checkbox" />
					</td>
					<td>进展情况</td>
					<td><textarea name="hpjzqk" id="hpjzqk"></textarea>
					</td>
				</tr>
				<tr id="hptr">
					<td>手续文号</td>
					<td><input name="hpsxwh" id="hpsxwh" type="text" />
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
					<td><input name="tdsfbj" id="tdsfbj" type="checkbox" />
					</td>
					<td>进展情况</td>
					<td><textarea name="tdjzqk" id="tdjzqk"></textarea>
					</td>
				</tr>
				<tr id="tdtr">
					<td>手续文号</td>
					<td><input name="tdsxwh" id="tdsxwh" type="text" />
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
					<td><input name="ldsfbj" id="ldsfbj" type="checkbox" />
					</td>
					<td>进展情况</td>
					<td><textarea name="ldjzqk" id="ldjzqk"></textarea>
					</td>
				</tr>
				<tr id="ldtr">
					<td>手续文号</td>
					<td><input name="ldsxwh" id="ldsxwh" type="text" />
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
					<td><input name="apsfbj" id="apsfbj" type="checkbox" />
					</td>
					<td>进展情况</td>
					<td><textarea name="apjzqk" id="apjzqk"></textarea>
					</td>
				</tr>
				<tr id="aptr">
					<td>手续文号</td>
					<td><input name="apsxwh" id="apsxwh" type="text" />
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
					<td><input name="gcghxksfbj" id="gcghxksfbj" type="checkbox" />
					</td>
					<td>进展情况</td>
					<td><textarea name="gcghxkjzqk" id="gcghxkjzqk"></textarea>
					</td>
				</tr>
				<tr id="gcghxktr">
					<td>手续文号</td>
					<td><input name="gcghxksxwh" id="gcghxksxwh" type="text" />
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
					<td><input name="xfxksfbj" id="xfxksfbj" type="checkbox" />
					</td>
					<td>进展情况</td>
					<td><textarea name="xfxkjzqk" id="xfxkjzqk"></textarea>
					</td>
				</tr>
				<tr id="xfxktr">
					<td>手续文号</td>
					<td><input name="xfxksxwh" id="xfxksxwh" type="text" />
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
					<td><input name="sgsfbj" id="sgsfbj" type="checkbox" />
					</td>
					<td>进展情况</td>
					<td><textarea name="sgscqk" id="sgscqk"></textarea>
					</td>
				</tr>
				<tr id="sgtr">
					<td>手续文号</td>
					<td><input name="sgsxwh" id="sgsxwh" type="text" />
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
					<td>项目负责人<font color="red">*</font></td>
					<td><input name="xmfzr" id="xmfzr" type="text" />
					</td>
					<td>负责人联系电话<font color="red">*</font></td>
					<td><input name="fzrlxdh" id="fzrlxdh" type="text" />
					</td>
				</tr>
				<tr>
					<td>调度联系人<font color="red">*</font></td>
					<td><input name="ddlxr" id="ddlxr" type="text" />
					</td>
					<td>调度联系人电话<font color="red">*</font></td>
					<td><input name="ddlxrdh" id="ddlxrdh" type="text" />
					</td>
				</tr>
				<tr>
					<td colspan="4"><h4>备注</h4>
					</td>
				</tr>
				<tr>
					
					<td colspan="4" style="text-align: center;">
						<textarea name="bz" id="bz" style="width: 70%;"></textarea>
					</td>
				</tr>
			</table>
		</div>
			<div style="padding: 15px;">
				<input type="button" value="保存"  class="btn" style="position: relative;left: 100px;text-align: center;" onclick = "checkForm()" /> 
				<input type="button"  class="btn" value="保存并继续" onclick="savAndCon()" style="position: relative;left: 150px;text-align: center;"/>
			</div>
		</form>
	</div>
	<div class="showmsg" id="showmsg">${msg }</div>
</body>
<script type="text/javascript">
	var year=<%=year%>;
	var month=<%=month%>;
	var jhkgsj="";
	jhkgsj=year+"-"+month;
	$("#jhkgsj").val(jhkgsj);

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
	function savAndCon(){
		var a=$("#form1").attr("action");
		$("#form1").attr("action",a+"&cont=1");
		$("#form1").submit();
	}

	$("[type='checkbox']").parent().css("text-align","left");
	$("[type='number']").parent().css("text-align","left");
	$("[type='month']").parent().css("text-align","left");
	$("label").parent().css("text-align","left");
	
	$("#xxzjsydzb").css("visibility", "hidden");
	$("#xxzjsydzb").parent().prev().css("visibility", "hidden");
	$("[id$='sfbj']").parent().parent().next().css("visibility", "hidden");
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
		var zc=parseFloat(document.getElementById("zc").value);
		var dk=parseFloat(document.getElementById("dk").value);
		var qt=parseFloat(document.getElementById("qt").value);
		s=accAdd(zc,dk);
		s=accAdd(s,qt);
		//s+=Number(document.getElementById("zc").value)+
		//Number(document.getElementById("dk").value)+
		//Number(document.getElementById("qt").value);
		document.getElementById("ztz").value=s;
		document.getElementById("ztzl").innerHTML=s;
	}
	function accAdd(num1,num2){
       var r1,r2,m;
       try{
           r1 = num1.toString().split('.')[1].length;
       }catch(e){
           r1 = 0;
       }
       try{
           r2=num2.toString().split(".")[1].length;
       }catch(e){
           r2=0;
       }
       m=Math.pow(10,Math.max(r1,r2));
       // return (num1*m+num2*m)/m;
       return Math.round(num1*m+num2*m)/m;
    }
	function setndjhtz(){
		var s=0;
		var sbntz=document.getElementById("sbntz").value;
		var xbntz=document.getElementById("xbntz").value;
		s=accAdd(sbntz,xbntz);
		//s+=Number(document.getElementById("sbntz").value)+
		//Number(document.getElementById("xbntz").value);
		document.getElementById("ndjhtz").value=s;
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
