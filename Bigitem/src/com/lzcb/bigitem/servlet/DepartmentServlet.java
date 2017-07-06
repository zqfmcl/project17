package com.lzcb.bigitem.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lzcb.bigitem.Entity.Department;
import com.lzcb.bigitem.Entity.PageBean;
import com.lzcb.bigitem.dao.DepartmentDao;
import com.lzcb.bigitem.dao.DepartmentDaoImpl;

public class DepartmentServlet extends HttpServlet {


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		String method = request.getParameter("method");
		if ("DeptList".equals(method)) {
			// 1读取所有部门数据
			PageBean pagebean=new PageBean();
			DepartmentDao dao = new DepartmentDaoImpl();

			// 1.1从用户中获取当前页数据
			String currentPage = request.getParameter("currentPage");
			if (currentPage == null || currentPage.equals("")) {
				currentPage = "1";
			}
			pagebean.setCurrentPage(Integer.parseInt(currentPage));

			// 1.2总记录数
			int count = dao.queryCount();
			pagebean.setTotalCount(count);
			
			// 1.5每页显示记录数
			String pageSize = request.getParameter("pageSize");
			//如果没有传递这个pageSize参数，则为默认值2
			if(pageSize==null || pageSize.equals("")){
				pageSize = "2";
			}
			pagebean.setPageSize(Integer.parseInt(pageSize));

			List<Department> deptList = dao.findDeptAll(pagebean.getCurrentPage(),pagebean.getPageSize());

			// 2把数据放到域对象
			request.setAttribute("pageBean", pagebean);
			request.setAttribute("deptList", deptList);
			// 3转发到jsp页面
			request.getRequestDispatcher("JSP/xtgl/department/listDept.jsp")
					.forward(request, response);

		} else if ("DeptGet".equals(method)) {
			DepartmentDao dao = new DepartmentDaoImpl();
			List<String> sjbhList = dao.findSjbh();
			// 2把数据放到域对象
			request.setAttribute("sjbhList", sjbhList);
			// 3转发到jsp页面
			request.getRequestDispatcher("JSP/xtgl/department/addDept.jsp").forward(
					request, response);

		} else if ("DeptAdd".equals(method)) {
			String bm_name = request.getParameter("bm_name");
			String bm_dm = request.getParameter("bm_dm");
			String bm_pxh = request.getParameter("bm_pxh");
			String bm_zdbh = request.getParameter("bm_zdbh");
			String bm_bz = request.getParameter("bm_bz");
			String sjbh = request.getParameter("sjbh");
			
			// 封装
			Department department = new Department();
			Department dept = null;
			String bm_longname = "";
			DepartmentDao dao = new DepartmentDaoImpl();
			int deptId = dao.idByDeptName(sjbh);

			if (deptId != -1) {
				dept = dao.findDeptById(deptId);
				bm_longname = dept.getBm_longname() + ">>" + bm_name;
			} else {
				bm_longname = bm_name;
			}

			department.setBm_name(bm_name);
			department.setBm_dm(bm_dm);
			department.setBm_pxh(Integer.parseInt(bm_pxh));
			department.setBm_sjjd(deptId);
			department.setBm_zdbh(bm_zdbh);
			department.setBm_bz(bm_bz);
			department.setSjbh(sjbh);
			department.setBm_longname(bm_longname);

			dao.addDepartment(department);
			String str = request.getParameter("type");
			// 重定向
			if (request.getParameter("type").equals("baocun")) {

				response.sendRedirect(request.getContextPath()
						+ "/DepartmentServlet?method=DeptList");
			} else if (request.getParameter("type").equals("savethenedit")) {

				response.sendRedirect(request.getContextPath()
						+ "/DepartmentServlet?method=DeptGet");
			}
		} else if ("DeptQuery".equals(method)) {
			int id = Integer.parseInt(request.getParameter("id"));
			DepartmentDao dao = new DepartmentDaoImpl();
			Department department = dao.findDeptById(id);
			request.setAttribute("depart", department);
			List<String> listSjbh = dao.findSjbh();
			request.setAttribute("listSjbh", listSjbh);

			// 转发到jsp
			request.getRequestDispatcher("JSP/xtgl/department/editDept.jsp")
					.forward(request, response);

		} else if ("DeptUpdate".equals(method)) {
			int id = Integer.parseInt(request.getParameter("id"));
			String bm_name = request.getParameter("bm_name");
			String bm_dm = request.getParameter("bm_dm");
			String sjbh = request.getParameter("sjbh");
			String bm_zdbh = request.getParameter("bm_zdbh");
			int bm_pxh = Integer.parseInt(request.getParameter("bm_pxh"));
			String bm_bz = request.getParameter("bm_bz");

			Department department = new Department();
			department.setId(id);
			department.setBm_name(bm_name);
			department.setBm_dm(bm_dm);
			department.setBm_pxh(bm_pxh);
			department.setBm_zdbh(bm_zdbh);
			department.setBm_bz(bm_bz);
			department.setSjbh(sjbh);

			DepartmentDao dao = new DepartmentDaoImpl();
			dao.updateDepartment(department);

			response.sendRedirect(request.getContextPath()
					+ "/DepartmentServlet?method=DeptList");
		} else if ("DeptDel".equals(method)) {
			int id = Integer.parseInt(request.getParameter("id"));
			DepartmentDao dao = new DepartmentDaoImpl();
			dao.deleteDepartment(id);
			response.sendRedirect(request.getContextPath()
					+ "/DepartmentServlet?method=DeptList");
		}
		
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
