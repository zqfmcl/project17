package com.lzcb.bigitem.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lzcb.bigitem.Entity.Tuser;
import com.lzcb.bigitem.dao.YonghuDao;
import com.lzcb.bigitem.dao.YonghuDaoImpl;
import com.lzcb.bigitem.utils.DbHelper;

public class LoginServlet extends HttpServlet {
	private YonghuDao dao;
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		dao=new YonghuDaoImpl();
		String username=request.getParameter("username");
		String pass=request.getParameter("pass");
		if(DbHelper.queryCountForInt("select count(1) from tuser where userid='"+username+"'")>0){
			Tuser user=new Tuser(DbHelper.queryARow("select * from tuser where userid='"+username+"'"));
			if(pass.equals(user.getPassword())){
				request.getSession().setAttribute("user", user);
				request.getSession().setAttribute("power", dao.getPower(user.getId()+""));
				request.getRequestDispatcher("JSP/welcome.jsp").forward(request, response);
			}else{
				request.setAttribute("msg", "用户名或密码错误！！");
				request.getRequestDispatcher("index.jsp").forward(request, response);
			}
		}else{
			request.setAttribute("msg", "用户不存在！");
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
	}

}
