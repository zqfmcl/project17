<%@page language="java" import="java.util.*"  contentType="application/x-msdownload" pageEncoding="UTF-8"%>
<%@page import="java.net.URLEncoder "%>
<%@page import="java.io.*"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort();
%>
<%
	String filedisplay=new String(request.getParameter("showfilename").getBytes("ISO-8859-1"),"UTF-8");//文件显示名
	String filedownload=new String(request.getParameter("filepath").getBytes("ISO-8859-1"),"UTF-8");//文件路径
	filedownload=application.getRealPath("/")+filedownload;
  	//关于文件下载时采用文件流输出的方式处理：  
  	//加上response.reset()，并且所有的％>后面不要换行，包括最后一个；  

  	response.reset();//可以加也可以不加  
  	response.setContentType("application/x-download");
 	//application.getRealPath("/main/mvplayer/CapSetup.msi");获取的物理路径  

 	//String filedownload = "想办法找到要提供下载的文件的物理路径＋文件名"; 
 	//String filedisplay = "给用户提供的下载文件名";
 	/* filedisplay = URLEncoder.encode(filedisplay,"UTF-8");
 	filedownload=URLEncoder.encode(filedownload,"UTF-8");*/
 	filedisplay = URLEncoder.encode(filedisplay,"UTF-8");

 	response.addHeader("Content-Disposition","attachment;filename="+filedisplay);  
  
  java.io.OutputStream outp = null;  
  java.io.FileInputStream in = null;  
  try  
  {  
	  outp = response.getOutputStream();  
	  in = new FileInputStream(filedownload);  
	  
	  byte[] b = new byte[1024];  
	  int i = 0;  
	  
	  while((i = in.read(b)) > 0)  
	  {  
	  outp.write(b, 0, i);  
  }  
	//    
	outp.flush();  
	//要加以下两句话，否则会报错  
	//java.lang.IllegalStateException: getOutputStream() has already been called for //this response    
	out.clear();  
	out = pageContext.pushBody();  
	}  
	  catch(Exception e)  
	  {  
	  System.out.println("Error!");  
	  e.printStackTrace();  
	  }  
	  finally  
	  {  
	  if(in != null)  
	  {  
	  in.close();  
	  in = null;  
	  }  
//这里不能关闭    
//if(outp != null)  
  //{  
  //outp.close();  
  //outp = null;  
  //}  
  }  
%>  

