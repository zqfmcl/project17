<%@page import="school.javabean.Article"%>
<%@include file="lib/index_tp.jsp" %>
<%@include file="header.jsp" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="school.Dateout.Dateout"%>
<%@page import="school.convert.Convert"%>
<%@page import="school.connectDB.OperateDB"%>
<%
	int id=Integer.parseInt(request.getParameter("p"));//获取内容页ID
		
		String LMBM=request.getParameter("n");//获取栏目表名
		
		CachedRowSet crs=null;
		
		
		int LMID=Integer.parseInt(request.getParameter("m"));//获取栏目ID
		
		OperateDB o=new OperateDB();//数据库操作对象
					
		String []ls = o.select_menu_name(LMID);   //获取栏目名和数据库表名
		
		o.click_update(LMBM, id);//点击次数自增（存储过程）
			
		Article article=o.select_detail(LMBM,id);//获取文章信息
		
		
%>
		
<div id="pic" style="position: absolute;z-index: -100"></div>
<div class="contain">
		<div class="show_contents_left" style="height:600px">
			<div class="positon_back">
			<%out.println(ls[0]);%>
			</div>
			<div>
			<ul>
					<%crs=o.select_secondColumn(LMID);
    				while(crs.next()){
    				String localtemp=crs.getString("LMMC");
    				int localSCID=crs.getInt("ID");
    				%>    		
    				<li>
    				<a  href="list_sc.jsp?n=<%=LMBM%>&m=<%=LMID%>&q=<%=localSCID%>">
    		 		<%=localtemp%>
    				</a>
    				</li>				
    				<%}%>
			
			</ul>
			</div>
		</div>		

		<div class="show_contents_right">
			<div class="show_content_head">
			<%
				out.println(article.getTittle());
			%>
			</div>
			
			<div class="show_content_time">
			发布者 : <%out.println(article.getDepartment()); %>
			&nbsp;&nbsp;发布时间 : <%out.println(article.getDate()); %>
			&nbsp;&nbsp;阅读次数 : <%out.println(article.getClickNum()); %>
	
			</div>
			
			<hr style="border:1px dashed #000; height:1px">
			
			<div style="margin-bottom:15px;font-size:20px">
			<%
				if(article.getContent()!=null){
					out.println(article.getContent());								
				}
				if(article.getAttachment()!=null){		
					String Attachments[]=article.getAttachment().split(",");

					int i=0;
										
					while(i!=Attachments.length){		
					out.println("附件:");			
					String filenametemp=Attachments[i].substring(Attachments[i].lastIndexOf("\\")+1,Attachments[i].lastIndexOf("-"));
					String fileextension=Attachments[i].substring(Attachments[i].lastIndexOf("."),Attachments[i].length());
					String showfilename=filenametemp+fileextension;
					String filepath="uploads/attachments/"+Attachments[i];
					%>
									
					<a href="download.jsp?showfilename=<%=showfilename%>&filepath=<%=filepath%>"><%=showfilename%></a><br>
					
				<%i++;
					}
				}
				else{
					out.println("附件:无");					
				}
				%>					
				
				
				
			</div>
		</div>
		<div class="clear"></div> 
</div>
<%crs.close();
o.ReleaseConn(); 
%>
<%@include file="footer.jsp" %>