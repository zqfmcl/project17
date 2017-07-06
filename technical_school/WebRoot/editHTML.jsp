<%@page import="java.net.URLEncoder"%>
<%@page import="javax.sql.rowset.CachedRowSet"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="school.connectDB.OperateDB"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>信息发布页面</title>
    <link rel="shortcut icon" href="image/icon.png">
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="ckeditor/ckeditor.js"></script>
	<script type="text/javascript" src="/technical_school/ckfinder/ckfinder.js"></script>
	<script type="text/javascript" src="laydate/laydate.js"></script>
	<script type="text/javascript" src="js/edit.js"></script>
	<link rel="stylesheet" href="<%=path%>/bootstrap/easyui.css" type="text/css"></link>
	<script type="text/javascript" src="<%=path%>/easyui/jquery-1.8.0.min.js"></script>
	<script type="text/javascript" src="<%=path%>/easyui/jquery.easyui.min.js"></script>
	<script>
	function Uploader(chunk,callBack){
	var addWin = $("<div style='overflow: hidden;'/>");
	var upladoer = $("<iframe/>");
	upladoer.attr({"src":"<%=path%>/uploader.jsp?chunk=" + chunk,
			width : "100%",
			height : "100%",
			frameborder : "0",
			scrolling : "no"
		});
		addWin.window({
			title : "上传文件",
			height : 350,
			width : 550,
			minimizable : false,
			modal : true,
			collapsible : false,
			maximizable : false,
			resizable : false,
			content : upladoer,
			onClose : function() {
				var fw = GetFrameWindow(upladoer[0]);
				var files = fw.files;
				$(this).window("destroy");
				callBack.call(this, files);
			},
			onOpen : function() {
				var target = $(this);
				setTimeout(function() {
					var fw = GetFrameWindow(upladoer[0]);
					fw.target = target;
				}, 100);
			}
		});
	}

	/**
	 * 根据iframe对象获取iframe的window对象
	 * @param frame
	 * @returns {Boolean}
	 */
	function GetFrameWindow(frame) {
		return frame && typeof (frame) == "object" && frame.tagName == "IFRAME"
				&& frame.contentWindow;
	}

	function makerUpload(chunk) {
		Uploader(chunk, function(files) {
			if (files && files.length > 0) {
				if(document.getElementById("res_no").value==""){
					document.getElementById("res_no").value=files.join(",");	
					$("#res").text(document.getElementById("res_no").value);								
				}
				else{
					document.getElementById("res_no").value=files.join(",")+","+document.getElementById("res_no").value;	
					$("#res").text(document.getElementById("res_no").value);
				}				
				
			}
		});
	} 
	</script>
 	<%
 						
 			session.setAttribute("UsedState", 0);
			request.setCharacterEncoding("UTF-8");
	 	  	String editor=new String(request.getParameter("P_1").getBytes("ISO-8859-1"),"UTF-8");//编辑者
	 	  	String orgnazation=new String(request.getParameter("P_2").getBytes("ISO-8859-1"),"UTF-8");//用户隶属组织
	 	  	String tablename =new String(request.getParameter("P_3").getBytes("ISO-8859-1"),"UTF-8");//栏目表名
	 	  	String columnName =new String(request.getParameter("P_4").getBytes("ISO-8859-1"),"UTF-8");//栏目名称
	 	  	int columnID =Integer.parseInt(request.getParameter("P_5"));//栏目ID
	 	  	
	 	  	OperateDB o=new OperateDB();//建立数据库连接对象
	 	  	CachedRowSet rs=o.select_secondColumn(columnID);//执行数据库方法，取出二级栏目名称。
	 	  	ArrayList<String> arrayList=new ArrayList<String>();
	 	  	while(rs.next()){
	 	  		arrayList.add(rs.getString("LMMC"));
	 	  	}
	 	    Iterator<String> i=arrayList.iterator();
	 	  	String temp;
  	 	%>
  </head>
 
 <body>
	  <div style="width:1000px;margin:auto;border:2px solid #a1a1a1;padding:10px 40px; background:#dddddd;border-radius:25px;-moz-border-radius:25px;">
	  		<h1 style="text-align:center"><%=columnName %></h1>	  		
			<form action="servlet/NRYtransform?tablename=<%=tablename%>&tableID=<%=columnID%>" method="post" enctype="multipart/form-data" onsubmit="return check()" >
			  <table style="border:2px solid #a1a1a1;text-align:right;">
			    <tr><td>分类:</td><td  colspan="3" style="text-align:left;"><select  name="classify">
			    <% while(i.hasNext())   {temp=i.next();%>
			    <%out.println("<option value=\""); %>
			    <%=temp%>
			    <% out.println("\">"); %>
			    <%=temp%>
			    <%out.println("</option>");%>
	   			 <%} 
	   			 rs.close(); 
  				 o.ReleaseConn();
	   			 %></select></td></tr>
			    <tr><td>作者:</td><td colspan="3" style="text-align:left;"><input type="text" name="editor" value="<%=editor%>" readonly="readonly"></td></tr>
			    <tr><td>组织机构:</td><td colspan="3" style="text-align:left;"><input type="text"name="orgnazation" value="<%=orgnazation%>" readonly="readonly"></td></tr>
			    <tr><td>发布时间:</td><td colspan="3" style="text-align:left;"><input type="text" name="date" id="time" value="" onclick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss'});int=window.clearInterval(int)"></td></tr>
			    <tr><td>建设动态:</td><td colspan="3" style="text-align:left;"><label><input name="todynamic" type="radio" value="0" />是</label><label><input name="todynamic" type="radio" value="1"  checked />否 </label> </td></tr>
			    <tr><td >滚动栏:</td><td  colspan="3" style="text-align:left;"><label><input name="toroll" type="radio" value="0" />是</label><label><input name="toroll" type="radio" value="1"  checked />否 </label> </td></tr>
			  <!--<tr><td colspan="3">上传图片到轮播栏:</td><td><input name="attachment_image" type="file"/></td></tr> -->  
			    <tr><td>文章标题:</td><td colspan="3" style="text-align:left;"><input type="text" name="tittle" id="tittle" size="45"></td></tr>
	            <tr><td >附件管理:</td><td colspan="3" style="text-align:left;"><a class="easyui-linkbutton" href="javascript:makerUpload(false)" style="font-size:10px;float:left">点击文件上传</a><input id="res_no" type="text" value="" name="res_no" readonly="readonly" style="display:none"><div id="res" style="font-size:7px;float:left"></div></td></tr>
			    <tr><td colspan="4"><textarea name="ckeditorRange" id="ckeditorRange"></textarea></td></tr>			
				<tr><td><input type="submit" value="发表" style="margin-left:180px"></td><td colspan="3" style="text-align:left;"><input type="reset" value="重置"></td></tr>
			  </table>	  
			</form>			
	  </div>
  <script type="text/javascript">CKEDITOR.replace('ckeditorRange');</script>
  </body>
  
</html>
