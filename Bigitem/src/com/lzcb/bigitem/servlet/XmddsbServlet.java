package com.lzcb.bigitem.servlet;

import java.io.IOException;
import java.io.OutputStream;
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
import com.lzcb.bigitem.Entity.Xmddgl;
import com.lzcb.bigitem.Entity.Xmxx;
import com.lzcb.bigitem.dao.JbxxDaoImpl;
import com.lzcb.bigitem.dao.MessageDao;
import com.lzcb.bigitem.dao.MessageDaoImpl;
import com.lzcb.bigitem.dao.XmddsbDao;
import com.lzcb.bigitem.dao.XmddsbImpl;
import com.lzcb.bigitem.utils.BeanRefUtil;
import com.lzcb.bigitem.utils.DbHelper;
import com.lzcb.bigitem.utils.ExeclHelper;
import com.lzcb.bigitem.utils.PageHelper;

public class XmddsbServlet extends HttpServlet {
	private PageHelper page;
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String sqls="select ll.*,xx.xmmc,xx.szqx from bi_xmddgl ll left join bi_xmxx xx on ll.xm=xx.id where ";
		
		
		XmddsbDao dao=new XmddsbImpl();
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String method=request.getParameter("method");
		page=(PageHelper)request.getSession().getAttribute("page");
		if("add".equals(method)){
			String msg=dao.addXmddsb(request,request.getParameter("ddid"))?"操作成功":"操作失败";
			//System.out.println("YYY"+request.getParameter("ddid"));
			request.setAttribute("msg", msg);

			List list=dao.queryTable(sqls , page);
			request.getSession().setAttribute("page", page);
			request.setAttribute("list", list);
			request.getRequestDispatcher("JSP/xmddgl/xmddglsb_main.jsp").forward(request, response);
		}else if("update".equals(method)){
			String msg=dao.updateXmddsb(request,request.getParameter("xmid"))?"操作成功":"操作失败";
			request.setAttribute("msg", msg);
			MessageDao medao=new MessageDaoImpl();
			medao.updateDdShzt(Integer.parseInt(request.getParameter("xmid")));
			List list=dao.queryTable(sqls , page);
			request.getSession().setAttribute("page", page);
			request.setAttribute("list", list);
			request.getRequestDispatcher("JSP/xmddgl/xmddglsb_main.jsp").forward(request, response);
		}else if("update2".equals(method)){
			String msg=dao.updateXmddsb(request,request.getParameter("xmid"))?"操作成功":"操作失败";
			request.setAttribute("msg", msg);
//			MessageDao medao=new MessageDaoImpl();
//			medao.updateDdShzt(Integer.parseInt(request.getParameter("xmid")));
			List list=dao.queryTable(sqls , page);
			request.getSession().setAttribute("page", page);
			request.setAttribute("list", list);
			request.getRequestDispatcher("JSP/xmddgl/xmddglsb_main2.jsp").forward(request, response);
		}else if("del".equals(method)){
			String xmid=request.getParameter("xmid");
			String msg=DbHelper.update("delete from bi_xmddgl where id="+xmid)?"操作成功":"操作失败";
			if("操作成功".equals(msg))DbHelper.update("delete from fujian where ssbm='bi_xmddgl' and ssjldm="+xmid);
			request.setAttribute("msg", msg);

			List list=dao.queryTable(sqls , page);
			request.getSession().setAttribute("page", page);
			request.setAttribute("list", list);
			request.getRequestDispatcher("JSP/xmddgl/xmddglsb_main.jsp").forward(request, response);
		}else if("shenh".equals(method)){//审核
			String xmid=request.getParameter("xmid");
			String msg=DbHelper.update("update bi_xmddgl set shbs='已审核' where id="+xmid)?"操作成功":"操作失败";
			request.setAttribute("msg", msg);
			
			String sql="select XM,LXSFBJ,LXJZQK,LXSXWH,LXSCFJ,HPSFBJ,HPJZQK,HPSXWH,HPSCFJ,TDSFBJ,TDJZQK,TDSXWH,TDSCFJ,LDSFBJ,LDJZQK,LDSXWH,LDSCFJ,APSFBJ,APJZQK,APSXWH,APSCFJ,GCGHXKSFBJ,GCGHXKJZQK,GCGHXKSXWH,GCGHXKSCFJ,XFXKSFBJ,XFXKJZQK,XFXKSXWH,XFXKSCFJ,SGSFBJ,SGJZQK,SGSXWH,SGSCFJ from bi_xmddgl  where id="+xmid;
			Map<String, Object> xmdd=DbHelper.queryARow(sql);
			//request.setAttribute("xmdd", xmdd);
			List<Map<String,Object>> fjlist=DbHelper.queryForTable("select * from fujian fj where fj.ssbm='bi_xmddgl' and fj.ssjldm="+xmid+" order by ssjlzd");
			System.out.println("TTTTT1"+fjlist);
			
//			Map m1=fjlist.get(1);
//			String sql3="insert into fujian values(seq_fujian.nextval,'"+m1.get("WJMC")+"','bi_xmxx',"+(xmdd.get("XM")!=null?"":xmdd.get("XM"))+",'"+m1.get("WJLJ")+"','"+m1.get("SJMC")+"','','"+m1.get("SSJLZD")+"')";
//			System.out.println("TTTTT2"+sql3);
			
	  		//String msg2=DbHelper.update("insert into fujian values(seq_fujian.nextval,'"+m.get("WJMC")+"','bi_xmxx',"+xmdd.get("XM")!=null?"":xmdd.get("XM")+",'"+m.get("WJLJ")+"','"+m.get("SJMC")+"','','"+m.get("SSJLZD")+"')")?"操作成功":"操作失败";
			for(int i=0;i<fjlist.size();i++){
		  		Map m=fjlist.get(i);
		  		
		  		String msg2=DbHelper.update("insert into fujian values(seq_fujian.nextval,'"+m.get("WJMC")+"','bi_xmxx',"+xmdd.get("XM")+",'"+m.get("WJLJ")+"','"+m.get("SJMC")+"','','"+m.get("SSJLZD")+"')")?"操作成功":"操作失败";
		  		System.out.println("TTTTT2"+msg2);
		 	}
			
//			Xmxx xx1=new Xmxx();
//			xx1.setLxscfj(xmdd.get("LXSFBJ").toString());
			
			
			String updsql="update bi_xmxx set ";
			if(xmdd.get("LXSFBJ")!=null)updsql+="LXSFBJ='"+xmdd.get("LXSFBJ")+"',";
			if(xmdd.get("LXJZQK")!=null)updsql+="LXJZQK='"+xmdd.get("LXJZQK")+"',";
			if(xmdd.get("LXSXWH")!=null)updsql+="LXSXWH='"+xmdd.get("LXSXWH")+"',";
			if(xmdd.get("LXSCFJ")!=null)updsql+="LXSCFJ='"+xmdd.get("LXSCFJ")+"',";
			if(xmdd.get("HPSFBJ")!=null)updsql+="HPSFBJ='"+xmdd.get("HPSFBJ")+"',";
			if(xmdd.get("HPJZQK")!=null)updsql+="HPJZQK='"+xmdd.get("HPJZQK")+"',";
			if(xmdd.get("HPSXWH")!=null)updsql+="HPSXWH='"+xmdd.get("HPSXWH")+"',";
			if(xmdd.get("HPSCFJ")!=null)updsql+="HPSCFJ='"+xmdd.get("HPSCFJ")+"',";
			if(xmdd.get("TDSFBJ")!=null)updsql+="TDSFBJ='"+xmdd.get("TDSFBJ")+"',";
			if(xmdd.get("TDJZQK")!=null)updsql+="TDJZQK='"+xmdd.get("TDJZQK")+"',";
			if(xmdd.get("TDSXWH")!=null)updsql+="TDSXWH='"+xmdd.get("TDSXWH")+"',";
			if(xmdd.get("TDSCFJ")!=null)updsql+="TDSCFJ='"+xmdd.get("TDSCFJ")+"',";
			if(xmdd.get("LDSFBJ")!=null)updsql+="LDSFBJ='"+xmdd.get("LDSFBJ")+"',";
			if(xmdd.get("LDJZQK")!=null)updsql+="LDJZQK='"+xmdd.get("LDJZQK")+"',";
			if(xmdd.get("LDSXWH")!=null)updsql+="LDSXWH='"+xmdd.get("LDSXWH")+"',";
			if(xmdd.get("LDSCFJ")!=null)updsql+="LDSCFJ='"+xmdd.get("LDSCFJ")+"',";
			if(xmdd.get("APSFBJ")!=null)updsql+="APSFBJ='"+xmdd.get("APSFBJ")+"',";
			if(xmdd.get("APJZQK")!=null)updsql+="APJZQK='"+xmdd.get("APJZQK")+"',";
			if(xmdd.get("APSXWH")!=null)updsql+="APSXWH='"+xmdd.get("APSXWH")+"',";
			if(xmdd.get("APSCFJ")!=null)updsql+="APSCFJ='"+xmdd.get("APSCFJ")+"',";
			if(xmdd.get("GCGHXKSFBJ")!=null)updsql+="GCGHXKSFBJ='"+xmdd.get("GCGHXKSFBJ")+"',";
			if(xmdd.get("GCGHXKJZQK")!=null)updsql+="GCGHXKJZQK='"+xmdd.get("GCGHXKJZQK")+"',";
			if(xmdd.get("GCGHXKSXWH")!=null)updsql+="GCGHXKSXWH='"+xmdd.get("GCGHXKSXWH")+"',";
			if(xmdd.get("GCGHXKSCFJ")!=null)updsql+="GCGHXKSCFJ='"+xmdd.get("GCGHXKSCFJ")+"',";
			if(xmdd.get("XFXKSFBJ")!=null)updsql+="XFXKSFBJ='"+xmdd.get("XFXKSFBJ")+"',";
			if(xmdd.get("XFXKJZQK")!=null)updsql+="XFXKJZQK='"+xmdd.get("XFXKJZQK")+"',";
			if(xmdd.get("XFXKSXWH")!=null)updsql+="XFXKSXWH='"+xmdd.get("XFXKSXWH")+"',";
			if(xmdd.get("XFXKSCFJ")!=null)updsql+="XFXKSCFJ='"+xmdd.get("XFXKSCFJ")+"',";
			if(xmdd.get("SGSFBJ")!=null)updsql+="SGSFBJ='"+xmdd.get("SGSFBJ")+"',";
			if(xmdd.get("SGJZQK")!=null)updsql+="SGJZQK='"+xmdd.get("SGJZQK")+"',";
			if(xmdd.get("SGSXWH")!=null)updsql+="SGSXWH='"+xmdd.get("SGSXWH")+"',";
			if(xmdd.get("SGSCFJ")!=null)updsql+="SGSCFJ='"+xmdd.get("SGSCFJ")+"',";
			updsql=updsql.substring(0, updsql.length()-1);
			if(xmdd.get("XM")!=null)updsql+=" where id='"+xmdd.get("XM")+"'";
			
			
				
			//if(xmdd.get("XM")!=null){String msg2=dao.addXmddsb1(request,xmdd.get("XM").toString())?"操作成功":"操作失败";}
			
			String msg1=DbHelper.update(updsql)?"操作成功":"操作失败";
			List list=dao.queryTable(sqls , page);
			request.getSession().setAttribute("page", page);
			request.setAttribute("list", list);
			request.getRequestDispatcher("JSP/xmddgl/xmddglsb_main.jsp").forward(request, response);
		}else if("fouj".equals(method)){//否决
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
			String date=sdf.format(new Date());
			String xmid2=request.getParameter("xmid2");
			String ddid=request.getParameter("ddid");
			String reasong=request.getParameter("reason");
			String reason=new String(reasong.getBytes("iso-8859-1"),"utf-8");
			
			DbHelper.update("insert into BI_REASON(ID,DDID,ISCK,REASON,TIME,XMID2,TYPE) values(seq_bi_reason.nextval,"+ddid+",'F','"+reason+"','"+date+"',"+xmid2+",1)");
			
			String msg=DbHelper.update("update bi_xmddgl set shbs='未通过' where id="+ddid)?"操作成功":"操作失败";
			request.setAttribute("msg", msg);
			
			List list=dao.queryTable(sqls , page);
			request.getSession().setAttribute("page", page);
			request.setAttribute("list", list);
			request.getRequestDispatcher("JSP/xmddgl/xmddglsb_main.jsp").forward(request, response);
//			String msg=DbHelper.update("update bi_xmddgl set shbs='未通过' where id="+ddid)?"操作成功":"操作失败";
//			request.setAttribute("msg", msg);
//			
//			List list=dao.queryTable(sqls , page);
//			request.getSession().setAttribute("page", page);
//			request.setAttribute("list", list);
//			request.getRequestDispatcher("JSP/xmddgl/xmddglsb_main.jsp").forward(request, response);
		}else if("chongtj".equals(method)){//重新提交
//			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
//			String date=sdf.format(new Date());
//			String xmid2=request.getParameter("xmid2");
//			String ddid=request.getParameter("ddid");
//			String reasong=request.getParameter("reason");
//			String reason=new String(reasong.getBytes("iso-8859-1"),"utf-8");
			
//			DbHelper.update("insert into BI_REASON(ID,DDID,ISCK,REASON,TIME,XMID2,TYPE) values(seq_bi_reason.nextval,"+ddid+",'F','"+reason+"','"+date+"',"+xmid2+",1)");
			
//			String msg=DbHelper.update("update bi_xmddgl set shbs= null where id="+ddid)?"操作成功":"操作失败";
//			request.setAttribute("msg", msg);
//			
//			List list=dao.queryTable(sqls , page);
//			request.getSession().setAttribute("page", page);
//			request.setAttribute("list", list);
//			request.getRequestDispatcher("JSP/xmddgl/xmddglsb_main2.jsp").forward(request, response);
//			String msg=DbHelper.update("update bi_xmddgl set shbs='未通过' where id="+ddid)?"操作成功":"操作失败";
//			request.setAttribute("msg", msg);
//			
//			List list=dao.queryTable(sqls , page);
//			request.getSession().setAttribute("page", page);
//			request.setAttribute("list", list);
//			request.getRequestDispatcher("JSP/xmddgl/xmddglsb_main.jsp").forward(request, response);
			String xmid=request.getParameter("xmid");
			String msg=DbHelper.update("update bi_xmddgl set shbs=null where id="+xmid)?"操作成功":"操作失败";
			request.setAttribute("msg", msg);
			
			List list=dao.queryTable(sqls , page);
			request.getSession().setAttribute("page", page);
			request.setAttribute("list", list);
			request.getRequestDispatcher("JSP/xmddgl/xmddglsb_main2.jsp").forward(request, response);
		}else if("select".equals(method)){//查询
			//System.out.println("xxx"+response);
			Tuser user=(Tuser)request.getSession().getAttribute("user");
			String sql=sqls;
			String condition="1=1 and shbs is null ";
			String q_yf=request.getParameter("q_yf");
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
			String q_xmmc=request.getParameter("q_xm");
			String q_jsjd=request.getParameter("q_jsjd");
			String q_szqx=request.getParameter("q_szqx");
			
			if(q_yf!=null&&!"".equals(q_yf)){
				condition+=" and yf="+q_yf;
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
			
//			condition +=" and (xx.szqx in ("+JbxxDaoImpl.getDQs(user.getId()+"")+") or xx.szqx="+user.getDq_id()+") ";
			condition +=" and xx.szqx in ("+JbxxDaoImpl.getDQs(user.getId()+"")+") ";
			page=PageHelper.getpage(sql+condition, 5, condition);
			List list=dao.queryTable(sql, page);
			request.getSession().setAttribute("page", page);
			request.setAttribute("list", list);
			request.getRequestDispatcher("JSP/xmddgl/xmddglsb_main.jsp").forward(request, response);
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
			request.getRequestDispatcher("JSP/xmddgl/xmddglsb_main.jsp").forward(request, response);
		}else if("chgPage".equals(method)){
			String sql=sqls;
			int pageNum=Integer.parseInt(request.getParameter("pNum"));
			page=PageHelper.getpage(sql+page.getCondition(), pageNum, page.getCondition());
			List list=dao.queryTable(sql, page);
			request.getSession().setAttribute("page", page);
			request.setAttribute("list", list);
			request.getRequestDispatcher("JSP/xmddgl/xmddglsb_main.jsp").forward(request, response);
		}else if("show".equals(method)){
			String xmid=request.getParameter("xmid");
			String sql="select ll.*,xx.xmmc from bi_xmddgl ll left join bi_xmxx xx on ll.xm=xx.id where " +
				" ll.id="+xmid;
			Map<String, Object> xmddgl=DbHelper.queryARow(sql);
			request.setAttribute("xmddgl", xmddgl);
			request.getRequestDispatcher("JSP/xmddgl/xmddglsb_show.jsp").forward(request, response);
		}else if("exlExp".equals(method)){
			String sql="select ll.*,xx.xmmc,xx.szqx from bi_xmddgl ll left join bi_xmxx xx on ll.xm=xx.id where ";
			List list=dao.queryTable(sql, page);
			//System.out.println(list);
			response.setContentType("application/vnd.ms-excel");//设置生成的文件类型
			response.setHeader("content-disposition", "attachment;filename=" + URLEncoder.encode("申报调度表.xls", "UTF-8"));
			OutputStream o=response.getOutputStream();
			ExeclHelper.execlExport("申报信息表", JSONObject.fromObject("{'XM':'项目名称','YF':'月份','JSDW':'建设单位'}"), list, o);
			response.getOutputStream().flush();
			response.getOutputStream().close();
		}else if("getxm".equals(method)){
			String xmid=request.getParameter("xmid");
			String sql="select xx.* from bi_xmxx xx " +
				"where xx.id="+xmid;
			Map<String, Object> xmxx=DbHelper.queryARow(sql);
			request.setAttribute("xmxx", xmxx);
			request.getRequestDispatcher("JSP/xmddgl/xmddglsb_add.jsp").forward(request, response);
		}else if("delpic".equals(method)){
			String fjid=request.getParameter("fjid");
			boolean msg=DbHelper.update("delete from fujian where id="+fjid);
			response.setCharacterEncoding("utf-8");
			response.getWriter().print("{errcode:'"+(msg?0:-1)+"',msg:'"+(msg?"删除成功！":"删除失败")+"'}");
		}
		else if("select1".equals(method)){//查询
			//System.out.println("xxx"+response);
			Tuser user=(Tuser)request.getSession().getAttribute("user");
			String sql=sqls;
			String condition="1=1 and shbs='已审核' ";
			String q_yf=request.getParameter("q_yf");
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
			String q_xmmc=request.getParameter("q_xm");
			String q_jsjd=request.getParameter("q_jsjd");
			String q_szqx=request.getParameter("q_szqx");
			
			if(q_yf!=null&&!"".equals(q_yf)){
				condition+=" and yf="+q_yf;
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

			condition +=" and xx.szqx in ("+JbxxDaoImpl.getDQs(user.getId()+"")+")  ";
//			condition +=" and (xx.szqx in ("+JbxxDaoImpl.getDQs(user.getId()+"")+") or xx.szqx="+user.getDq_id()+") ";
			page=PageHelper.getpage(sql+condition, 5, condition);
			List list=dao.queryTable(sql, page);
			request.getSession().setAttribute("page", page);
			request.setAttribute("list", list);
			request.getRequestDispatcher("JSP/xmddgl/xmddglsb_main1.jsp").forward(request, response);
		}
		else if("select2".equals(method)){//查询
			//System.out.println("xxx"+response);
			Tuser user=(Tuser)request.getSession().getAttribute("user");
			String sql=sqls;
			String condition="1=1 and shbs='未通过' ";
			String q_yf=request.getParameter("q_yf");
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
			String q_xmmc=request.getParameter("q_xm");
			String q_jsjd=request.getParameter("q_jsjd");
			String q_szqx=request.getParameter("q_szqx");
			String q_sscy=request.getParameter("q_sscy");
			if(q_yf!=null&&!"".equals(q_yf)){
				condition+=" and yf="+q_yf;
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
			
			condition +=" and xx.szqx in ("+JbxxDaoImpl.getDQs(user.getId()+"")+") ";
//			condition +=" and (xx.szqx in ("+JbxxDaoImpl.getDQs(user.getId()+"")+") or xx.szqx="+user.getDq_id()+") ";
			page=PageHelper.getpage(sql+condition, 5, condition);
			List list=dao.queryTable(sql, page);
			request.getSession().setAttribute("page", page);
			request.setAttribute("list", list);
			request.getRequestDispatcher("JSP/xmddgl/xmddglsb_main2.jsp").forward(request, response);
		}else if("fouj1".equals(method)){//否决
//			String xmid=request.getParameter("xmid");
//			String msg=DbHelper.update("update bi_xmddgl set shbs='未通过' where id="+xmid)?"操作成功":"操作失败";
//			request.setAttribute("msg", msg);
//			
//			List list=dao.queryTable(sqls , page);
//			request.getSession().setAttribute("page", page);
//			request.setAttribute("list", list);
//			request.getRequestDispatcher("JSP/xmddgl/xmddglsb_main1.jsp").forward(request, response);
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
			String date=sdf.format(new Date());
			String xmid2=request.getParameter("xmid2");
			String ddid=request.getParameter("ddid");
			String reasong=request.getParameter("reason");
			String reason=new String(reasong.getBytes("iso-8859-1"),"utf-8");
			
			DbHelper.update("insert into BI_REASON(ID,DDID,ISCK,REASON,TIME,XMID2,TYPE) values(seq_bi_reason.nextval,"+ddid+",'F','"+reason+"','"+date+"',"+xmid2+",1)");
			
			String msg=DbHelper.update("update bi_xmddgl set shbs='未通过' where id="+ddid)?"操作成功":"操作失败";
			request.setAttribute("msg", msg);
			
			List list=dao.queryTable(sqls , page);
			request.getSession().setAttribute("page", page);
			request.setAttribute("list", list);
			request.getRequestDispatcher("JSP/xmddgl/xmddglsb_main1.jsp").forward(request, response);
		}else if("fouj2".equals(method)){//否决
//			String xmid=request.getParameter("xmid");
//			String msg=DbHelper.update("update bi_xmddgl set shbs='未通过' where id="+xmid)?"操作成功":"操作失败";
//			request.setAttribute("msg", msg);
//			
//			List list=dao.queryTable(sqls , page);
//			request.getSession().setAttribute("page", page);
//			request.setAttribute("list", list);
//			request.getRequestDispatcher("JSP/xmddgl/xmddglsb_main2.jsp").forward(request, response);
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
			String date=sdf.format(new Date());
			String xmid2=request.getParameter("xmid2");
			String ddid=request.getParameter("ddid");
			String reasong=request.getParameter("reason");
			String reason=new String(reasong.getBytes("iso-8859-1"),"utf-8");
			
			DbHelper.update("insert into BI_REASON(ID,DDID,ISCK,REASON,TIME,XMID2,TYPE) values(seq_bi_reason.nextval,"+ddid+",'F','"+reason+"','"+date+"',"+xmid2+",1)");
			
			String msg=DbHelper.update("update bi_xmddgl set shbs='未通过' where id="+ddid)?"操作成功":"操作失败";
			request.setAttribute("msg", msg);
			
			List list=dao.queryTable(sqls , page);
			request.getSession().setAttribute("page", page);
			request.setAttribute("list", list);
			request.getRequestDispatcher("JSP/xmddgl/xmddglsb_main2.jsp").forward(request, response);
		}else if("feny1".equals(method)){//分页
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
			request.getRequestDispatcher("JSP/xmddgl/xmddglsb_main1.jsp").forward(request, response);
		}else if("chgPage1".equals(method)){
			String sql=sqls;
			int pageNum=Integer.parseInt(request.getParameter("pNum"));
			page=PageHelper.getpage(sql+page.getCondition(), pageNum, page.getCondition());
			List list=dao.queryTable(sql, page);
			request.getSession().setAttribute("page", page);
			request.setAttribute("list", list);
			request.getRequestDispatcher("JSP/xmddgl/xmddglsb_main1.jsp").forward(request, response);
		}else if("feny2".equals(method)){//分页
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
			request.getRequestDispatcher("JSP/xmddgl/xmddglsb_main2.jsp").forward(request, response);
		}else if("chgPage2".equals(method)){
			String sql=sqls;
			int pageNum=Integer.parseInt(request.getParameter("pNum"));
			page=PageHelper.getpage(sql+page.getCondition(), pageNum, page.getCondition());
			List list=dao.queryTable(sql, page);
			request.getSession().setAttribute("page", page);
			request.setAttribute("list", list);
			request.getRequestDispatcher("JSP/xmddgl/xmddglsb_main2.jsp").forward(request, response);
		}else if("huit".equals(method)){//回退
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
			String date=sdf.format(new Date());
			String xmid2=request.getParameter("xmid2");
			String ddid=request.getParameter("ddid");
		    String reasong=request.getParameter("reason");
			String reason=new String(reasong.getBytes("iso-8859-1"),"utf-8");
			
			DbHelper.update("insert into BI_REASON(ID,DDID,ISCK,REASON,TIME,XMID2,TYPE) values(seq_bi_reason.nextval,"+ddid+",'F','"+reason+"','"+date+"',"+xmid2+",1)");
			String msg=DbHelper.update("update bi_xmddgl set shbs = null where id="+ddid)?"操作成功":"操作失败";
			request.setAttribute("msg", msg);
			
			List list=dao.queryTable(sqls , page);
			request.getSession().setAttribute("page", page);
			request.setAttribute("list", list);
			request.getRequestDispatcher("JSP/xmddgl/xmddglsb_main.jsp").forward(request, response);
		}else if("huit1".equals(method)){//回退
			String xmid2=request.getParameter("xmid2");
			String ddid=request.getParameter("ddid");
			String reasong=request.getParameter("reason");
			
			String reason=new String(reasong.getBytes("iso-8859-1"),"utf-8");
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
			String date=sdf.format(new Date());
			DbHelper.update("insert into BI_REASON(ID,XMID2,ISCK,REASON,TIME,DDID,TYPE) values(seq_bi_reason.nextval,"+xmid2+",'F','"+reason+"','"+date+"',"+ddid+",2)");
			String msg=DbHelper.update("update bi_xmddgl set shbs = null where id="+ddid)?"操作成功":"操作失败";
			request.setAttribute("msg", msg);
			
			List list=dao.queryTable(sqls , page);
			request.getSession().setAttribute("page", page);
			request.setAttribute("list", list);
			request.getRequestDispatcher("JSP/xmddgl/xmddglsb_main1.jsp").forward(request, response);
		}
//		else if("huit2".equals(method)){//回退
//			String xmid=request.getParameter("xmid");
//			String reasong=request.getParameter("reason");
//			
//			String reason=new String(reasong.getBytes("iso-8859-1"),"utf-8");
//			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
//			String date=sdf.format(new Date());
//			DbHelper.update("insert into BI_REASON(ID,XMID,ISCK,REASON,TIME) values(seq_bi_reason.nextval,"+xmid+",'F','"+reason+"','"+date+"')");
//			String msg=DbHelper.update("update bi_xmddgl set shbs = null where id="+xmid)?"操作成功":"操作失败";
//			request.setAttribute("msg", msg);
//			
//			List list=dao.queryTable(sqls , page);
//			request.getSession().setAttribute("page", page);
//			request.setAttribute("list", list);
//			request.getRequestDispatcher("JSP/xmddgl/xmddglsb_main2.jsp").forward(request, response);
//		}
		
	}

	
	
	
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
//		super.doPost(req, resp);
		
		doGet(req, resp);
		
		
	}

		 
	
	
	
}
