<%@page import="java.sql.ResultSet"%>
<%@include file="lib/index_tp.jsp" %>
<%@include file="header.jsp" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="school.Dateout.Dateout"%>
<%@page import="school.convert.Convert"%>
<%@page import="java.net.URLEncoder "%>

<%@page import="school.connectDB.OperateDB"%>
<%
	OperateDB o=new OperateDB();//创建操作数据库对象		
	CachedRowSet rs;
	//String LMBM=request.getParameter("n");//获得栏目表名
	//int LMID=Integer.parseInt(request.getParameter("m"));//获得栏目表ID
	String content=new String(request.getParameter("content").getBytes("ISO-8859-1"),"UTF-8");		
	
	int boundsize;
	
	String temp=request.getParameter("front_page_ID");
	
	
	All_article_num=o.count_article_num_search_view(content);//获取该栏目下所有文章总数
	
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
<div id="pic" style="position: absolute;z-index: -1" data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-228" data-genuitec-path="/technical_school/WebRoot/search.jsp"></div>
<div class="contain" style="height:700px; background-color: #ffffff">
	<div class="list_position">
		<label>当前位置:<a href="/technical_school/index.jsp">首页</a><a href="search.jsp?content=<%=content%>">
		
		
		<%

			
							
			out.println(">"+"当前搜索");//输出栏目名称
		%>
	
		</a>
		</label>
	</div>
	<div class="list_left">
		<div class="positon_back">
			<%out.println("站内搜索");%>
		</div>
		<ul>		
		</ul>
	</div>
	<div class="list_right">
		<div class="u_top">
				<div style="width: auto;float: left;margin-left: 10px;">
					<img src="image/flag2.png">
				</div>
				<div id="text2">
				<%					
					out.println("搜索结果");
						
				%>
				</div>
		</div>
		<div class="list_content">
			<ul>
			<%
				rs=o.select_article(Now_Page_ID,Page_size, All_article_num,content);    //获某栏目的所以内容	
				while(rs.next()){
			 %>
			
			
			
			<li>
				<a style="float:left" href="content.jsp?p=<%=rs.getInt("ID")%>&n=<%=rs.getString("TNAME")%>&m=<%=rs.getInt("TID")%>"><%out.println(rs.getString("BT"));%></a>
				<div style="float:left;color:#999999">[<%out.println(rs.getString("SSBM"));//int authorID=rs.getInt("FBZ");out.println(o.select_author(authorID));%>]&nbsp;</div>
				<div style="float:left;color:#999999">(阅读 <%String degree=rs.getString("YDCS");out.println(degree);%>次&nbsp;)</div>
				<div style="float:left;color:#999999">&nbsp;发布时间&nbsp;:&nbsp;<%String time=rs.getString("FBSJ");out.println(time.substring(0, time.length()-2)); %></div>
			</li>			
			<%} %>
			</ul>
		</div>
		
			<div id="page">
		    <ul class="pager">
		    	<%URLEncoder.encode(content,"ISO-8859-1");%><!-- 将内容转换成ISO-8859-1编码，方便url传参 -->
		    	<li><a href="search.jsp?front_page_ID=<%=Now_Page_ID-1%>&content=<%=content%>">上一页</a></li>
		    	<li><a href="search.jsp?front_page_ID=<%=Now_Page_ID+1%>&content=<%=content%>">下一页</a></li>
		    	<li>当前页：<%out.println(Now_Page_ID);%></li>
		    	<li>共页：<%out.println(Page_num);%></li>
		    </ul>       
		    </div>
		
	</div>
</div>
<%@include file="footer.jsp" %>
<%rs.close(); 
  o.ReleaseConn();
%>
