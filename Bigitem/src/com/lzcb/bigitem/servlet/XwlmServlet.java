package com.lzcb.bigitem.servlet;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lzcb.bigitem.Entity.Tuser;
import com.lzcb.bigitem.dao.JbxxDaoImpl;
import com.lzcb.bigitem.dao.XwlmDao;
import com.lzcb.bigitem.dao.XwlmDaoImpl;
import com.lzcb.bigitem.utils.DbHelper;
import com.lzcb.bigitem.utils.PageHelper;

public class XwlmServlet extends HttpServlet {

	private PageHelper page;
	
	 
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String sqls="select ll.* from t_wzlm ll  where ";
		XwlmDao dao=new XwlmDaoImpl();
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String method=request.getParameter("method");
		page=(PageHelper)request.getSession().getAttribute("page");
		Tuser user=(Tuser)request.getSession().getAttribute("user");
		if(user==null){
			request.getRequestDispatcher("/index.jsp").forward(request, response);
			return;
		}
		if("add".equals(method)){
			String cont=request.getParameter("cont");
			String msg=dao.addXwlm(request)?"操作成功":"操作失败";
			request.setAttribute("msg", msg);
			request.getSession().setAttribute("page", page);
			if(cont!=null&&"1".equals(cont)){
				request.getRequestDispatcher("JSP/xwgl/xwlm_add.jsp").forward(request, response);
			}else{
				List list=dao.queryTable(sqls , page);
				request.setAttribute("list", list);
				request.getRequestDispatcher("JSP/xwgl/xwlm_main.jsp").forward(request, response);
			}
		}else if("update".equals(method)){
			String msg=dao.updateXwlm(request,request.getParameter("xmid"))?"操作成功":"操作失败";
			request.setAttribute("msg", msg);

			List list=dao.queryTable(sqls , page);
			request.getSession().setAttribute("page", page);
			request.setAttribute("list", list);
			request.getRequestDispatcher("JSP/xwgl/xwlm_main.jsp").forward(request, response);
		}else if("del".equals(method)){
			String xmid=request.getParameter("xmid");
			String msg=DbHelper.update("delete from t_wzlm where id="+xmid)?"操作成功":"操作失败";
			if("操作成功".equals(msg))DbHelper.update("delete from fujian where ssbm='t_wzlm' and ssjldm="+xmid);
			request.setAttribute("msg", msg);

			List list=dao.queryTable(sqls , page);
			request.getSession().setAttribute("page", page);
			request.setAttribute("list", list);
			request.getRequestDispatcher("JSP/xwgl/xwlm_main.jsp").forward(request, response);
		}else if("select".equals(method)){//查询
			String sql=sqls;
			String condition="1=1  ";
			
			page=PageHelper.getpage(sql+condition, 5, condition);
			List list=dao.queryTable(sql, page);
			request.getSession().setAttribute("page", page);
			request.setAttribute("list", list);
			request.getRequestDispatcher("JSP/xwgl/xwlm_main.jsp").forward(request, response);
		}else if("feny".equals(method)){//分页
			String sql=sqls;
			String toPage=request.getParameter("toPage");
			if("add".equals(toPage)){
				page.setNowPage(page.getNowPage()+1);
				List list=dao.queryTable(sql, page);
				request.getSession().setAttribute("page", page);
				request.setAttribute("list", list);
			}else if("sub".equals(toPage)){
				page.setNowPage(page.getNowPage()-1);
				List list=dao.queryTable(sql, page);
				request.getSession().setAttribute("page", page);
				request.setAttribute("list", list);
			}else{
				page.setNowPage(Integer.parseInt(toPage));
				List list=dao.queryTable(sql, page);
				request.getSession().setAttribute("page", page);
				request.setAttribute("list", list);
			}
			request.getRequestDispatcher("JSP/xwgl/xwlm_main.jsp").forward(request, response);
		}else if("chgPage".equals(method)){
			String sql=sqls;
			int pageNum=Integer.parseInt(request.getParameter("pNum"));
			page=PageHelper.getpage(sql+page.getCondition(), pageNum, page.getCondition());
			List list=dao.queryTable(sql, page);
			request.getSession().setAttribute("page", page);
			request.setAttribute("list", list);
			request.getRequestDispatcher("JSP/xwgl/xwlm_main.jsp").forward(request, response);
		}else if("show".equals(method)){
			String xmid=request.getParameter("xmid");
			String sql="select ll.* from t_wzlm ll  where ll.id="+xmid+" ";
			Map<String, Object> xmxx=DbHelper.queryARow(sql);
			request.setAttribute("xmxx", xmxx);
			request.getRequestDispatcher("JSP/xwgl/xwlm_show.jsp").forward(request, response);
		}
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
