package com.lzcb.bigitem.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lzcb.bigitem.Entity.Department;
import com.lzcb.bigitem.Entity.Diqu;
import com.lzcb.bigitem.Entity.Juese;
import com.lzcb.bigitem.Entity.PageBean;
import com.lzcb.bigitem.Entity.Tuser;
import com.lzcb.bigitem.Entity.Yonghu;
import com.lzcb.bigitem.Entity.YonghuCondition;
import com.lzcb.bigitem.dao.DepartmentDao;
import com.lzcb.bigitem.dao.DepartmentDaoImpl;
import com.lzcb.bigitem.dao.DiquDao;
import com.lzcb.bigitem.dao.DiquDaoImpl;
import com.lzcb.bigitem.dao.JueseDao;
import com.lzcb.bigitem.dao.JueseDaoImpl;
import com.lzcb.bigitem.dao.YonghuDao;
import com.lzcb.bigitem.dao.YonghuDaoImpl;

public class YongServlet extends HttpServlet {

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		String method=request.getParameter("method");
		if("YongList".equals(method)){
			YonghuDao dao3=new YonghuDaoImpl();
			YonghuCondition yhc=new YonghuCondition();
			String bmidstr=request.getParameter("bmid_query");

			Integer bmid_query=0;
			if(bmidstr==null||"".equals(bmidstr)){
				bmid_query=0;
			}else{
				bmid_query=Integer.valueOf(bmidstr);
			}
			String email_query=request.getParameter("email_query");
			if(email_query==null){
				email_query="";
			}
			String userid_query=request.getParameter("userid_query");
			if(userid_query==null){
				userid_query="";
			}
			Tuser user=(Tuser) request.getSession().getAttribute("user");
			
			yhc.setDq_idlist(dao3.findDqidById(user.getId()));
			
			yhc.setBmid_query(bmid_query);
			yhc.setEmail_query(email_query);
			yhc.setUserid_query(userid_query);
			int[] arr=null;
			String str=request.getParameter("js_query");
			if(str!=null&&!"".equals(str)){
				arr=new int[1];
				arr[0]=Integer.parseInt(str);
			}
			/*String[] str=request.getParameterValues("js_query");
			if(str!=null&&!"".equals(str)){
				arr=new int[str.length];
				for(int i=0;i<str.length;i++){
					arr[i]=Integer.parseInt(str[i]);
				}
			}*/
			yhc.setJs_query(arr);
			
			
			
			PageBean pagebean = new PageBean();
			
			
			String currentPage = request.getParameter("currentPage");
			if (currentPage == null || currentPage.equals("")) {
				currentPage = "1";
			}
			pagebean.setCurrentPage(Integer.parseInt(currentPage));

			// 1.2总记录数
			int count =dao3.queryCount(yhc);
			pagebean.setTotalCount(count);
			
			// 1.5每页显示记录数
			String pageSize = request.getParameter("pageSize");
			//如果没有传递这个pageSize参数，则为默认值5
			if(pageSize==null || pageSize.equals("")){
				pageSize = "5";
			}
			pagebean.setPageSize(Integer.parseInt(pageSize));
			
			DepartmentDao dao=new DepartmentDaoImpl();
			List<Department> bmList = dao.findDeptAll();
			JueseDao dao2=new JueseDaoImpl();
			DiquDao dao4=new DiquDaoImpl();
			List<Diqu> diquList=dao4.findAllDiqu();
			List<Juese> jsList = dao2.findJueseAll();			
			
			List<Yonghu> yhList=dao3.findBySql(yhc,pagebean.getCurrentPage(), pagebean.getPageSize());
			
			request.setAttribute("diquList", diquList);
			request.setAttribute("yhc", yhc);
			request.setAttribute("bmList", bmList);
			request.setAttribute("jsList", jsList);
			request.setAttribute("yhList", yhList);
			request.setAttribute("pageBean", pagebean);
			request.getRequestDispatcher("JSP/xtgl/yonghu/listYonghu.jsp").forward(request, response);		
		}else if("YongGet".equals(method)){
			DepartmentDao dao=new DepartmentDaoImpl();
			List<Department> bmList = dao.findDeptAll();
			JueseDao dao2=new JueseDaoImpl();
			List<Juese> jsList = dao2.findJueseAll();
			DiquDao dao4=new DiquDaoImpl();
			List<Diqu> diquList=dao4.findAllDiqu();
			request.setAttribute("diquList", diquList);
			request.setAttribute("bmList", bmList);
			request.setAttribute("jsList", jsList);
			
			
			request.getRequestDispatcher("JSP/xtgl/yonghu/addYonghu.jsp").forward(request, response);
			
		}else if("YongAdd".equals(method)){
			request.setCharacterEncoding("utf-8");
			
			String userid=request.getParameter("userid");
			String username=request.getParameter("username");
			String email=request.getParameter("email");
			String password=request.getParameter("password");
//			int bm_id=Integer.parseInt(request.getParameter("bm"));
			String jhztvalue=request.getParameter("jhzt");
			int dq_id=Integer.parseInt(request.getParameter("dq_id"));
			String jhzt="";
			if(jhztvalue!=null){
				 jhzt="T";
			}else{
				jhzt="F";
			}
			String[] jsid=request.getParameterValues("js");
			Yonghu yonghu=new Yonghu();
			yonghu.setUserid(userid);
			yonghu.setUsername(username);
			yonghu.setEmail(email);
			yonghu.setPassword(password);
//			yonghu.setBm_id(bm_id);
			yonghu.setJhzt(jhzt);
			yonghu.setJsid(jsid);
			yonghu.setDq_id(dq_id);
			
			YonghuDao dao=new YonghuDaoImpl();
			dao.addYonghu(yonghu);
			
			if (request.getParameter("type").equals("baocun")) {

				response.sendRedirect(request.getContextPath() + "/YongServlet?method=YongList");
			} else if (request.getParameter("type").equals("savethenedit")) {

				response.sendRedirect(request.getContextPath() + "/YongServlet?method=YongGet");
			}
		}else if("YongUpdate".equals(method)){
			int id=Integer.parseInt(request.getParameter("id"));
			String userid=request.getParameter("userid");
			String username=request.getParameter("username");
			String email=request.getParameter("email");
			String password=request.getParameter("password");
			int dq_id=Integer.parseInt(request.getParameter("dq_id"));
//			int bm_id=Integer.parseInt(request.getParameter("bm"));
			String jhztvalue=request.getParameter("jhzt");
			String jhzt="";
			if(jhztvalue!=null){
				 jhzt="T";
			}else{
				jhzt="F";
			}
			String[] jsid=request.getParameterValues("js");
			Yonghu yonghu=new Yonghu();
			yonghu.setId(id);
			yonghu.setUserid(userid);
			yonghu.setUsername(username);
			yonghu.setEmail(email);
			yonghu.setPassword(password);
//			yonghu.setBm_id(bm_id);
			yonghu.setJhzt(jhzt);
			yonghu.setJsid(jsid);
			yonghu.setDq_id(dq_id);
			
			YonghuDao dao=new YonghuDaoImpl();
			dao.upadteYonghu(yonghu);
			
			response.sendRedirect(request.getContextPath()+"/YongServlet?method=YongList");
		}else if("YongQuery".equals(method)){
			int id=Integer.parseInt(request.getParameter("id"));
			YonghuDao dao=new YonghuDaoImpl();
			Yonghu yonghu = dao.findById(id);
			
			DepartmentDao dao2=new DepartmentDaoImpl();
			List<Department> bmList = dao2.findDeptAll();
			
			JueseDao dao3=new JueseDaoImpl();
			List<Juese> jueseList = dao3.findJueseAll();
			int i=0;
			List<Integer> jsidList=dao.findYhjsId(id);
			int[] jsidArray=new int[jsidList.size()];
			for(Integer in:jsidList){
				
				jsidArray[i]=in.intValue();
				
				i++;
			}
			DiquDao dao4=new DiquDaoImpl();
			
			List<Diqu> diquList=dao4.findAllDiqu();
			request.setAttribute("diquList", diquList);
			
			
			request.setAttribute("jsidArray", jsidArray);
			request.setAttribute("jueseList", jueseList);
			request.setAttribute("bmList", bmList);
			request.setAttribute("yhEdit", yonghu);
			
			request.getRequestDispatcher("/JSP/xtgl/yonghu/editYonghu.jsp").forward(request, response);
			
		}else if("YongDel".equals(method)){
			int id=Integer.parseInt(request.getParameter("id"));
			YonghuDao dao=new YonghuDaoImpl();
			dao.deleteYonghu(id);
			
			response.sendRedirect(request.getContextPath()+"/YongServlet?method=YongList");
		}
		
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
