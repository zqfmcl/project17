package com.lzcb.bigitem.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lzcb.bigitem.Entity.Diqu;
import com.lzcb.bigitem.Entity.Juese;
import com.lzcb.bigitem.dao.DiquDao;
import com.lzcb.bigitem.dao.DiquDaoImpl;
import com.lzcb.bigitem.dao.JueseDao;
import com.lzcb.bigitem.dao.JueseDaoImpl;

public class JueseServlet extends HttpServlet {


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		String method=request.getParameter("method");

		JueseDao dao=new JueseDaoImpl();
		if("JueList".equals(method)){
			
			List<Juese> jueseList=dao.findJueseAll();
			request.setAttribute("jueseList", jueseList);
			request.getRequestDispatcher("JSP/xtgl/juese/listJuese.jsp").forward(request, response);
		}else if("JueAdd".equals(method)){

			String js_name = request.getParameter("js_name");
			String xt_name = request.getParameter("xt_name");
			String jhztvalue = request.getParameter("js_jhzt");
			
			String js_jhzt = "";
			String js_xtjsbz = "";
			if (jhztvalue != null) {
				js_jhzt = "T";
			} else {
				js_jhzt = "F";
			}
			String isxtjsvalue = request.getParameter("js_xtjsbz");
			if (isxtjsvalue != null) {
				js_xtjsbz = "T";
			} else {
				js_xtjsbz = "F";
			}

			Juese juese = new Juese();
			juese.setJs_xtjsbz(js_xtjsbz);
			juese.setJs_jhzt(js_jhzt);
			juese.setJs_name(js_name);
			juese.setXt_name(xt_name);

			
			dao.addJuese(juese);
			if (request.getParameter("type").equals("baocun")) {

				response.sendRedirect(request.getContextPath() + "/JueseServlet?method=JueList");
			} else if (request.getParameter("type").equals("savethenedit")) {

				response.sendRedirect(request.getContextPath() + "//JSP/xtgl/juese/addJuese.jsp");
			}
			
		}else if("JueQuery".equals(method)){
			int id = Integer.parseInt(request.getParameter("id"));
			
			Juese juese = dao.findJueseById(id);
			request.setAttribute("jueseEdit", juese);
			request.getRequestDispatcher("JSP/xtgl/juese/editJuese.jsp").forward(
					request, response);
		}else if("JueUpdate".equals(method)){
			int id=Integer.parseInt(request.getParameter("id"));
			String js_name=request.getParameter("js_name");
			String xt_name=request.getParameter("xt_name");
			String jhztvalue=request.getParameter("js_jhzt");
			String js_jhzt="";
			String js_xtjsbz="";
			if(jhztvalue!=null){
				 js_jhzt="T";
			}else{
				js_jhzt="F";
			}
			String isxtjsvalue=request.getParameter("js_xtjsbz");
			if(isxtjsvalue!=null){
				 js_xtjsbz="T";
			}else{
				js_xtjsbz="F";
			}
			Juese juese=new Juese();
			juese.setId(id);
			juese.setJs_xtjsbz(js_xtjsbz);
			juese.setJs_jhzt(js_jhzt);
			juese.setJs_name(js_name);
			juese.setXt_name(xt_name);
			
			dao.updateJuese(juese);
			response.sendRedirect(request.getContextPath()+"/JueseServlet?method=JueList");
		}else if("JueDel".equals(method)){
			int id=Integer.parseInt(request.getParameter("id"));
			dao.deleteJuese(id);			
			response.sendRedirect(request.getContextPath()+"/JueseServlet?method=JueList");
		}else if("JuePower".equals(method)){
			int id=Integer.parseInt(request.getParameter("id"));
			List<Integer> plist=dao.findPowerById(id);
			List<Integer> jsdqList=dao.findDiquById(id);
			DiquDao dao4=new DiquDaoImpl();
			
			List<Diqu> diquList=dao4.findAllDiqu();
			request.setAttribute("jsdqList", jsdqList);
			request.setAttribute("diquList", diquList);
			request.setAttribute("plist", plist);
			request.setAttribute("id", id);
			request.getRequestDispatcher("JSP/xtgl/juese/powerJuese.jsp").forward(request, response);
			
		}else if("JueUpdatePower".equals(method)){
			
			String[] powerstr=request.getParameterValues("power_id");

			int jsid=Integer.parseInt(request.getParameter("id"));
			String[] jsdqstr=request.getParameterValues("dq_id");
			
			dao.updatePower(powerstr, jsid);	
			dao.updateDiqu(jsdqstr, jsid);
			response.sendRedirect(request.getContextPath()+"/JueseServlet?method=JueList");
			
		}
	
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
