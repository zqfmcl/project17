<%@page import="java.sql.ResultSet"%>
<%@include file="lib/index_tp.jsp" %>
<%@include file="header.jsp" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="school.Dateout.Dateout"%>
<%@page import="school.convert.Convert"%>
<%@page import="school.connectDB.OperateDB"%>
<%
	OperateDB o=new OperateDB();//创建操作数据库对象		
	CachedRowSet rs;
	String LMBM=request.getParameter("n");//获得栏目表名
	int LMID=Integer.parseInt(request.getParameter("m"));//获得栏目表ID
				
	int boundsize;
	
	String temp=request.getParameter("front_page_ID");
	
	
	All_article_num=o.count_article_num(LMBM);//获取该栏目下所有文章总数
	
	if(All_article_num%Page_size==0){
		Page_num=All_article_num/Page_size;//
	}
	else{
		Page_num=All_article_num/Page_size+1;//分页个数				
	}
	
	
	/**
		判断nowpage是否出界
	*/
	if(temp==null){
	    Now_Page_ID=1;	
	    
	}
	else{
		boundsize=Integer.parseInt(temp);
		if(boundsize<1){				
			Now_Page_ID=1;
			//System.out.print(Now_Page_ID);					
			}
		else if(boundsize>=Page_num){
			Now_Page_ID=Page_num;
		}
		else{
			Now_Page_ID=boundsize;
		}
	}
%>
<div id="pic" style="position: absolute;z-index: -1"></div>
<div class="contain" style="height:700px; background-color: #ffffff">
	<div class="list_position">
		<label>当前位置:<a href="/technical_school/index.jsp">首页</a><a href="list.jsp?n=<%=LMBM%>&m=<%=LMID%>">
		
		
		<%

			String []ls = o.select_menu_name(LMID);   //获取栏目名和数据库表名
			
							
			out.println(">"+ls[0]);//输出栏目名称
		%>
	
		</a>
		</label>
	</div>
	<div class="list_left">
		<div class="positon_back">
			<%out.println(ls[0]);%>
		</div>
		<ul>
		<%rs=o.select_secondColumn(LMID);
    		while(rs.next()){
    		String localtemp=rs.getString("LMMC");
    		int localSCID=rs.getInt("ID");
    		%>    		
    		<li>
    		<a  href="list_sc.jsp?n=<%=LMBM%>&m=<%=LMID%>&q=<%=localSCID%>">
    		 <%=localtemp%>
    		</a>
    		</li>				
    	<%}%>
			
		</ul>
	</div>
	<div class="list_right">
		<div class="u_top">
				<div style="width: auto;float: left;margin-left: 10px;">
					<img src="image/flag2.png">
				</div>
				<div id="text2">
				<%					
					out.println(ls[0]);
						
				%>
				</div>
		</div>
		<div class="list_content">
			<ul>
			<%
				rs=o.select_article(Now_Page_ID, LMBM, Page_size, All_article_num);    //获某栏目的所以内容	
				while(rs.next()){
			 %>
			
			
			
			<li>
				<%if(ls[1].equals("JSDT_VIEW")){%>
				 <a style="float:left" href="content.jsp?p=<%=rs.getInt("ID")%>&n=<%=rs.getString("TNAME")%>&m=<%=rs.getInt("TID")%>"><%out.println(rs.getString("BT"));%></a>				 
				 <%} else{%>
				 <a style="float:left" href="content.jsp?p=<%=rs.getInt("ID")%>&n=<%=ls[1]%>&m=<%=LMID%>"><%out.println(rs.getString("BT"));%></a>				 			 
				<%} %>
				<div style="float:left;color:#999999">[<%out.println(rs.getString("SSBM"));//int authorID=rs.getInt("FBZ");out.println(o.select_author(authorID));%>]&nbsp;</div>
				<div style="float:left;color:#999999">(阅读 <%String degree=rs.getString("YDCS");out.println(degree);%>次&nbsp;)</div>
				<div style="float:left;color:#999999">&nbsp;发布时间&nbsp;:&nbsp;<%String time=rs.getString("FBSJ");out.println(time.substring(0, time.length()-2)); %></div>
			</li>			
			<%} %>
			</ul>
		</div>
		
			  <div id="page">
		    <ul class="pager">
		    
		    	<li><a href="list.jsp?front_page_ID=<%=Now_Page_ID-1%>&n=<%=LMBM%>&m=<%=LMID%>">上一页</a></li>
		    	<li><a href="list.jsp?front_page_ID=<%=Now_Page_ID+1%>&n=<%=LMBM%>&m=<%=LMID%>">下一页</a></li>
		    	<li>当前页：<%out.println(Now_Page_ID);%></li>
		    	<li>共页：<%out.println(Page_num);%></li>
		    </ul>       
		    </div>
		
	</div>
</div>
 <%rs.close(); 
 	o.ReleaseConn();
 %>
<%@include file="footer.jsp" %>