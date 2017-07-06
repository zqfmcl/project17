<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@page import="com.lzcb.bigitem.utils.DbHelper"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<base href="<%=basePath%>">
	<title>临淄区重点项目信息管理平台</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" type="text/css" href="CSS/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="CSS/index.css">
	<script type="text/javascript" src="https://api.html5media.info/1.1.8/html5media.min.js">		
	</script>
	<script type="text/javascript" src="JS/jquery-3.2.1.min.js" charset="UTF-8"></script>
	<script type="text/javascript" src="JS/bootstrap.min.js"></script>
	<script type="text/javascript" src="fusioncharts/fusioncharts.js"></script>
    <script type="text/javascript" src="fusioncharts/themes/fusioncharts.theme.fint.js"></script>
	<script type="text/javascript" src="JS/index.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
		//$('.tab-content .item:first').addClass('active');
		//$('#t_zcjd .item:first').addClass('active');		
		if($(window).width()>=1200){
		$('body').css("width","100%");
		}
		else{
		$('body').css("width","1200");
		}}
		);
	</script>

</head>
<body>
<div id="top">
    <div class="head">    	
    	<div class="logo">
    		<img src="Image/logo.gif">
    	</div>
    	<div class="login">
    		您好，请<a href="http://218.56.106.137:8080/Bigitem">登录</a>
    	</div>
    </div>	
</div>



	<div id="content">
	<div class="news">
			<ul class="nav nav-tabs" role="tablist" id="myTab">
			<li role="presentation" class="active">
					<a href="#home" role="tab" data-toggle="tab">
				<%Map m=DbHelper.queryARow("select LMMC from T_WZLM where ID=1");
  	        	out.println(m.get("LMMC"));
				%>
					</a>
					<label id="s1" style="display: block;">
					<a href="list.jsp?p=1&n=1">
					更多>>
					</a>
					</label>
				</li>
				
				<li role="presentation">
					<a href="#profile" role="tab" data-toggle="tab">
					<%Map m1=DbHelper.queryARow("select LMMC from T_WZLM where ID=2");
  	        		out.println(m1.get("LMMC"));
					%>
					</a>
					<label id="s2">
					<a href="list.jsp?p=1&n=2">
					更多>>
					</a>
					</label>
				</li>
			</ul>

			<div class="tab-content"
				style="width:865px;height: 312px; background-color: #ffffff">
				<div role="tabpanel" class="tab-pane active" id="home"
					style="position: relative;">
					<div class="news_left">
						<div class="news_left_pic">
							<div id="carousel-example-generic" class="carousel slide"
								data-ride="carousel">
								<!-- Indicators -->
								<ol class="carousel-indicators">
									<li data-target="#carousel-example-generic" data-slide-to="0"
										class="active"></li>
									<li data-target="#carousel-example-generic" data-slide-to="1"></li>
									<li data-target="#carousel-example-generic" data-slide-to="2"></li>
								</ol>

								<!-- Wrapper for slides -->
								<!-- item1 -->
								<div class="carousel-inner" role="listbox">
									<%
										List list = DbHelper
												.queryForTable("select rownum,t.* from (select y.*,fj.id fjid from t_nry y left join fujian fj on y.id=fj.ssjldm and fj.ssbm='t_nry' where sfxs=1 and sslm=1 and sftj=1 order by fbsj desc) t where rownum<=3");

										for (int i = 0; i < list.size(); i++) {
											Map rec = (Map) list.get(i);
									%>
									<div class="item<%=(i==0?" active":"")%>">
										<a href="show1.jsp?p=<%out.println(rec.get("ID"));%>&n=1"	style="color:#000000" target="_blank"> 
											<img src="Download.do?fjid=<%=rec.get("FJID") %>"
											style="width: 484px;height: 252px" > </a>
										<div class="news_left_text">
											
											<a href="show1.jsp?p=<%out.println(rec.get("ID"));%>&n=1"	style="color:#000000" target="_blank"> 
											<%	out.println(rec.get("BT")); %> </a>	
										</div>
									</div>
									<%
										}
									%>
								</div>
							</div>
						</div>
					</div>
					<div class="news_right">
						<ul>
							<%
								List list1 = DbHelper
										.queryForTable("select rownum,t.* from (select y.* from t_nry y where sfxs=1 and sslm=1 order by fbsj desc) t where rownum<=10");

								for (int i = 0; i < list1.size(); i++) {
									Map rec1 = (Map) list1.get(i);
							%>

							<li><a
								href="show1.jsp?p=<%out.println(rec1.get("ID"));%>&n=1"
								target="_blank"> <%
 	out.println(rec1.get("BT"));
 %> </a> <label>
									<%
										out.println(rec1.get("FBSJ"));
									%>
							</label></li>
							<%
								}
							%>
						</ul>
					</div>
				</div>
				<div role="tabpanel" class="tab-pane" id="profile">
					<div style="width: 865px; height: 300px;">
						<div class="news_left">
							<div class="news_left_pic">
								<div id="carousel-example-generic1" class="carousel slide"
									data-ride="carousel">
									<!-- Indicators -->
									<ol class="carousel-indicators">
										<li data-target="#carousel-example-generic1" data-slide-to="0"
											class="active"></li>
										<li data-target="#carousel-example-generic1" data-slide-to="1"></li>
										<li data-target="#carousel-example-generic1" data-slide-to="2"></li>
									</ol>

									<!-- Wrapper for slides -->
									<!-- item2 -->
									<div class="carousel-inner" role="listbox" id="t_zcjd">
										<%
											List list2 = DbHelper
													.queryForTable("select rownum,t.* from (select y.*,fj.id fjid from t_nry y left join fujian fj on y.id=fj.ssjldm and fj.ssbm='t_nry' where sfxs=1 and sslm=2 and sftj=1 order by fbsj desc) t where rownum<=3");

											for (int i = 0; i < list2.size(); i++) {
											Map rec2 = (Map) list2.get(i);
										%>
										<div class="item<%=(i==0?" active":"")%>">
											<a href="show1.jsp?p=<%out.println(rec2.get("ID"));%>&n=2"	style="color:#000000" target="_blank"> 
											<img src="Download.do?fjid=<%=rec2.get("FJID") %>"
											style="width: 484px;height: 252px" > </a>
											
											<div class="news_left_text">
												<a href="show1.jsp?p=<%out.println(rec2.get("ID"));%>&n=2"	style="color:#000000" target="_blank"> 
											<%	out.println(rec2.get("BT")); %> </a>	

											</div>
										</div>
										<%
											}
										%>


									</div>
								</div>
							</div>
						</div>
						<div class="news_right">
							<ul>
								<%
									List list3 = DbHelper
											.queryForTable("select rownum,t.* from (select y.* from t_nry y where sfxs=1 and sslm=2 order by fbsj desc) t where rownum<=10");

									for (int i = 0; i < list3.size(); i++) {
										Map rec3 = (Map) list3.get(i);
								%>

								<li><a
									href="show1.jsp?p=<%out.println(rec3.get("ID"));%>&n=2"
									target="_blank"> <%
 	out.println(rec3.get("BT"));
 %> </a> <label>
										<%
											out.println(rec3.get("FBSJ"));
										%>
								</label></li>
								<% } %>

							</ul>
						</div>
					</div>
				</div>
			</div>
			<script>
				$('#myTab li>a').mousemove(function(e) {
					e.preventDefault()
					$(this).tab('show');
					$('#s1').hide();
					$('#s2').hide();
					$(this).next().show();
				})
			</script>
    </div>
    <div class="videos">
      <video width="500" height="370" controls> 
       <!-- Firefox --> 
       <!-- <source src="mv.ogg" type="video/ogg" />   -->
       <!-- Safari/Chrome-->   
       <source src="Image/1.mp4" type="video/mp4" />  
       <!-- 如果浏览器不支持video标签，则使用flash -->  
       <embed src="http://blip.tv/play/gcMVgcmBAgA%2Em4v" type="application/x-shockwave-flash" allowscriptaccess="always" allowfullscreen="true">       	
       </embed>  
      </video>  
    </div>
    <div class="city_detail">
    	<div class="nav">
    		<div class="io"></div>
    		<div class="t">市重大、区重点项目总体情况</div>
    	</div>
    	<div class="detail">   		
    	 <div class="tt">    	 
    	 <label>
    	 <%Map m2=DbHelper.queryAClob("select * from T_NRY where SFXS=1 AND SSLM=3 AND id=13 order BY FBSJ","ZW");
    	 if(m2.get("ZW")==null){}else{
    	 out.println(m2.get("ZW"));}%>
    	  
    	 </label>
    	 	<!-- <div id="look_detail">
    	 		<div style="float: left;margin-top: 7px;
    	 		margin-left: 7px;"><img src="Image/ll.gif">
    	 		</div>
    	 		<div style="float: left;margin-top: 20px;
    	 		margin-left: 12px;"><a href="http://218.56.106.137:8080/Bigitem">一键查看重大项目</a>
    	 		</div>
    	 	</div> -->
    	 </div>
    	 <div class="char1" id="chars1"></div>
    	 <div class="char2" id="chars2"></div>
    	</div>
    </div>
    <div class="country_detail">
	   <div class="nav">
	    		<div class="io"></div>
	    		<div class="t">各乡镇街道项目情况</div>
	   </div>
	   <div class="detail" id="chars3"></div>
	</div>
</div>



<div class="footer">
	
</div>
</body>
</html>