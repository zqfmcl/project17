<%@page import="school.javabean.Tittle"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="javax.sql.rowset.CachedRowSet"%>
<%@include file="lib/index_tp.jsp" %>
<%@include file="header.jsp" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="school.Dateout.Dateout"%>
<%@page import="school.convert.Convert"%>
<%@page import="school.connectDB.OperateDB"%>


<div id="pic"><!--轮播图片-->
	<div id="image">
	   <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
        <ol class="carousel-indicators" style="left: 560px;top:250px;">
          <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
          <li data-target="#carousel-example-generic" data-slide-to="1" class=""></li>
         </ol>
	    <div class="carousel-inner" role="listbox">
	     <div class="item active">
	      <img src="image/s1.jpg" style="width: 1200px; height: 290px;">
	     </div>
	     <div class="item" style="width: 1200px; height: 290px;">
	      <img src="image/s2.jpg" style="width: 1200px; height: 290px;">
	     </div>
	    </div>
       </div>
    </div>
</div>
<div class="contain" style="margin-top: -40px;z-index: 100; height: 1900px;">
	<div id="content_left">
  	<div class="u_video"> 
	<!-- <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,19,0" width="325" height="222">
    <param name="movie" value="image/Flvplayer.swf">
    <param name="quality" value="high">
    <param name="allowFullScreen" value="true">
    <param name="FlashVars" value="vcastr_file=video.flv&amp;LogoText=淄博工业学校&amp;BufferTime=3">
    <embed src="image/Flvplayer.swf" allowfullscreen="true" flashvars="vcastr_file=video.flv&amp;LogoText=淄博工业学校" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="325" height="222">
    </object> -->	
	</div>
		<div class="u_list1"><!--建设动态-->
			<div class="u_top">
				<div style="width: auto;float: left;margin-left: 10px;">
					<img src="image/flag2.png">
				</div>
				<div id="text2">
				<%
					OperateDB o=new OperateDB();
							CachedRowSet rs=null;
							String []menu_name= o.select_menu_name(T_JSDT);   						 
							out.println(menu_name[0]);
				%>
				</div>
				<div id="more"><a  href="list.jsp?n=JSDT_VIEW&m=<%=T_JSDT%>">更多</a></div>
			</div>
			<div class="u_content">
				<ul>
				<%	
					rs=o.select_data("JSDT_VIEW",5);
					while(rs.next()){													
				 %>		
				<li>				
				<a href="content.jsp?p=<%=rs.getInt("ID")%>&n=<%=rs.getString("TNAME")%>&m=<%=rs.getInt("TID")%>"  style="width: 450px;display: block;float: left;white-space:nowrap;overflow:hidden;text-overflow:ellipsis; display:block;">
				<%out.println(rs.getString("BT")); %>
				</a>
				<label style="float: left; width: 80px;height: 28px; text-align: right;cursor: default;"><%out.println(Dateout.date(rs.getDate("FBSJ").toString()));%></label>
				</li>
				<%
				}
				%>
				</ul>
			</div>
		</div>
		<div class="u_list2"><!--政策信息-->
				<div class="u_top">
				<div style="width: auto;float: left;margin-left: 10px;">
					<img src="image/flag2.png">
				</div>
				<div id="text2">
				<%
					menu_name=o.select_menu_name(T_ZCXX);
					out.println(menu_name[0]);
				 %>
				</div>
				<div id="more"><a href="list.jsp?n=Entity_ZCXX&m=<%=T_ZCXX%>">更多</a></div>
			    </div>
			    <div class="u_content">
				<ul style="width: 90%">
				<%
					rs=o.select_data("Entity_ZCXX",8);
					while(rs.next()){
				 %>
			
				<li style="width: 100%;">				
				<a href="content.jsp?p=<%=rs.getInt("ID")%>&n=Entity_ZCXX&m=<%=T_ZCXX%>"   style="width: 300px;display: block;float:left;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;">
				<%out.println(rs.getString("BT")); %>
			
				</a>
				<!--<label style="float: left; width: 80px;height: 28px; text-align: right;cursor: default;"><%//out.println(Dateout.date(rs.getDate("FBSJ").toString()));%></label>  -->
				</li>
				<%} %>
				</ul>
			</div>
		</div>
		<div class="u_list3"><!--组织机构-->
				<div class="u_top">
				<div style="width: auto;float: left;margin-left: 10px;">
					<img src="image/flag2.png">
				</div>
				<div id="text2">
					<%
						menu_name=o.select_menu_name(T_ZZJG);						
						out.println(menu_name[0]);
					 %>
				
				</div>
				<div id="more"><a href="list.jsp?n=Entity_ZZJGXW&m=<%=T_ZZJG%>">更多</a></div>
			    </div>
			    	<div class="u_content">
				<ul>
				<%
					rs=o.select_data("Entity_ZZJGXW",8);
					while(rs.next()){					 
				 %>
			
				
				<li>				
	            <a href="content.jsp?p=<%=rs.getInt("ID")%>&n=Entity_ZZJGXW&m=<%=T_ZZJG%>"   style="width: 450px;display: block;float: left;white-space:nowrap;overflow:hidden;text-overflow:ellipsis; display:block;">
				<%out.println(rs.getString("BT").toString()); %>
				</a>
				<label style="float: left; width: 80px;height: 19px; text-align: right;cursor: default;"><%out.println(Dateout.date(rs.getDate("FBSJ").toString()));%></label>
				</li>
				<% 
				}
				%>
				</ul>
			</div>

		</div>
	</div>
	<div id="content_right">
		<div class="r_list1"><!--通知公告-->
				<div class="u_top">
				<div style="width: auto;float: left;margin-left: 10px;">
					<img src="image/flag2.png">
				</div>
				<div id="text2">
				<%
					menu_name=o.select_menu_name(T_TZGG);					
					out.println(menu_name[0]);
				 %>
				
				</div>
				<div id="more"><a href="list.jsp?n=Entity_TZGG&m=<%=T_TZGG%>">更多</a></div>
			    </div>
			    	    <div class="u_content">
				<ul style="width: 90%">
				<%
					rs=o.select_data("Entity_TZGG",6);
					while(rs.next()){
					 
				 %>
				<li style="width: 100%;">				
				<a href="content.jsp?p=<%=rs.getInt("ID")%>&n=Entity_TZGG&m=<%=T_TZGG%>"   style="width: 270px;display: block;float: left;white-space:nowrap;overflow:hidden;text-overflow:ellipsis; display:block;">
				<%out.println(rs.getString("BT")); %>
				</a>
				</li>
				<%} %>
				</ul>
			</div>

		</div>
		
		
		<%			
			float schedule=o.select_JinDu();	
			float remainder=1-schedule;
			java.text.NumberFormat percentFormat =java.text.NumberFormat.getPercentInstance(); percentFormat.setMaximumFractionDigits(2); //最大小数位数 
			percentFormat.setMaximumIntegerDigits(3);//最大整数位数 
			percentFormat.setMinimumFractionDigits(1); //最小小数位数 
			percentFormat.setMinimumIntegerDigits(1);//最小整数位数 
		 	String scheduletemp=percentFormat.format(schedule);//自动转换成百分比显示.. 
		 	String remaindertemp=percentFormat.format(remainder);
			
		 %>
		<input id="schedule" style="display:none" value="<%=schedule%>">
		<input id="remainder" style="display:none" value="<%=remainder%>">
		<div style="clear:both;width:280px;height:158px; border: 1px solid #d5e1ef;margin-top:14px">
		<div class="u_top">
				<div style="width: auto;float: left;margin-left: 10px;">
					<img src="image/flag2.png">
				</div>
				<div id="text2">
				项目任务完成进度		
				</div>
			    </div>
		<canvas id="canvas" height="120" width="150"></canvas>
		<div style="width:120px;height:80px; float:right;margin-right:px;margin-top:15px">
			<div style="margin-top:15px">
				<div style="width:10px;height:10px; background:#F38630;float: left;margin-top:4px"></div>
				<div style="font-size:10px;float:left;margin-left:5px">已完成进度:</div>
				<div style="font-size:10px;float:right;margin-right:8px"><%=scheduletemp%></div>	
			</div>
			<div style="margin-top:45px">
				<div style="width:10px;height:10px; background:#E0E4CC;float: left;margin-top:4px"></div>
				<div style="font-size:10px;float:left;margin-left:5px">未完成进度:</div>
				<div style="font-size:10px;float:right;margin-right:8px"><%=remaindertemp%></div>	
			</div>
			
		</div>
		
		</div><!-- 任务完成进度表 -->
		<script>
			var schedule=document.getElementById('schedule').value*100;	
			var	remainder=document.getElementById('remainder').value*100;
			
			var pieData = [
					{
						value : 50,
						color : "#F38630"
					},
					{
						value : 50,
						color : "#E0E4CC"
					}
					
				];
			pieData[0]['value']=schedule;
			pieData[1]['value']=remainder;
					
			var myPie = new Chart(document.getElementById("canvas").getContext("2d")).Pie(pieData);					
	</script>
		<div class="r_list2">
			<a href="http://www.zbgyxx.net/ZiBoGongYe/Detail.aspx?id=e26dd392-a4ce-45e4-8834-43640d989fa4&pcode=20&targetcode=200">
				<img src="image/xxjj.gif" style="width: 280px; height: 112px;">
			</a>
		</div><!--学校概况-->
		<!--<div class="r_list3" style="width: 280px; height: 158px;">
			<a href="http://222.175.251.218:100/sfx/yanshou/zhuanlan.aspx?lei=all">
				<img src="image/cgzs.gif">
			</a>
		</div><!--建设成果专栏-->
	</div>
	<div id="scroll">
	    <ul>
	    	<!-- <li>
	    		<img src="image/1.gif" style="width: 243px; height: 163px;">
	    	</li>
	    	<li>
	    		<img src="image/2.gif" style="width: 243px; height: 163px;">
	    	</li>
	    	<li>
	    		<img src="image/3.gif" style="width: 243px; height: 163px;">
	    	</li>
	    	<li>
	    		<img src="image/4.jpg" style="width: 243px; height: 163px;">
	    	</li>
	    	
	    	   -->
	    	 	 
    		<%rs=o.select_data_to_roll("Entity_GDLGL",10);
    		while(rs.next()){
    		%>
    			
    		<li>
    		<a   href="content.jsp?p=<%=rs.getInt("NRYID")%>&n=<%=rs.getString("BM")%>&m=<%=rs.getString("BID")%>">
    		 <img src="<%=request.getContextPath()+"/uploads/images/"+rs.getString("GDLTPFJ")%>" style="width: 243px; height: 163px;"/>
    		</a>
    		</li>
			
    		
    	 <%}%>
	    </ul>
	</div>
	<div id="content_bt_left">
		<div class="bt_list1"><!--强化综合素养教育-->
				<div class="u_top">
				<div style="width: auto;float: left;margin-left: 10px;">
					<img src="image/flag2.png">
				</div>
				<div id="text2">
				
				<%
					menu_name=o.select_menu_name(T_QHZHSYJY);
				
					out.println(menu_name[0]);
				 %>
				</div>
				<div id="more"><a href="list.jsp?n=Entity_QHZHSYJY&m=<%=T_QHZHSYJY%>">更多</a></div>
			    </div>
			    <div class="u_content">
				<ul style="width: 100%">
				
				<%				   
				  Tittle tittle=o.select_data_column_top_image("Entity_QHZHSYJY");
				  if(tittle.getID()==-1){
				  	rs=o.select_data("Entity_QHZHSYJY",5);
				  
				  }
				  else if(tittle.getID()!=-1){
				  	rs.close();
				  	rs=o.select_data("Entity_QHZHSYJY",5,tittle.getID());				  
				  }
				    
				    if(tittle.getTittle()!=null){
				    //System.out.println(tittle.getImage_src());
				       %>
				     	<li style="width:100%;margin-bottom:8px">
				     	<div style="width:200px;float:left;border:10px">
				     	<a href="content.jsp?p=<%=tittle.getID()%>&n=Entity_QHZHSYJY&m=<%=T_QHZHSYJY%>"><img alt="" src="<%="uploads/images/"+tittle.getImage_src()%>" style="width: 200px; height: 130px;"></a>
				     	</div>
				     	<div style="width:200px;float:left;margin-left:10px;padding-top:10px">
					     	<div style="height:30px;width:200px;white-space:nowrap;overflow:hidden;text-overflow:ellipsis; display:block;"><a href="content.jsp?p=<%=tittle.getID()%>&n=Entity_QHZHSYJY&m=<%=T_QHZHSYJY%>" ><%=tittle.getTittle()%></a></div>
					     	<div style="height:90px;width:200px;overflow:hidden;font-size:12px ">摘要 : <%=tittle.getSummary().substring(3,tittle.getSummary().length()-3) %></div>
				     	</div>
				     	</li>
				       
				       
				       <%}
				       else{%>
			       		<li>
				       		<div style="width:200px;float:left;border:10px">
					     	<img alt="" src="image/default.jpg" style="width: 200px; height: 130px;">
					     	</div>
					     	<div style="width:200px;float:left;margin-left:10px;padding-top:10px">
						     	<div><a style="text-decoration:none;">无标题</a></div>
						     	<div style="font-size:12px">摘要: </div>
					     	</div>
			       		</li>		     				    
					<% } while(rs.next()){%>			
				<li style="width: 100%;">				
				<a href="content.jsp?p=<%=rs.getInt("ID")%>&n=Entity_QHZHSYJY&m=<%=T_QHZHSYJY%>"   style="width: 430px;display: block;float: left;white-space:nowrap;overflow:hidden;text-overflow:ellipsis; display:block;">
				<%out.println(rs.getString("BT")); %>
				</a>
				</li>
				<%} %>
				</ul>
			   </div>
		</div>
		<div class="bt_list1" style="margin-left: 15px;"><!--深化教学改革-->
			<div class="u_top">
				<div style="width: auto;float: left;margin-left: 10px;">
					<img src="image/flag2.png">
				</div>
				<div id="text2">
				<%
					menu_name=o.select_menu_name(T_SHJXGG);
					out.println(menu_name[0]);
				 %>
			
				</div>
				<div id="more"><a href="list.jsp?n=Entity_SHJXGG&m=<%=T_SHJXGG%>">更多</a></div>
			    </div>
			    <div class="u_content">
			    
			    	<ul style="width: 100%">
				
				<%
					tittle=o.select_data_column_top_image("Entity_SHJXGG");
				
				  if(tittle.getID()==-1){
				  	rs=o.select_data("Entity_SHJXGG",5);
				  
				  }
				  else if(tittle.getID()!=-1){
				  	rs.close();
				  	rs=o.select_data("Entity_SHJXGG",5,tittle.getID());				  
				  }
				    if(tittle.getTittle()!=null){
				    //System.out.println(tittle.getImage_src());
				       %>
				     	<li style="width:100%;margin-bottom:8px">
				     	<div style="width:200px;float:left;border:10px">
				     	<a href="content.jsp?p=<%=tittle.getID()%>&n=Entity_SHJXGG&m=<%=T_SHJXGG%>"><img alt="" src="<%="uploads/images/"+tittle.getImage_src()%>" style="width: 200px; height: 130px;"></a>
				     	</div>
				     	<div style="width:200px;float:left;margin-left:10px;padding-top:10px">
					     	<div style="height:30px;width:200px;white-space:nowrap;overflow:hidden;text-overflow:ellipsis; display:block;"><a href="content.jsp?p=<%=tittle.getID()%>&n=Entity_SHJXGG&m=<%=T_SHJXGG%>" ><%=tittle.getTittle()%></a></div>
					     	<div style="height:90px;width:200px;overflow:hidden;font-size:12px ">摘要 : <%=tittle.getSummary().substring(3,tittle.getSummary().length()-3) %></div>
				     	</div>
				     	</li>
				       
				       
				       <%}
				       else{%>
			       		<li>
				       		<div style="width:200px;float:left;border:10px">
					     	<img alt="" src="image/default.jpg" style="width: 200px; height: 130px;">
					     	</div>
					     	<div style="width:200px;float:left;margin-left:10px;padding-top:10px">
						     	<div><a style="text-decoration:none;">无标题</a></div>
						     	<div style="font-size:12px">摘要: </div>
					     	</div>
			       		</li>		     				    
					<% } while(rs.next()){%>			
				<li style="width: 100%;">				
				<a href="content.jsp?p=<%=rs.getInt("ID")%>&n=Entity_SHJXGG&m=<%=T_SHJXGG%>"   style="width: 430px;display: block;float: left;white-space:nowrap;overflow:hidden;text-overflow:ellipsis; display:block;">
				<%out.println(rs.getString("BT")); %>
				</a>
				</li>
				<%} %>
				</ul>
			    </div>
		</div>
		<div class="bt_list1" style="margin-top: 12px"><!--促进产教深度融合-->
		       <div class="u_top">
				<div style="width: auto;float: left;margin-left: 10px;">
					<img src="image/flag2.png">
				</div>
				<div id="text2">
				
				<%
					menu_name=o.select_menu_name(T_CJCJSDRH);
	
					out.println(menu_name[0]);
				 %>
				 
				</div>
				<div id="more"><a href="list.jsp?n=Entity_CJCJSDRH&m=<%=T_CJCJSDRH%>">更多</a></div>
			    </div>
			    <div class="u_content">
			    
			    <ul style="width: 100%">
				
				<%
				    tittle=o.select_data_column_top_image("Entity_CJCJSDRH");
					if(tittle.getID()==-1){
					  	rs=o.select_data("Entity_CJCJSDRH",5);
					}
					else if(tittle.getID()!=-1){
					  	rs.close();
					  	rs=o.select_data("Entity_CJCJSDRH",5,tittle.getID());				  
					}
				    
				    if(tittle.getTittle()!=null){
				    //System.out.println(tittle.getImage_src());
				       %>
				     	<li style="width:100%;margin-bottom:8px">
				     	<div style="width:200px;float:left;border:10px">
				     	<a href="content.jsp?p=<%=tittle.getID()%>&n=Entity_CJCJSDRH&m=<%=T_CJCJSDRH%>"><img alt="" src="<%="uploads/images/"+tittle.getImage_src()%>" style="width: 200px; height: 130px;"></a>
				     	</div>
				     	<div style="width:200px;float:left;margin-left:10px;padding-top:10px">
					     	<div style="height:30px;width:200px;white-space:nowrap;overflow:hidden;text-overflow:ellipsis; display:block;"><a href="content.jsp?p=<%=tittle.getID()%>&n=Entity_CJCJSDRH&m=<%=T_CJCJSDRH%>" ><%=tittle.getTittle()%></a></div>
					     	<div style="height:90px;width:200px;overflow:hidden;font-size:12px ">摘要 : <%=tittle.getSummary().substring(3,tittle.getSummary().length()-3) %></div>
				     	</div>
				     	</li>
				       
				       
				       <%}
				       else{%>
			       		<li>
				       		<div style="width:200px;float:left;border:10px">
					     	<img alt="" src="image/default.jpg" style="width: 200px; height: 130px;">
					     	</div>
					     	<div style="width:200px;float:left;margin-left:10px;padding-top:10px">
						     	<div><a style="text-decoration:none;">无标题</a></div>
						     	<div  style="font-size:12px">摘要: </div>
					     	</div>
			       		</li>		     				    
					<% } while(rs.next()){%>			
				<li style="width: 100%;">				
				<a href="content.jsp?p=<%=rs.getInt("ID")%>&n=Entity_CJCJSDRH&m=<%=T_CJCJSDRH%>"   style="width: 430px;display: block;float: left;white-space:nowrap;overflow:hidden;text-overflow:ellipsis; display:block;">
				<%out.println(rs.getString("BT")); %>
				</a>
				</li>
				<%} %>
				</ul>

			    </div>
		</div>
		<div class="bt_list1" style="margin-left: 15px;margin-top: 12px"><!--提升师资队伍水平-->
				<div class="u_top">
				<div style="width: auto;float: left;margin-left: 10px;">
					<img src="image/flag2.png">
				</div>
				<div id="text2">
				<%
					menu_name=o.select_menu_name(T_TSSZDWSP);
					out.println(menu_name[0]);
				 %>
				
				</div>
				<div id="more"><a href="list.jsp?n=Entity_TSSZDWSP&m=<%=T_TSSZDWSP%>">更多</a></div>
			    </div>
			    <div class="u_content">
			    
			    <ul style="width: 100%">
				
				<%
				
				    tittle=o.select_data_column_top_image("Entity_TSSZDWSP");
					if(tittle.getID()==-1){
					  	rs=o.select_data("Entity_TSSZDWSP",5);
					}
					else if(tittle.getID()!=-1){
					  	rs.close();
					  	rs=o.select_data("Entity_TSSZDWSP",5,tittle.getID());				  
					}
				
				
				    if(tittle.getTittle()!=null){
				    //System.out.println(tittle.getImage_src());
				       %>
				     	<li style="width:100%;margin-bottom:8px">
				     	<div style="width:200px;float:left;border:10px">
				     	<a href="content.jsp?p=<%=tittle.getID()%>&n=Entity_TSSZDWSP&m=<%=T_TSSZDWSP%>"><img alt="" src="<%="uploads/images/"+tittle.getImage_src()%>" style="width: 200px; height: 130px;"></a>
				     	</div>
				     	<div style="width:200px;float:left;margin-left:10px;padding-top:10px">
					     	<div style="height:30px;width:200px;white-space:nowrap;overflow:hidden;text-overflow:ellipsis; display:block;" ><a href="content.jsp?p=<%=tittle.getID()%>&n=Entity_TSSZDWSP&m=<%=T_TSSZDWSP%>" ><%=tittle.getTittle()%></a></div>
					     	<div style="height:90px;width:200px;overflow:hidden;font-size:12px ">摘要 : <%=tittle.getSummary().substring(3,tittle.getSummary().length()-3) %></div>
				     	</div>
				     	</li>
				       
				       
				       <%}
				       else{%>
			       		<li>
				       		<div style="width:200px;float:left;border:10px">
					     	<img alt="" src="image/default.jpg" style="width: 200px; height: 130px;">
					     	</div>
					     	<div style="width:200px;float:left;margin-left:10px;padding-top:10px">
						     	<div><a style="text-decoration:none;">无标题</a></div>
						     	<div  style="font-size:12px">摘要: </div>
					     	</div>
			       		</li>		     				    
					<% } while(rs.next()){%>			
				<li style="width: 100%;">				
				<a href="content.jsp?p=<%=rs.getInt("ID")%>&n=Entity_TSSZDWSP&m=<%=T_TSSZDWSP%>"   style="width: 430px;display: block;float: left;white-space:nowrap;overflow:hidden;text-overflow:ellipsis; display:block;">
				<%out.println(rs.getString("BT")); %>
				</a>
				</li>
				<%} %>
				</ul>	
			    </div>
		</div>
		<div class="bt_list1" style="margin-top: 12px"><!--推进信息化建设-->
				<div class="u_top">
				<div style="width: auto;float: left;margin-left: 10px;">
					<img src="image/flag2.png">
				</div>
				<div id="text2">
				<%
					menu_name=o.select_menu_name(T_TTXXHJS);
					out.println(menu_name[0]);
				 %>
			
				</div>
				<div id="more"><a href="list.jsp?n=Entity_TJXXHJS&m=<%=T_TTXXHJS%>">更多</a></div>
				
			    </div>
			    <div class="u_content">
			    
			       	<ul style="width: 100%">
				
				<%
					tittle=o.select_data_column_top_image("Entity_TJXXHJS");
					if(tittle.getID()==-1){
					  	rs=o.select_data("Entity_TJXXHJS",5);
					}
					else if(tittle.getID()!=-1){
					  	rs.close();
					  	rs=o.select_data("Entity_TJXXHJS",5,tittle.getID());				  
					}
					
				    if(tittle.getTittle()!=null){
				    //System.out.println(tittle.getImage_src());
				       %>
				     	<li style="width:100%;margin-bottom:8px">
				     	<div style="width:200px;float:left;border:10px">
				     	<a href="content.jsp?p=<%=tittle.getID()%>&n=Entity_TJXXHJS&m=<%=T_TTXXHJS%>"><img alt="" src="<%="uploads/images/"+tittle.getImage_src()%>" style="width: 200px; height: 130px;"></a>
				     	</div>
				     	<div style="width:200px;float:left;margin-left:10px;padding-top:10px">
					     	<div style="height:30px;width:200px;white-space:nowrap;overflow:hidden;text-overflow:ellipsis; display:block;" ><a href="content.jsp?p=<%=tittle.getID()%>&n=Entity_TJXXHJS&m=<%=T_TTXXHJS%>" ><%=tittle.getTittle()%></a></div>
					     	<div style="height:90px;width:200px;overflow:hidden;font-size:12px ">摘要 : <%=tittle.getSummary().substring(3,tittle.getSummary().length()-3) %></div>
				     	</div>
				     	</li>
				       
				       
				       <%}
				       else{%>
			       		<li>
				       		<div style="width:200px;float:left;border:10px">
					     	<img alt="" src="image/default.jpg" style="width: 200px; height: 130px;">
					     	</div>
					     	<div style="width:200px;float:left;margin-left:10px;padding-top:10px">
						     	<div><a style="text-decoration:none;">无标题</a></div>
						     	<div  style="font-size:12px">摘要: </div>
					     	</div>
			       		</li>		     				    
					<% } while(rs.next()){%>			
				<li style="width: 100%;">				
				<a href="content.jsp?p=<%=rs.getInt("ID")%>&n=Entity_TJXXHJS&m=<%=T_TTXXHJS%>"   style="width: 430px;display: block;float: left;white-space:nowrap;overflow:hidden;text-overflow:ellipsis; display:block;">
				<%out.println(rs.getString("BT")); %>
				</a>
				</li>
				<%} %>
				</ul>	
			    
				
			    </div>
		</div> 
		<div class="bt_list1" style="margin-left: 15px;margin-top: 12px"><!--完善学校内部管理-->
				<div class="u_top">
				<div style="width: auto;float: left;margin-left: 10px;">
					<img src="image/flag2.png">
				</div>
				<div id="text2">
				<%
					menu_name=o.select_menu_name(T_WSXXNBGL);
					
					out.println(menu_name[0]);
				 %>
					
				</div>
				<div id="more"><a href="list.jsp?n=Entity_WSXXNBGL&m=<%=T_WSXXNBGL%>">更多</a></div>
				
			    </div>
			    <div class="u_content">
			    
			           	<ul style="width: 100%">
				
				<%
					tittle=o.select_data_column_top_image("Entity_WSXXNBGL");
					if(tittle.getID()==-1){
					  	rs=o.select_data("Entity_WSXXNBGL",7);
					}
					else if(tittle.getID()!=-1){
					  	rs.close();
					  	rs=o.select_data("Entity_WSXXNBGL",7,tittle.getID());				  
					}
			
				    if(tittle.getTittle()!=null){
				    //System.out.println(tittle.getImage_src());
				       %>
				     	<li style="width:100%;margin-bottom:8px">
				     	<div style="width:200px;float:left;border:10px">
				     	<a href="content.jsp?p=<%=tittle.getID()%>&n=Entity_WSXXNBGL&m=<%=T_WSXXNBGL%>"><img alt="" src="<%="uploads/images/"+tittle.getImage_src()%>" style="width: 200px; height: 130px;"></a>
				     	</div>
				     	<div style="width:200px;float:left;margin-left:10px;padding-top:10px">
					     	<div style="height:30px;width:200px;white-space:nowrap;overflow:hidden;text-overflow:ellipsis; display:block;"><a href="content.jsp?p=<%=tittle.getID()%>&n=Entity_WSXXNBGL&m=<%=T_WSXXNBGL%>" ><%=tittle.getTittle()%></a></div>
					     	<div style="height:90px;width:200px;overflow:hidden;font-size:12px ">摘要 : <%=tittle.getSummary().substring(3,tittle.getSummary().length()-3) %></div>
				     	</div>
				     	</li>
				       
				       
				       <%}
				       else{%>
			       		<li>
				       		<div style="width:200px;float:left;border:10px">
					     	<img alt="" src="image/default.jpg" style="width: 200px; height: 130px;">
					     	</div>
					     	<div style="width:200px;float:left;margin-left:10px;padding-top:10px">
						     	<div><a style="text-decoration:none;">无标题</a></div>
						     	<div  style="font-size:12px">摘要: </div>
					     	</div>
			       		</li>		     				    
					<% } while(rs.next()){%>			
				<li style="width: 100%;">				
				<a href="content.jsp?p=<%=rs.getInt("ID")%>&n=Entity_WSXXNBGL&m=<%=T_WSXXNBGL%>"   style="width: 430px;display: block;float: left;white-space:nowrap;overflow:hidden;text-overflow:ellipsis; display:block;">
				<%out.println(rs.getString("BT")); %>
				</a>
				</li>
				<%} %>
				</ul>	
		
			    </div>
		</div>
		
		
		
		
		
		
	</div>
	<div id="content_bt_right">
	
		<div class="bt_list2"><!--工作简报-->
			<div class="u_top">
				<div style="width: auto;float: left;margin-left: 10px;">
					<img src="image/flag2.png">
				</div>
				<div id="text2">
				<%
					menu_name=o.select_menu_name(T_GZJB);
					
					out.println(menu_name[0]);
				 %>
				
				
				
				</div>
				<div id="more"><a href="list.jsp?n=Entity_GZJB&m=<%=T_GZJB%>">更多</a></div>				
			</div>
			<div class="u_content">
				<ul style="width: 90%">
				<%
					rs=o.select_data("Entity_GZJB",8);
					while(rs.next()){					 
				 %>
				
				<li style="width: 100%;">				
				<a href="content.jsp?p=<%=rs.getInt("ID")%>&n=Entity_GZJB&m=<%=T_GZJB%>"   style="width:100%;display: block;float: left;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;">
				<%out.println(rs.getString("BT"));%>	
				</a>
				</li>
				<%} %>
				</ul>
			</div>
		</div>
		<div class="bt_list2" style="margin-top: 15px;"><!--会议纪要-->
			<div class="u_top">
				<div style="width: auto;float: left;margin-left: 10px;">
					<img src="image/flag2.png">
				</div>
				<div id="text2">
				<%
					menu_name=o.select_menu_name(T_HYJY);
					
					out.println(menu_name[0]);
				 %>
			
				</div>
				<div id="more"><a href="list.jsp?n=Entity_HYJY&m=<%=T_HYJY%>">更多</a></div>					
			</div>
			<div class="u_content">
				<ul style="width: 90%">
				<%
					rs=o.select_data("Entity_HYJY",8);
					while(rs.next()){					 
				 %>
				
				<li style="width: 100%;">				
				<a href="content.jsp?p=<%=rs.getInt("ID")%>&n=Entity_HYJY&m=<%=T_HYJY%>"   style="width:100%;display: block;float: left;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;">
				<%out.println(rs.getString("BT"));%>		
				</a>
				</li>
				<%} %>
				</ul>
			</div>
		</div>
		<div class="bt_list2" style="margin-top: 15px;"><!--方案与任务书-->
			<div class="u_top">
				<div style="width: auto;float: left;margin-left: 10px;">
					<img src="image/flag2.png">
				</div>
				<div id="text2">
				<%
					menu_name=o.select_menu_name(T_FAYRWS);
					
					out.println(menu_name[0]);
				 %>
			
				</div>
				<div id="more"><a href="list.jsp?n=Entity_FAYRWS&m=<%=T_FAYRWS%>">更多</a></div>					
			</div>
			<div class="u_content">
				<ul style="width: 90%">
				<%
					rs=o.select_data("Entity_FAYRWS",8);
					while(rs.next()){					 
				 %>
				
				<li style="width: 100%;">				
				<a href="content.jsp?p=<%=rs.getInt("ID")%>&n=Entity_FAYRWS&m=<%=T_FAYRWS%>"   style="width:100%;display: block;float: left;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;">
				<%out.println(rs.getString("BT"));%>		
				</a>
				</li>
				<%} %>
				</ul>
			</div>
		</div>
		<div class="bt_list2" style="margin-top: 15px;"><!--学习交流-->
			<div class="u_top">
				<div style="width: auto;float: left;margin-left: 10px;">
					<img src="image/flag2.png">
				</div>
				<div id="text2">
				<%
					menu_name=o.select_menu_name(T_XXJL);
					out.println(menu_name[0]);
				 %>
				
				</div>
				<div id="more"><a href="list.jsp?n=Entity_XXJL&m=<%=T_XXJL%>">更多</a></div>		
			</div>
			<div class="u_content">
				<ul style="width: 90%">
				<%
					rs=o.select_data("Entity_XXJL",5);
					while(rs.next()){
				 %>
				
				<li style="width: 100%;">				
				<a href="content.jsp?p=<%=rs.getInt("ID")%>&n=Entity_XXJL&m=<%=T_XXJL%>"   style="width:100%;display: block;float: left;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;">
				<%out.println(rs.getString("BT"));%>	
				</a>
				</li>
				<%} %>
				</ul>
			</div>
		</div>
	</div> 	
</div>
<%rs.close();
 o.ReleaseConn();%>
<%@include file="footer.jsp" %>

