package com.lzcb.bigitem.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lzcb.bigitem.Entity.Tuser;
import com.lzcb.bigitem.utils.DbHelper;

public class LogonServlet extends HttpServlet {

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
		response.setCharacterEncoding("utf-8");
		String method=request.getParameter("method");
		if("logout".equals(method)){
			request.getSession().setAttribute("user", null);
			//request.getRequestDispatcher("index.jsp").forward(request, response);
			response.sendRedirect("/Bigitem/index.jsp");
		}else if("update".equals(method)){
			String oldp=request.getParameter("oldpass");
			String newp=request.getParameter("newpass");
			//System.out.println("o:"+oldp+"  n:"+newp+"  t:"+twop);
			Tuser user=(Tuser)request.getSession().getAttribute("user");
			if(oldp.equals(user.getPassword())){
				request.setAttribute("msg", DbHelper.update("update tuser set password='"+newp+"' where id="+user.getId())?"修改成功":"操作失败！");
				//request.getRequestDispatcher("JSP/user/updatepwd.jsp").forward(request, response);
			}else{
				request.setAttribute("msg", "密码验证失败！");
			}
			request.getRequestDispatcher("JSP/user/updatepwd.jsp").forward(request, response);
			//request.getSession().removeAttribute("user");
			//request.getRequestDispatcher("index.jsp").forward(request, response);
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
