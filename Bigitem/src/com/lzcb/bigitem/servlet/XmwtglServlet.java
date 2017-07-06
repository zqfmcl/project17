package com.lzcb.bigitem.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lzcb.bigitem.Entity.Tuser;
import com.lzcb.bigitem.Entity.Xmwtgl;
import com.lzcb.bigitem.dao.DiquDao;
import com.lzcb.bigitem.dao.DiquDaoImpl;
import com.lzcb.bigitem.dao.XmwtglDao;
import com.lzcb.bigitem.dao.XmwtglDaoImpl;
import com.lzcb.bigitem.dao.YonghuDao;
import com.lzcb.bigitem.dao.YonghuDaoImpl;
import com.lzcb.bigitem.utils.DbHelper;

public class XmwtglServlet extends HttpServlet {

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String method=request.getParameter("method");
		
		if("Wtsblist".equals(method)){
			
			Tuser user=(Tuser) request.getSession().getAttribute("user");
			DiquDao dqdao=new DiquDaoImpl();
			YonghuDao yhdao=new YonghuDaoImpl();
			List<Integer> jsdqlist=yhdao.findDqidById(user.getId());
			XmwtglDaoImpl wtdao=new XmwtglDaoImpl();
			List<Integer> dq_list=dqdao.findXjjd(user.getDq_id());
			if(dq_list==null){
				dq_list=new ArrayList<Integer>();
			}if(jsdqlist!=null){
				dq_list.addAll(jsdqlist);
			}
			dq_list.add(user.getDq_id());
			String nowp=request.getParameter("nowp");
			String topage=request.getParameter("topage");
			if(nowp==null)nowp="1";
			int now=Integer.parseInt(nowp);
			if("add".equals(topage)){
				now++;
			}
			if("sub".equals(topage)){
				now--;
			}
			//分页实现 ，now 为当前页，recp=10 每页10条记录
			List<Xmwtgl> xmwtlist=wtdao.findXmwt(dq_list,now,10);
			int sum=wtdao.sump;
			
			if(xmwtlist!=null){
				for(Xmwtgl xmwt:xmwtlist){
					String wdxx1=DbHelper.queryForString("select count(*) from (select * from BI_WTPL where wtid="+xmwt.getId()+" AND TWR="+user.getId()+") where LZCK='否' or ISCK='否'");
					String wdxx2=DbHelper.queryForString("select count(*) from (select * from BI_WTPL where wtid="+xmwt.getId()+" AND BPLR="+user.getId()+") where LZCK='否' or ISCK='否'");
					
					int wdxxcount1=0;
					int wdxxcount2=0;
					if(wdxx1!=null){
						wdxxcount1=Integer.parseInt(wdxx1);
					}
					if(wdxx2!=null){
						wdxxcount2=Integer.parseInt(wdxx2);
					}
					
					int wdxxcount=wdxxcount1+wdxxcount2;
					
					if(wdxxcount>0){
						
						xmwt.setWdxx("是");
					}else{
					
						xmwt.setWdxx("否");
					}
				}
			}
			request.setAttribute("xmwtlist", xmwtlist);
			request.setAttribute("nowp", now);
			request.setAttribute("sump", sum);
			
			request.getRequestDispatcher("JSP/xmwtgl/listXmwtgl.jsp").forward(request, response);
			
			
			
		}else if("SyXmwt".equals(method)){
			String fenlei=request.getParameter("fenlei");
			int id=Integer.parseInt(request.getParameter("id"));
			XmwtglDao dao=new XmwtglDaoImpl();
			dao.SyXmwt(id);
			response.sendRedirect(request.getContextPath()+"/XmwtglServlet?method=Wtsblist&fenlei="+fenlei);
		}else if("editXmwt".equals(method)){
			String fenlei=request.getParameter("fenlei");
			int id=Integer.parseInt(request.getParameter("id"));
			XmwtglDao dao=new XmwtglDaoImpl();
			Xmwtgl xmwt = dao.findXmwtById(id);
			request.setAttribute("xmwt", xmwt);
			request.getRequestDispatcher("JSP/xmwtgl/editXmwt.jsp").forward(request, response);
			
		}else if("deleteXmwt".equals(method)){
			String fenlei=request.getParameter("fenlei");
			int id=Integer.parseInt(request.getParameter("id"));
			XmwtglDao dao=new XmwtglDaoImpl();
			dao.deleteXmwt(id);
			response.sendRedirect(request.getContextPath()+"/XmwtglServlet?method=Wtsblist&fenlei="+fenlei);
		}else if("updateXmwt".equals(method)){
			String fenlei=request.getParameter("fenlei");
			int id=Integer.parseInt(request.getParameter("id"));
			XmwtglDao dao=new XmwtglDaoImpl();
			Xmwtgl xmwt=new Xmwtgl();
			String bt=request.getParameter("bt");
			String wtqkg=request.getParameter("wtqk");
			String wtmsg=request.getParameter("wtms");
			String wtqk=new String(wtqkg.getBytes("iso-8859-1"),"utf-8");
			String wtms=new String(wtmsg.getBytes("iso-8859-1"),"utf-8");
			String lxr=request.getParameter("lxr");
			String lxdh=request.getParameter("lxdh");
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String date=sdf.format(new Date());
			xmwt.setPlsj(date);
			xmwt.setLrsj(date);
			xmwt.setBt(bt);
			xmwt.setId(id);
			xmwt.setLxr(lxr);
			xmwt.setLxdh(lxdh);
			xmwt.setWtms(wtms);
			xmwt.setWtqk(wtqk);			
			dao.updateXmwt(xmwt);
			response.sendRedirect(request.getContextPath()+"/XmwtglServlet?method=Wtsblist&fenlei="+fenlei);
		}else if("getXmwt".equals(method)){
			Tuser user=(Tuser) request.getSession().getAttribute("user");
			DiquDao dqdao=new DiquDaoImpl();
			YonghuDao yhdao=new YonghuDaoImpl();
			List<Integer> jsdqlist=yhdao.findDqidById(user.getId());
			XmwtglDao wtdao=new XmwtglDaoImpl();
			List<Integer> dq_list=dqdao.findXjjd(user.getDq_id());
			if(dq_list==null){
				dq_list=new ArrayList<Integer>();
			}if(jsdqlist!=null){
				dq_list.addAll(jsdqlist);
			}
			dq_list.add(user.getDq_id());
			List<Xmwtgl> xmlist=wtdao.findXmxxByDqId(dq_list);
			request.setAttribute("xmlist", xmlist);
			request.getRequestDispatcher("JSP/xmwtgl/addXmwt.jsp").forward(request, response);
			
			
		}else if("addXmwt".equals(method)){

			int xmid=Integer.parseInt(request.getParameter("xmid"));
			HttpSession session=request.getSession();
			Tuser user=(Tuser) session.getAttribute("user");
			int lrr=user.getId();
			XmwtglDao dao=new XmwtglDaoImpl();
			Xmwtgl xmwt=new Xmwtgl();
			String bt=request.getParameter("bt");
			String wtqkg=request.getParameter("wtqk");
			String wtmsg=request.getParameter("wtms");
			String wtqk=new String(wtqkg.getBytes("iso-8859-1"),"utf-8");
			String wtms=new String(wtmsg.getBytes("iso-8859-1"),"utf-8");

			String lxr=request.getParameter("lxr");
			String lxdh=request.getParameter("lxdh");
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String date=sdf.format(new Date());
			xmwt.setPlsj(date);
			xmwt.setLrsj(date);
			xmwt.setBt(bt);
			xmwt.setXmid(xmid);
			xmwt.setLxr(lxr);
			xmwt.setLxdh(lxdh);
			xmwt.setWtms(wtms);
			xmwt.setWtqk(wtqk);	
			xmwt.setLrr(lrr);

			dao.addXmwt(xmwt);
			response.sendRedirect(request.getContextPath()+"/XmwtglServlet?method=Wtsblist");
		}else if("selectMyXmwt".equals(method)){
			HttpSession session=request.getSession();
			
//			Tuser user = (Tuser) session.getAttribute("user");
//			XmwtglDao wtdao=new XmwtglDaoImpl();
//			List<Xmwtgl> xmwtlist = wtdao.findXmwtByLrrId(user.getId());
//			if(xmwtlist!=null){
//				for(Xmwtgl xmwt:xmwtlist){
//					String wdxx1=DbHelper.queryForString("select count(*) from (select * from BI_WTPL where wtid="+xmwt.getId()+" AND TWR="+user.getId()+") where LZCK='否' or ISCK='否'");
//					String wdxx2=DbHelper.queryForString("select count(*) from (select * from BI_WTPL where wtid="+xmwt.getId()+" AND BPLR="+user.getId()+") where LZCK='否' or ISCK='否'");
//					
//					int wdxxcount1=0;
//					int wdxxcount2=0;
//					if(wdxx1!=null){
//						wdxxcount1=Integer.parseInt(wdxx1);
//					}
//					if(wdxx2!=null){
//						wdxxcount2=Integer.parseInt(wdxx2);
//					}
//					
//					int wdxxcount=wdxxcount1+wdxxcount2;
//					
//					if(wdxxcount>0){
//						
//						xmwt.setWdxx("是");
//					}else{
//						
//						xmwt.setWdxx("否");
//					}
//				}
//				request.setAttribute("xmwtlist", xmwtlist);			
//				request.getRequestDispatcher("JSP/xmwtgl/listXmwtgl.jsp").forward(request, response);	
//			}
//			request.getRequestDispatcher("MyJsp.jsp").forward(request, response);
			
			
			
			
			Tuser user=(Tuser) request.getSession().getAttribute("user");
//			DiquDao dqdao=new DiquDaoImpl();
//			YonghuDao yhdao=new YonghuDaoImpl();
//			List<Integer> jsdqlist=yhdao.findDqidById1(user.getId());
			XmwtglDaoImpl wtdao=new XmwtglDaoImpl();
//			List<Integer> dq_list=dqdao.findXjjd(user.getDq_id());
//			if(dq_list==null){
//				dq_list=new ArrayList<Integer>();
//			}if(jsdqlist!=null){
//				dq_list.addAll(jsdqlist);
//			}
//			dq_list.add(user.getDq_id());
			String nowp=request.getParameter("nowp");
			String topage=request.getParameter("topage");
			if(nowp==null)nowp="1";
			int now=Integer.parseInt(nowp);
			if("add".equals(topage)){
				now++;
			}
			if("sub".equals(topage)){
				now--;
			}
			//分页实现 ，now 为当前页，recp=10 每页10条记录
			List<Xmwtgl> xmwtlist=wtdao.findXmwtByLrrId1(user.getId(),now,10);
			int sum=wtdao.sump;
			
			if(xmwtlist!=null){
				for(Xmwtgl xmwt:xmwtlist){
					String wdxx1=DbHelper.queryForString("select count(*) from (select * from BI_WTPL where wtid="+xmwt.getId()+" AND TWR="+user.getId()+") where LZCK='否' or ISCK='否'");
					String wdxx2=DbHelper.queryForString("select count(*) from (select * from BI_WTPL where wtid="+xmwt.getId()+" AND BPLR="+user.getId()+") where LZCK='否' or ISCK='否'");
					
					int wdxxcount1=0;
					int wdxxcount2=0;
					if(wdxx1!=null){
						wdxxcount1=Integer.parseInt(wdxx1);
					}
					if(wdxx2!=null){
						wdxxcount2=Integer.parseInt(wdxx2);
					}
					
					int wdxxcount=wdxxcount1+wdxxcount2;
					
					if(wdxxcount>0){
						
						xmwt.setWdxx("是");
					}else{
					
						xmwt.setWdxx("否");
					}
				}
			}
			request.setAttribute("xmwtlist", xmwtlist);
			request.setAttribute("nowp", now);
			request.setAttribute("sump", sum);
			
			request.getRequestDispatcher("JSP/xmwtgl/listXmwtgl.jsp").forward(request, response);
			
			
			
		}else if("XqXmwt".equals(method)){
			int wtid=Integer.parseInt(request.getParameter("wtid"));
			XmwtglDao wtdao=new XmwtglDaoImpl();
			Xmwtgl wt = wtdao.findXmwtById(wtid);
			request.setAttribute("wt", wt);
			request.getRequestDispatcher("JSP/xmwtgl/xqXmwt.jsp").forward(request, response);		
		}
		
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
