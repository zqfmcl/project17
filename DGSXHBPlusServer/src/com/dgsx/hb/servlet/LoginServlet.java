package com.dgsx.hb.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dgsx.hb.utils.DbHelper;

public class LoginServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//http://localhost:8080/DGSXHBPlusServer/Login.do?method=studentlogin
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String method=request.getParameter("method");
		String errcode="-1";
		if("studentlogin".equals(method)){
			String account=request.getParameter("account");
			String password=request.getParameter("password");
			String dbpass=DbHelper.queryForString("select password from tuser where userid='"+account+"'");
			//System.out.println("account:"+account+"   pass:"+password+"\ndbpass:"+dbpass+"\nmd5:"+DbHelper.getMd5(password));
			if(dbpass!=null&&DbHelper.getMd5(password).equals(dbpass)){
				//成功登录
				errcode="0";
			}else{
				//用户名或密码错误
				errcode="-1";
			}
			response.getWriter().print("{\"errcode\":\""+errcode+"\"}");
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
