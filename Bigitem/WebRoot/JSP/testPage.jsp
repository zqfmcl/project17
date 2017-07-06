<%@page import="com.lzcb.bigitem.Entity.Xmddgl"%>
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
    
    <title>My JSP 'testPage.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
	<script type="text/javascript" src="JS/jquery-3.2.1.min.js"></script>
	<script language="javascript" type="text/javascript" src="My97DatePicker"></script>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style type="text/css">

.custom-date-style {
	background-color: red !important;
}

.input{	
}
.input-wide{
	width: 500px;
}

</style>
	<script type="text/javascript" src="JS/jquery-3.2.1.min.js" charset="UTF-8"></script>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=A4749739227af1618f7b0d1b588c0e85">
</script>
<style type="text/css">
table{
	table-layout: fixed;
	margin: 0;
	border-right-style: solid;
	border-right-width: 1px;
	border-bottom-style: solid;
	border-bottom-width: 1px;
	border-collapse: collapse;
}
div{
	margin: 0px;
	white-space: normal;
	text-overflow:ellipsis;
	border-collapse: collapse;
	overflow: hidden;
}
.header{
	white-space: nowrap;
	overflow: hidden;
	direction: ltr;
}
.header-left{
}
.header-right{
}
.table-left{

}
.table-right{

}
col{
	display: table-column;
	empty-cells:show;
}
th,td{
	border-left-style:solid;
	border-left-width:1px;
	border-top-style:solid;
	border-top-width:1px;
	margin:0px;
	display: table-cell;
	overflow: hidden;
	overflow-x:hidden;
	overflow-y:hidden;
	text-overflow:ellipsis;
	white-space: normal;
}
tr{
	margin: 0px;
}
[class*="-left"],[class*="-right"]{
	position: relative;
	display: inline-block;
	overflow: hidden;
}
.aaaa{
	list-style-image: url('Image/forwordright.png');
}
</style>
<%
Xmddgl aaa=new Xmddgl();
System.out.println(aaa);
String power = request.getSession().getAttribute("power").toString();
 %>
  </head>
  <body>
  <ul class="aaaa">
  	<li><label>aaa</label><a>编辑</a><ul>
  		<li><label>bbb*</label><a>编辑</a></li>
  		<li><label>bbb</label><a>编辑</a><ul><li><label>ccc</label><a>编辑</a></li></ul></li>
  		</ul>
  	</li>
  	
  	<li><label>aaa</label><a>编辑</a></li>
  	<li><label>aaa</label><a>编辑</a></li>
  </ul>
  <input name="lr" id="lr" type="number" max="9999" min="0" step="0.01" value="1.1" />
  <a class="p0101" data-num-p="0101" href="">权限测试</a>
  <a class="p0101" data-num-p="0103" href="">权限测试2</a>
<input type="text" id="month_time" onkeyup="value=value.replace(/[^\a-\z\A-\Z0-9\u4E00-\u9FA5\@\.\。\，\“\”]/g,'')" value=""/>
  <!-- <img src="Download.do?fjid=124"> -->
    <form id="formid" method="post" enctype="multipart/form-data" action="http://www.baidu.com" onsubmit="if(confirm('确定好你所填写的正确，不然会发错!')) {checkForm()}else{false}" >
    	随便输：<ul><li>111<font class="red">*</font><input id="aaa" name="text" type="text"/><br></li></ul>
    	文件上传:<input name="file1" multiple type="file"/><br>
    	<input name="aa" type="checkbox" checked="checked">
		<table>
			<tr>
				<td>选择发送人<font class="red">*</font>
				</td>
				<td><input type="text" name="sendto_type[]" id="sendto_type1"
					value="1">按城市发送</td>
			</tr>

			<tr>
				<td>选择发送人2<font class="red">*</font>
				</td>
				<td><input type="text" name="sendto_type[]" id="sendto_type1"
					value="1">按城市发送</td>
					
			</tr>
			<tr><td>选择发送人3<font class="red">*</font>
				</td>
			<td><input class="Wdate" type="text" onClick="WdatePicker()"></td>
			</tr>
		</table>
		<input type="button" value="提交" class="btn2" onclick = "checkForm()" />
    </form>
    <a href="Download.do?fjid=100">文件下载</a>
    <div id="allmap" style="width:300px;height: 300px"></div>
  </body>
  <script type="text/javascript">
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
	    if(pass==true){document.getElementById("formid").submit();}
	} 
  function manageView(jsonstr,nowp){
  	var json=eval('(' + jsonstr + ')');
  	var list=$("[data-num-p]");
  	var nowPage=json[nowp];
  	list.each(function(){
  		if(nowPage[$(this).attr("data-num-p")]!=1)$(this).remove();
  	});
  }
  manageView("<%=power%>","01");
  $(document).ready(function(){
  	$("li").children("ul").hide();
  });
  $("label").click(function(){
  	if($(this).parent().children("ul").is(":hidden")){
  		$(this).parent().children("ul").show();
  		$(this).parent().children("ul").css("list-style-image","url('Image/forwordright.png')");
  		$(this).parent().css("list-style-image","url('Image/forwordbellow.png')");
  	}else{
  		$(this).parent().children("ul").hide();
  		$(this).parent().css("list-style-image","url('Image/forwordright.png')");
  	}
  });
  //document.getElementById("month_time").value=123;
  //alert(document.getElementById("month_time").value);
	window.onload = function() {
		// 百度地图API功能
		var i = 0, jd = 0, wd = 0;
		var map = new BMap.Map("allmap"); // 创建Map实例
		var point = new BMap.Point(118.028431, 36.812302);
		map.centerAndZoom(point, 13); // 初始化地图,设置中心点坐标和地图级别
		map.enableScrollWheelZoom(true); //开启鼠标滚轮缩放
		map.addControl(new BMap.NavigationControl()); //添加默认缩放平移控件
		map.addControl(new BMap.ScaleControl()); //添加比例尺

		//当点击地图时，显示标注
		map.addEventListener("click", showInfo);
		function showInfo(e) {
			if (i < 1) {
				//设置标注，并获取坐标
				var marker = new BMap.Marker(new BMap.Point(e.point.lng,
						e.point.lat)); // 创建标注    
				map.addOverlay(marker); // 将标注添加到地图中
				marker.enableDragging(); // 设置标注可拖动
				//标注显示在地图上就返回一个坐标
				jd = e.point.lng + "";
				wd = e.point.lat + "";
				document.getElementById("p1").innerHTML = e.point.lng;
				document.getElementById("p2").innerHTML = e.point.lat;
				//当拖动标注时获取坐标
				marker.addEventListener("dragend", function(e) {
					jd = e.point.lng + "";
					wd = e.point.lat + "";
					document.getElementById("p1").innerHTML = e.point.lng;
					document.getElementById("p2").innerHTML = e.point.lat;
				});
				i++;
			}
		}

		var btn = document.getElementById("save");
		//btn.onclick = function() {
		//	location.href = "content.jsp?jd=" + jd + "&wd=" + wd;
			//window.close();
			
		//};

	};
</script>
</html>
