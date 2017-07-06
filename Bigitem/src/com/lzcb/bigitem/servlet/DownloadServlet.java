package com.lzcb.bigitem.servlet;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lzcb.bigitem.utils.DbHelper;

public class DownloadServlet extends HttpServlet {

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		String id=request.getParameter("fjid");
		Map<String, Object> fj=DbHelper.queryARow("select * from fujian where id="+id);
		if(fj==null){
			response.getWriter().print("Image/timg.jpg");
			return;
		}
		String fileName = fj.get("WJMC").toString();
//		fileName = new String(fileName.getBytes("iso8859-1"),"UTF-8");
		//上传的文件都是保存在/WEB-INF/upload目录下的子目录当中
		String fileSaveRootPath=fj.get("WJLJ").toString();
		//通过文件名找出文件的所在目录
		String path = fileSaveRootPath+"/"+fj.get("SJMC");
		System.out.println(path);
		//得到要下载的文件
		File file = new File(path);
		//如果文件不存在
		if(!file.exists()){
		    request.setAttribute("message", "您要下载的资源已被删除！！");
		    request.getRequestDispatcher("/message.jsp").forward(request, response);
		    return;
		}
		//处理文件名
		String realname = fileName.substring(fileName.indexOf("_")+1);
		//设置响应头，控制浏览器下载该文件
		response.setHeader("content-disposition", "attachment;filename=" + URLEncoder.encode(realname, "UTF-8"));
		//读取要下载的文件，保存到文件输入流
		FileInputStream in = new FileInputStream(path);
		//创建输出流
		OutputStream out = response.getOutputStream();
		//创建缓冲区
		byte buffer[] = new byte[1024];
		int len = 0;
		//循环将输入流中的内容读取到缓冲区当中
		while((len=in.read(buffer))>0){
		    //输出缓冲区的内容到浏览器，实现文件下载
		    out.write(buffer, 0, len);
		}
		//关闭文件输入流
		in.close();
		//关闭输出流
		out.close();
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
