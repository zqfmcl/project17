package com.lzcb.bigitem.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lzcb.bigitem.Entity.Tuser;
import com.lzcb.bigitem.dao.JbxxDaoImpl;
import com.lzcb.bigitem.dao.XmsbDao;
import com.lzcb.bigitem.dao.XmsbDaoImpl;
import com.lzcb.bigitem.utils.DbHelper;
import com.lzcb.bigitem.utils.PageHelper;

public class XmkServlet extends HttpServlet {
	private PageHelper page;
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

		String sqls="select xx.*,cy.cy_name,dq.dq_name," +
				"case when xx.jsjd=1 then '新开工' when xx.jsjd='2' then '续建' else '' end jsjdmc," +
				"case when shbz is null then '未审核' when shbz='T' then '已通过' when shbz='F' then '未通过' end shbzmc  " +
				"from bi_xmxx xx left join bi_cyxxb cy on xx.sscy=cy.id left join bi_dqxxb dq on xx.szqx=dq.id where ";
		XmsbDao dao=new XmsbDaoImpl();
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String method=request.getParameter("method");
		page=(PageHelper)request.getSession().getAttribute("page");
		Tuser user=(Tuser)request.getSession().getAttribute("user");
		if(user==null){
			request.getRequestDispatcher("/index.jsp").forward(request, response);
			return;
		}
		if("dnxm".equals(method)){
			String sql=sqls;
			String condition="1=1 and nf='2017' and shbz='T' ";
			String[] zyjb=request.getParameterValues("zyjb");
			String q_zyjb="";
			if(zyjb!=null){
				
				for(int i=0;i<zyjb.length;i++){
					if(i!=zyjb.length-1){
						q_zyjb=q_zyjb+"zyjb like '%"+zyjb[i]+"%' or ";
					}else{
						q_zyjb=q_zyjb+"zyjb like '%"+zyjb[i]+"%'";
					}
					
				}
			}
			String q_xmmc=request.getParameter("q_xmmc");
			String q_jsjd=request.getParameter("q_jsjd");
			String q_szqx=request.getParameter("q_szqx");
			
			
			if(q_zyjb!=null&&!"".equals(q_zyjb)){
				condition+=" and ("+q_zyjb+") ";
			}
			if(q_xmmc!=null&&!"".equals(q_xmmc)){
				condition+=" and xmmc like '%"+q_xmmc+"%' ";
			}
			if(q_jsjd!=null&&!"".equals(q_jsjd)){
				condition+=" and jsjd='"+q_jsjd+"' ";
			}
			if(q_szqx!=null&&!"".equals(q_szqx)){
				condition+=" and szqx='"+q_szqx+"' ";
			}
			
			condition +=" and  xx.szqx in ("+JbxxDaoImpl.getDQs(user.getId()+"")+") and (zyjb like '%1%' or zyjb like '%2%')";
//			condition +=" and (xx.szqx in ("+JbxxDaoImpl.getDQs(user.getId()+"")+") or xx.szqx="+user.getDq_id()+") ";
			page=PageHelper.getpage(sql+condition, 5, condition);
			List list=dao.queryTable(sql, page);
			request.getSession().setAttribute("page", page);
			request.setAttribute("list", list);
//			JSONArray jsona=dao.queryTableToJSON(sql, page);
//			String xmid=request.getParameter("xmid");
//			String msg=DbHelper.update("update bi_xmxx set shbz='F' where id="+xmid)?"操作成功":"操作失败";
//			request.setAttribute("msg", msg);
			request.getRequestDispatcher("JSP/xmk/dnzdxm.jsp").forward(request, response);
		}else if("cbxm".equals(method)){
			String sql=sqls;
			String condition="1=1 and zyjb like '%3%' and shbz='T'";
			String q_nf=request.getParameter("q_nf");
			String[] zyjb=request.getParameterValues("zyjb");
			String q_zyjb="";
			if(zyjb!=null){
				
				for(int i=0;i<zyjb.length;i++){
					if(i!=zyjb.length-1){
						q_zyjb=q_zyjb+"zyjb like '%"+zyjb[i]+"%' or ";
					}else{
						q_zyjb=q_zyjb+"zyjb like '%"+zyjb[i]+"%'";
					}
					
				}
			}
			String q_xmmc=request.getParameter("q_xmmc");
			String q_jsjd=request.getParameter("q_jsjd");
			String q_szqx=request.getParameter("q_szqx");
			
			if(q_nf!=null&&!"".equals(q_nf)){
				condition+=" and nf="+q_nf;
			}
			if(q_zyjb!=null&&!"".equals(q_zyjb)){
				condition+=" and ("+q_zyjb+") ";
			}
			if(q_xmmc!=null&&!"".equals(q_xmmc)){
				condition+=" and xmmc like '%"+q_xmmc+"%' ";
			}
			if(q_jsjd!=null&&!"".equals(q_jsjd)){
				condition+=" and jsjd='"+q_jsjd+"' ";
			}
			if(q_szqx!=null&&!"".equals(q_szqx)){
				condition+=" and szqx='"+q_szqx+"' ";
			}
			
			condition +=" and  xx.szqx in ("+JbxxDaoImpl.getDQs(user.getId()+"")+") ";
//			condition +=" and (xx.szqx in ("+JbxxDaoImpl.getDQs(user.getId()+"")+") or xx.szqx="+user.getDq_id()+") ";
			page=PageHelper.getpage(sql+condition, 5, condition);
			List list=dao.queryTable(sql, page);
			request.getSession().setAttribute("page", page);
			request.setAttribute("list", list);
//			JSONArray jsona=dao.queryTableToJSON(sql, page);
//			String xmid=request.getParameter("xmid");
//			String msg=DbHelper.update("update bi_xmxx set shbz='F' where id="+xmid)?"操作成功":"操作失败";
//			request.setAttribute("msg", msg);
			request.getRequestDispatcher("JSP/xmk/cbxm.jsp").forward(request, response);
		}else if("lnxm".equals(method)){
			String sql=sqls;
			String condition="1=1 and shbz='T'  ";
			String q_nf=request.getParameter("q_nf");
			String[] zyjb=request.getParameterValues("zyjb");
			String q_zyjb="";
			if(zyjb!=null){
				
				for(int i=0;i<zyjb.length;i++){
					if(i!=zyjb.length-1){
						q_zyjb=q_zyjb+"zyjb like '%"+zyjb[i]+"%' or ";
					}else{
						q_zyjb=q_zyjb+"zyjb like '%"+zyjb[i]+"%'";
					}
					
				}
			}
			String q_xmmc=request.getParameter("q_xmmc");
			String q_jsjd=request.getParameter("q_jsjd");
			String q_szqx=request.getParameter("q_szqx");
			
			if(q_nf!=null&&!"".equals(q_nf)){
				condition+=" and nf="+q_nf;
			}
			if(q_zyjb!=null&&!"".equals(q_zyjb)){
				condition+=" and ("+q_zyjb+") ";
			}
			if(q_xmmc!=null&&!"".equals(q_xmmc)){
				condition+=" and xmmc like '%"+q_xmmc+"%' ";
			}
			if(q_jsjd!=null&&!"".equals(q_jsjd)){
				condition+=" and jsjd='"+q_jsjd+"' ";
			}
			if(q_szqx!=null&&!"".equals(q_szqx)){
				condition+=" and szqx='"+q_szqx+"' ";
			}
			
			condition +=" and  xx.szqx in ("+JbxxDaoImpl.getDQs(user.getId()+"")+") and (zyjb like '%1%' or zyjb like '%2%')";
//			condition +=" and (xx.szqx in ("+JbxxDaoImpl.getDQs(user.getId()+"")+") or xx.szqx="+user.getDq_id()+") ";
			page=PageHelper.getpage(sql+condition, 5, condition);
			List list=dao.queryTable(sql, page);
			request.getSession().setAttribute("page", page);
			request.setAttribute("list", list);
//			JSONArray jsona=dao.queryTableToJSON(sql, page);
//			String xmid=request.getParameter("xmid");
//			String msg=DbHelper.update("update bi_xmxx set shbz='F' where id="+xmid)?"操作成功":"操作失败";
//			request.setAttribute("msg", msg);
			request.getRequestDispatcher("JSP/xmk/lnzdxm.jsp").forward(request, response);
		}else if("dnhuit".equals(method)){//否决
			String xmid=request.getParameter("xmid");
			String reasong=request.getParameter("reason");
			
			String reason=new String(reasong.getBytes("iso-8859-1"),"utf-8");
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
			String date=sdf.format(new Date());
			
			
			DbHelper.update("insert into BI_REASON(ID,XMID,ISCK,REASON,TIME) values(seq_bi_reason.nextval,"+xmid+",'F','"+reason+"','"+date+"')");
			String msg=DbHelper.update("update bi_xmxx set shbz = null where id="+xmid)?"操作成功":"操作失败";
			request.setAttribute("msg", msg);
			
			List list=dao.queryTable(sqls , page);
			request.getSession().setAttribute("page", page);
			request.setAttribute("list", list);
			request.getRequestDispatcher("JSP/xmk/dnzdxm.jsp").forward(request, response);
		}else if("cbhuit".equals(method)){//否决
			String xmid=request.getParameter("xmid");
			String reasong=request.getParameter("reason");
			
			String reason=new String(reasong.getBytes("iso-8859-1"),"utf-8");
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
			String date=sdf.format(new Date());
			DbHelper.update("insert into BI_REASON(ID,XMID,ISCK,REASON,TIME) values(seq_bi_reason.nextval,"+xmid+",'F','"+reason+"','"+date+"')");
			String msg=DbHelper.update("update bi_xmxx set shbz = null where id="+xmid)?"操作成功":"操作失败";
			request.setAttribute("msg", msg);
			
			List list=dao.queryTable(sqls , page);
			request.getSession().setAttribute("page", page);
			request.setAttribute("list", list);
			request.getRequestDispatcher("JSP/xmk/cbxm.jsp").forward(request, response);
		}else if("lnhuit".equals(method)){//否决
			String xmid=request.getParameter("xmid");
			String reasong=request.getParameter("reason");
			
			String reason=new String(reasong.getBytes("iso-8859-1"),"utf-8");
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
			String date=sdf.format(new Date());
			DbHelper.update("insert into BI_REASON(ID,XMID,ISCK,REASON,TIME) values(seq_bi_reason.nextval,"+xmid+",'F','"+reason+"','"+date+"')");
			String msg=DbHelper.update("update bi_xmxx set shbz = null where id="+xmid)?"操作成功":"操作失败";
			request.setAttribute("msg", msg);
			
			List list=dao.queryTable(sqls , page);
			request.getSession().setAttribute("page", page);
			request.setAttribute("list", list);
			request.getRequestDispatcher("JSP/xmk/lnzdxm.jsp").forward(request, response);
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
