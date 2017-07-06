package com.lckj.wechat.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lckj.wechat.controller.JSAPITicketCache;
import com.lckj.wechat.util.WxHelper;

public class DealPageServlet extends HttpServlet {

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
		
		String jsapi_ticket=JSAPITicketCache.getJsapiTicketFromWx(WxHelper.CORPID, WxHelper.RESP_MSG_SECRET);
		String url=request.getRequestURL().toString();
		if(request.getQueryString()!=null){
			url+="?"+request.getQueryString();
		}
//		"http://" + request.getServerName() //服务器地址  
//        + ":"   
//        + request.getServerPort()           //端口号  
//        + request.getContextPath()      //项目名称  
//        + request.getServletPath()      //请求页面或其他地址  
//    + "?" + (request.getQueryString());
		System.out.println(url);
		Map<String, String> ret=WxHelper.sign(jsapi_ticket, url);
		request.setAttribute("corpId", WxHelper.CORPID);
		request.setAttribute("time", ret.get("timestamp"));
		request.setAttribute("nonceStr", ret.get("nonceStr"));
		request.setAttribute("str1", ret.get("signature"));
		
		System.out.println("url:"+url);
		System.out.println("jsapi_ticket:"+jsapi_ticket);
		System.out.println("time:"+ret.get("timestamp"));
		System.out.println("nonceStr:"+ret.get("nonceStr"));
		System.out.println("\nsignature:"+ret.get("signature"));
		request.getRequestDispatcher("JSP/index.jsp").forward(request, response);
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
