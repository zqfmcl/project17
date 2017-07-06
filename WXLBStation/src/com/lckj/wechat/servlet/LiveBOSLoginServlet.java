package com.lckj.wechat.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.util.Date;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.ResponseHandler;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;

import com.lckj.wechat.controller.AccessTokenCache;
import com.lckj.wechat.util.C3p0Util;
import com.lckj.wechat.util.WxHelper;
import com.sun.org.apache.xml.internal.serialize.Printer;

public class LiveBOSLoginServlet extends HttpServlet {

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
		JSONObject jsono=WxHelper.OAuth(request, response);
		System.out.println(jsono);
		int flag=0;
		if(jsono!=null&&!"".equals(jsono)&&!"null".equals(jsono)&&"0".equals(jsono.get("errcode").toString())){
			try {
//				System.out.println(C3p0Util.queryCountForInt("select count(1) from userwxh where wxh='"+jsono.get("weixinid")+"'"));
				if(C3p0Util.queryCountForInt("select count(1) from userwxh where wxh='"+jsono.get("weixinid")+"'")>0){
					//微信注册过
					Map<String,Cookie> cookieMap=WxHelper.ReadCookieMap(request);
					if(cookieMap.containsKey("WxTokenTo"+jsono.get("weixinid"))){
						//有cookie
						//验证用户名密码
						String pwd=URLDecoder.decode(cookieMap.get("WxTokenTo"+jsono.get("weixinid")).getValue(), "utf-8");
						String sql="select t.userid from tuser t where t.userid=(select userid from userwxh where wxh='"+jsono.get("weixinid")+"') and t.password='"+C3p0Util.getMd5(pwd)+"'";
						String userid=C3p0Util.queryForString(sql);
						if(null!=userid&&!"".equals(userid)){
							//密码正确,直接验证登录
							Cookie wxtokento=cookieMap.get("WxTokenTo"+jsono.get("weixinid"));
//					wxtokento.setMaxAge(3600*24);
//					response.addCookie(wxtokento);
							response.getWriter().print("正在调转...");
//					System.out.println("http://218.56.106.137:20000/PageLogin?userId="+userid+"&pass="+wxtokento.getValue());
							response.sendRedirect("http://bx.lzcb.com/PageLogin?userId="+userid+"&pass="+wxtokento.getValue());
						}else{
							flag=1;//重新登录
							System.out.println("用户名或密码错误");
							request.setAttribute("msg", "ERROR Incorrect Username Or Password !!!");
						}
					}else{
						flag=1;//没cookie,手动登录
						System.out.println("登录失效");
						request.setAttribute("msg", "Login Expire!");
					}
				}else{
					flag=1;//微信没注册过,手动登录
					System.out.println("初次登录");
				}
				if(flag==1){
					request.getRequestDispatcher("JSP/Login.jsp?userinfo="+jsono.get("weixinid")+"&userinfo2="+jsono.get("userid")).forward(request, response);
				}
			} catch (Exception e) {
				e.printStackTrace();// TODO: handle exception
			}
		}
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
