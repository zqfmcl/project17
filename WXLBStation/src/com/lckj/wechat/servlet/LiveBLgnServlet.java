package com.lckj.wechat.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lckj.wechat.util.C3p0Util;

import net.sf.json.JSONObject;

public class LiveBLgnServlet extends HttpServlet {

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

		String userid=request.getParameter("userid");
		String pwd=request.getParameter("pass");
		String wxid=request.getParameter("userinfo");
		String wxrz=request.getParameter("userinfo2");
		int limittype=Integer.parseInt(request.getParameter("limit"));
//		System.out.println(C3p0Util.queryCountForInt("select count(1) from tuser where userid='"+userid+"' and password='"+C3p0Util.getMd5(pwd)+"'"));
		if(C3p0Util.queryCountForInt("select count(1) from tuser where userid='"+userid+"' and password='"+C3p0Util.getMd5(pwd)+"'")>0){
			//登录成功
			//登记微信号
			if(limittype!=1){
				C3p0Util.update("update wxglryxx set wxh='"+wxid+"' , wxrz='"+wxrz+"' where id=(select t.glwxglry from tuser t where userid='"+userid+"')");
				C3p0Util.update("update wxryxx set wxh='"+wxid+"' , wxrz='"+wxrz+"' where id=(select t.glwxry from tuser t where userid='"+userid+"')");
				C3p0Util.update("update jzs set wxh='"+wxid+"' , wxrz='"+wxrz+"' where id=(select t.gljzgry from tuser t where userid='"+userid+"')");
				C3p0Util.update("update xsxx set wxh='"+wxid+"' , wxrz='"+wxrz+"' where id=(select t.glxs from tuser t where userid='"+userid+"')");
				C3p0Util.update("update ckglry set wxh='"+wxid+"' , wxrz='"+wxrz+"' where id=(select t.glckglry from tuser t where userid='"+userid+"')");
			}
			//写cookie
			Cookie wxtokento=new Cookie("WxTokenTo"+wxid,pwd);
			int age=-1;
			switch (limittype){
			case 2:age=3600*24;break;
			case 3:age=3600*24*7;break;
			case 4:age=3600*24*15;break;
			case 5:age=3600*24*30;break;
			default:age=-1;break;
			}
			wxtokento.setMaxAge(age);
			response.addCookie(wxtokento);
			response.getWriter().print("登录成功!正在跳转...");
			//登录livebos
			response.sendRedirect("http://bx.lzcb.com/PageLogin?userId="+userid+"&pass="+pwd);
		}else{
			request.setAttribute("msg", "ERROR Incorrect Username Or Password !!!");
			request.getRequestDispatcher("JSP/Login.jsp").forward(request, response);
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
