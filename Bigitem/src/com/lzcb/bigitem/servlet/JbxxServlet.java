package com.lzcb.bigitem.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lzcb.bigitem.dao.JbxxDaoImpl;
import com.lzcb.bigitem.utils.DbHelper;

public class JbxxServlet extends HttpServlet {

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
		String method=request.getParameter("method");
		String sql=null;
		if("dqxxAdd".equals(method)){
			String dqmc=request.getParameter("dqmc");
			String sjjd=request.getParameter("sjjd");
			String pxh=request.getParameter("pxh");
			String bz=request.getParameter("bz");
			sql="insert into bi_dqxxb values(seq_bi_dqxxb.nextval,'"+(dqmc==null?"default":dqmc)+"','"+(sjjd==null?"default":sjjd)+"','"+(pxh==null?"default":pxh)+"','"+bz+"')";
			boolean f=DbHelper.update(sql);
			request.setAttribute("msg", f?"操作成功":"操作失败");
			request.getRequestDispatcher("JSP/jbxx/dqxxgl.jsp").forward(request, response);
		}else if("dqxxUpdate".equals(method)){
			String dqid=request.getParameter("dqid");
			String dqmc=request.getParameter("dqmc");
			String sjjd=request.getParameter("sjjd");
			String pxh=request.getParameter("pxh");
			String bz=request.getParameter("bz");
			sql="update bi_dqxxb set dq_name='"+(dqmc==null?"default":dqmc)+"',sjjd_dm='"+(sjjd==null?"default":sjjd)+"',pxh='"+(pxh==null?"default":pxh)+"',bz='"+bz+"' where id="+dqid;
			boolean f=DbHelper.update(sql);
			request.setAttribute("msg", f?"操作成功":"操作失败");
			request.getRequestDispatcher("JSP/jbxx/dqxxgl.jsp").forward(request, response);
		}else if("dqxxDel".equals(method)){
			String dqid=request.getParameter("dqid");
			sql="delete from bi_dqxxb where id in ("+JbxxDaoImpl.getDQsbyid(dqid)+")";
			boolean f=DbHelper.update(sql);
			request.setAttribute("msg", f?"操作成功":"操作失败");
			request.getRequestDispatcher("JSP/jbxx/dqxxgl.jsp").forward(request, response);
		}else 
		if("cyxxAdd".equals(method)){
			String cymc=request.getParameter("cymc");
			String sjjd=request.getParameter("sjjd");
			String pxh=request.getParameter("pxh");
			String bz=request.getParameter("bz");
			sql="insert into bi_cyxxb values(seq_bi_cyxxb.nextval,'"+cymc+"','"+(sjjd==null?"default":sjjd)+"','"+(pxh==null?"default":pxh)+"','"+bz+"')";
			boolean f=DbHelper.update(sql);
			request.setAttribute("msg", f?"操作成功":"操作失败");
			request.getRequestDispatcher("JSP/jbxx/cyxxgl.jsp").forward(request, response);
		}else if("cyxxUpdate".equals(method)){
			String cyid=request.getParameter("cyid");
			String cymc=request.getParameter("cymc");
			String sjjd=request.getParameter("sjjd");
			String pxh=request.getParameter("pxh");
			String bz=request.getParameter("bz");
			sql="update bi_cyxxb set cy_name='"+cymc+"',sjjd_dm='"+(sjjd==null?"default":sjjd)+"',pxh='"+(pxh==null?"default":pxh)+"',bz='"+bz+"' where id="+cyid;
			boolean f=DbHelper.update(sql);
			request.setAttribute("msg", f?"操作成功":"操作失败");
			request.getRequestDispatcher("JSP/jbxx/cyxxgl.jsp").forward(request, response);
		}else if("cyxxDel".equals(method)){
			String cyid=request.getParameter("cyid");
			sql="delete from bi_cyxxb where id="+cyid;
			boolean f=DbHelper.update(sql);
			request.setAttribute("msg", f?"操作成功":"操作失败");
			request.getRequestDispatcher("JSP/jbxx/cyxxgl.jsp").forward(request, response);
		}else if("dqxxcont".equals(method)){
			String dqmc=request.getParameter("dqmc");
			String sjjd=request.getParameter("sjjd");
			String pxh=request.getParameter("pxh");
			String bz=request.getParameter("bz");
			sql="insert into bi_dqxxb values(seq_bi_dqxxb.nextval,'"+dqmc+"','"+(sjjd==null?"default":sjjd)+"','"+(pxh==null?"default":pxh)+"','"+bz+"')";
			boolean f=DbHelper.update(sql);
			request.setAttribute("msg", f?"操作成功":"操作失败");
			request.getRequestDispatcher("JSP/jbxx/dqxxAdd.jsp").forward(request, response);
		}else if("cyxxcont".equals(method)){
			String cymc=request.getParameter("cymc");
			String sjjd=request.getParameter("sjjd");
			String pxh=request.getParameter("pxh");
			String bz=request.getParameter("bz");
			sql="insert into bi_cyxxb values(seq_bi_cyxxb.nextval,'"+cymc+"','"+(sjjd==null?"default":sjjd)+"','"+(pxh==null?"default":pxh)+"','"+bz+"')";
			boolean f=DbHelper.update(sql);
			request.setAttribute("msg", f?"操作成功":"操作失败");
			request.getRequestDispatcher("JSP/jbxx/cyxxAdd.jsp").forward(request, response);
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
