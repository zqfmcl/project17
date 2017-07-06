package com.lzcb.bigitem.servlet;

import java.io.IOException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import com.lzcb.bigitem.Entity.Tuser;
import com.lzcb.bigitem.dao.JbxxDaoImpl;
import com.lzcb.bigitem.dao.MessageDao;
import com.lzcb.bigitem.dao.MessageDaoImpl;
import com.lzcb.bigitem.dao.TbdataDao;
import com.lzcb.bigitem.dao.TbdataDaoImpl;
import com.lzcb.bigitem.dao.XmsbDao;
import com.lzcb.bigitem.dao.XmsbDaoImpl;
import com.lzcb.bigitem.utils.DbHelper;
import com.lzcb.bigitem.utils.ExeclHelper;
import com.lzcb.bigitem.utils.PageHelper;
import com.lzcb.bigitem.utils.WordHelper;

public class XmsbServlet extends HttpServlet {
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
		TbdataDao tbdao=new TbdataDaoImpl();
		if(user==null){
			request.getRequestDispatcher("/index.jsp").forward(request, response);
			return;
		}
		if("add".equals(method)){
			String cont=request.getParameter("cont");
			String msg=dao.addXmxx(request)?"操作成功":"操作失败";
			tbdao.zbxmqkData();
			tbdao.dqxmslData();
			tbdao.xmtzfwData();
			request.setAttribute("msg", msg);
			request.getSession().setAttribute("page", page);
			if(cont!=null&&"1".equals(cont)){
				request.getRequestDispatcher("JSP/zdxmsb/zdxmsb_add.jsp").forward(request, response);
			}else{
				List list=dao.queryTable(sqls , page);
				request.setAttribute("list", list);
				request.getRequestDispatcher("JSP/zdxmsb/zdxmsb_main.jsp").forward(request, response);
			}
		}else if("update".equals(method)){
			String msg=dao.updateXmxx(request,request.getParameter("xmid"))?"操作成功":"操作失败";
			request.setAttribute("msg", msg);
			tbdao.zbxmqkData();
			tbdao.dqxmslData();
			tbdao.xmtzfwData();
			MessageDao mdao=new MessageDaoImpl();
			int xmid=Integer.parseInt(request.getParameter("xmid"));
			
			mdao.updateXmShzt(xmid);

			List list=dao.queryTable(sqls , page);
			request.getSession().setAttribute("page", page);
			request.setAttribute("list", list);
			request.getRequestDispatcher("JSP/zdxmsb/zdxmsb_main.jsp").forward(request, response);
		}else if("del".equals(method)){
			String xmid=request.getParameter("xmid");
			String msg=DbHelper.update("delete from bi_xmxx where id="+xmid)?"操作成功":"操作失败";
			if("操作成功".equals(msg))DbHelper.update("delete from fujian where ssbm='bi_xmxx' and ssjldm="+xmid);
			request.setAttribute("msg", msg);
			tbdao.zbxmqkData();
			tbdao.dqxmslData();
			tbdao.xmtzfwData();

			List list=dao.queryTable(sqls , page);
			request.getSession().setAttribute("page", page);
			request.setAttribute("list", list);
			request.getRequestDispatcher("JSP/zdxmsb/zdxmsb_main.jsp").forward(request, response);
		}else if("shenh".equals(method)){//审核
			String xmid=request.getParameter("xmid");
			String msg=DbHelper.update("update bi_xmxx set shbz='T' where id="+xmid)?"操作成功":"操作失败";
			request.setAttribute("msg", msg);

			List list=dao.queryTable(sqls , page);
			request.getSession().setAttribute("page", page);
			request.setAttribute("list", list);
			request.getRequestDispatcher("JSP/zdxmsb/zdxmsb_main.jsp").forward(request, response);
		}else if("fouj".equals(method)){//否决
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
			String date=sdf.format(new Date());
			String xmid=request.getParameter("xmid");
			String reasong=request.getParameter("reason");
			String reason=new String(reasong.getBytes("iso-8859-1"),"utf-8");
			
			DbHelper.update("insert into BI_REASON(ID,XMID,ISCK,REASON,TIME) values(seq_bi_reason.nextval,"+xmid+",'F','"+reason+"','"+date+"')");
			String msg=DbHelper.update("update bi_xmxx set shbz='F' where id="+xmid)?"操作成功":"操作失败";
			request.setAttribute("msg", msg);
			
			List list=dao.queryTable(sqls , page);
			request.getSession().setAttribute("page", page);
			request.setAttribute("list", list);
			request.getRequestDispatcher("JSP/zdxmsb/zdxmsb_main.jsp").forward(request, response);
		}else if("select".equals(method)){//查询
			String sql=sqls;
			String condition="1=1 and (shbz is null or shbz='F') ";
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
			
			condition +=" and (xx.szqx in ("+JbxxDaoImpl.getDQs(user.getId()+"")+") or xx.szqx="+user.getDq_id()+") ";
			page=PageHelper.getpage(sql+condition, 5, condition);
			List list=dao.queryTable(sql, page);
			request.getSession().setAttribute("page", page);
			request.setAttribute("list", list);
//			JSONArray jsona=dao.queryTableToJSON(sql, page);
//			String xmid=request.getParameter("xmid");
//			String msg=DbHelper.update("update bi_xmxx set shbz='F' where id="+xmid)?"操作成功":"操作失败";
//			request.setAttribute("msg", msg);
			request.getRequestDispatcher("JSP/zdxmsb/zdxmsb_main.jsp").forward(request, response);
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
//			String xmid=request.getParameter("xmid");
//			String msg=DbHelper.update("update bi_xmxx set shbz='F' where id="+xmid)?"操作成功":"操作失败";
//			request.setAttribute("msg", msg);
			request.getRequestDispatcher("JSP/zdxmsb/zdxmsb_main.jsp").forward(request, response);
		}else if("chgPage".equals(method)){
			String sql=sqls;
			int pageNum=Integer.parseInt(request.getParameter("pNum"));
			page=PageHelper.getpage(sql+page.getCondition(), pageNum, page.getCondition());
			List list=dao.queryTable(sql, page);
			request.getSession().setAttribute("page", page);
			request.setAttribute("list", list);
			request.getRequestDispatcher("JSP/zdxmsb/zdxmsb_main.jsp").forward(request, response);
		}else if("show".equals(method)){
			String xmid=request.getParameter("xmid");
			String sql="select xx.*,cy.cy_name,dq.dq_name," +
				"case when xx.zyjb='1' then '市重大' when xx.zyjb='2' then '区重点' when xx.zyjb='3'then '储备项目' else '请选择' end zyjbmc," +
				"case when xx.jsjd=1 then '新开工' when xx.jsjd='2' then '续建' else '' end jsjdmc," +
				"dq.dq_name dqmc,cy.cy_name cymc from bi_xmxx xx left join bi_cyxxb cy on xx.sscy=cy.id left join bi_dqxxb dq on xx.szqx=dq.id " +
				"where xx.id="+xmid+" ";
			Map<String, Object> xmxx=DbHelper.queryARow(sql);
			request.setAttribute("xmxx", xmxx);
			request.getRequestDispatcher("JSP/zdxmsb/zdxmsb_show.jsp").forward(request, response);
		}else if("exlExp".equals(method)){
			String sql="select xx.*,cy.cy_name,dq.dq_name," +
					"case when xx.zyjb='1' then '市重大' when xx.zyjb='2' then '区重点' when xx.zyjb='3'then '储备项目' else '请选择' end zyjbmc," +
					"case when xx.jsjd=1 then '新开工' when xx.jsjd='2' then '续建' else '' end jsjdmc," +
					"case when shbz is null then '未审核' when shbz='T' then '已通过' when shbz='F' then '未通过' end shbzmc  " +
					"from bi_xmxx xx left join bi_cyxxb cy on xx.sscy=cy.id left join bi_dqxxb dq on xx.szqx=dq.id where ";
			List list=dao.queryTable(sql, page);
			response.setContentType("application/vnd.ms-excel");//设置生成的文件类型
			response.setHeader("content-disposition", "attachment;filename=" + URLEncoder.encode("申报信息表.xls", "UTF-8"));
			ExeclHelper.execlExport("申报信息表", 
					JSONObject.fromObject("{'XMMC':'项目名称'," +
							"'NF':'年份'," +
							"'JSDWMC':'建设单位'," +
							"'GMJJSNR':'建设规模及主要内容'," +
							"'JSJDMC':'建设阶段'," +
							"'CY_NAME':'所属产业'," +
							"'ZTZ':'总投资'," +
							"'NDJHTZ':'年度计划投资'," +
							"'DNJSNR':'当年建设内容'," +
							"'SBNTZ':'上半年投资'," +
							"'SBNXXJD':'上半年形象进度'," +
							"'XBNTZ':'下半年投资'," +
							"'XBNXXJD':'下半年形象进度'}"), 
					list, response.getOutputStream());
			response.getOutputStream().flush();
			response.getOutputStream().close();
//			ExeclHelper.test();
		}else if("docExp".equals(method)){
			String xmid=request.getParameter("xmid");
			String sql="select xx.*,cy.cy_name,dq.dq_name," +
				"case when xx.zyjb='1' then '市重大' when xx.zyjb='2' then '区重点' when xx.zyjb='3'then '储备项目' else '请选择' end zyjbmc," +
				"case when xx.jsjd=1 then '新开工' when xx.jsjd='2' then '续建' else '' end jsjdmc," +
				"dq.dq_name dqmc,cy.cy_name cymc from bi_xmxx xx left join bi_cyxxb cy on xx.sscy=cy.id left join bi_dqxxb dq on xx.szqx=dq.id " +
				"where xx.id="+xmid+" ";
			Map<String, Object> xmxx=DbHelper.queryARow(sql);
			response.setContentType("application/msword");
			response.setHeader("content-disposition", "attachment;filename=" + URLEncoder.encode(xmxx.get("XMMC")+".doc", "UTF-8"));
			WordHelper.XmsbWordExp(xmxx, response.getOutputStream());
		}else if("fenycb".equals(method)){//分页
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
//			String xmid=request.getParameter("xmid");
//			String msg=DbHelper.update("update bi_xmxx set shbz='F' where id="+xmid)?"操作成功":"操作失败";
//			request.setAttribute("msg", msg);
			request.getRequestDispatcher("JSP/xmk/cbxm.jsp").forward(request, response);
		}else if("chgPagecb".equals(method)){
			String sql=sqls;
			int pageNum=Integer.parseInt(request.getParameter("pNum"));
			page=PageHelper.getpage(sql+page.getCondition(), pageNum, page.getCondition());
			List list=dao.queryTable(sql, page);
			request.getSession().setAttribute("page", page);
			request.setAttribute("list", list);
			request.getRequestDispatcher("JSP/xmk/cbxm.jsp").forward(request, response);
		}else if("fenydn".equals(method)){//分页
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
//			String xmid=request.getParameter("xmid");
//			String msg=DbHelper.update("update bi_xmxx set shbz='F' where id="+xmid)?"操作成功":"操作失败";
//			request.setAttribute("msg", msg);
			request.getRequestDispatcher("JSP/xmk/dnzdxm.jsp").forward(request, response);
		}else if("chgPagedn".equals(method)){
			String sql=sqls;
			int pageNum=Integer.parseInt(request.getParameter("pNum"));
			page=PageHelper.getpage(sql+page.getCondition(), pageNum, page.getCondition());
			List list=dao.queryTable(sql, page);
			request.getSession().setAttribute("page", page);
			request.setAttribute("list", list);
			request.getRequestDispatcher("JSP/xmk/dnzdxm.jsp").forward(request, response);
		}else if("fenyln".equals(method)){//分页
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
//			String xmid=request.getParameter("xmid");
//			String msg=DbHelper.update("update bi_xmxx set shbz='F' where id="+xmid)?"操作成功":"操作失败";
//			request.setAttribute("msg", msg);
			request.getRequestDispatcher("JSP/xmk/lnzdxm.jsp").forward(request, response);
		}else if("chgPageln".equals(method)){
			String sql=sqls;
			int pageNum=Integer.parseInt(request.getParameter("pNum"));
			page=PageHelper.getpage(sql+page.getCondition(), pageNum, page.getCondition());
			List list=dao.queryTable(sql, page);
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
