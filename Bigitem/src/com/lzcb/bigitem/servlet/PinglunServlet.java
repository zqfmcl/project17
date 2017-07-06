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
import javax.servlet.http.HttpSession;

import com.lzcb.bigitem.Entity.Pinglun;
import com.lzcb.bigitem.Entity.Tuser;
import com.lzcb.bigitem.Entity.Xmwtgl;
import com.lzcb.bigitem.dao.PinglunDao;
import com.lzcb.bigitem.dao.PinglunDaoImpl;
import com.lzcb.bigitem.dao.XmwtglDao;
import com.lzcb.bigitem.dao.XmwtglDaoImpl;
import com.lzcb.bigitem.dao.YonghuDao;
import com.lzcb.bigitem.dao.YonghuDaoImpl;
import com.lzcb.bigitem.utils.DbHelper;

public class PinglunServlet extends HttpServlet {

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String method=request.getParameter("method");
		if("listPing".equals(method)){
			int wtid=Integer.parseInt(request.getParameter("wtid"));
			HttpSession session=request.getSession();
			Tuser user=(Tuser) session.getAttribute("user");
			String sql1="update BI_WTPL SET ISCK='是' where WTID="+wtid+" AND BPLR="+user.getId();
			String sql2="update BI_WTPL SET LZCK='是' where WTID="+wtid+" AND TWR="+user.getId();
			DbHelper.update(sql1);//更新评论查看状态为已读
			DbHelper.update(sql2);
			
			
			
			YonghuDao yhdao=new YonghuDaoImpl();
			PinglunDao dao=new PinglunDaoImpl();
			List<Pinglun> plList=dao.findAllPinglun(wtid);
			if(plList!=null){
				for(Pinglun pl:plList){
					int plrid=pl.getPlrid();
					pl.setPlrjs(yhdao.findYhjs(plrid));
					
				}
			}
			
			XmwtglDao wtdao=new XmwtglDaoImpl();
			Xmwtgl wt = wtdao.findXmwtById(wtid);
			//System.out.println("wwwtwtwtwtwtwtwtw00000-----"+plList);
			String lzjs=yhdao.findYhjs(wt.getLrr());
			String lzname=yhdao.findById(wt.getLrr()).getUsername();
			request.setAttribute("lzjs", lzjs);
			request.setAttribute("lzname", lzname);
			request.setAttribute("wt", wt);
			request.setAttribute("wtid", wtid);
			request.setAttribute("plList", plList);
			request.getRequestDispatcher("JSP/xmwtgl/ltXmwt.jsp").forward(request, response);
		}else if("addPing".equals(method)){
			PinglunDao dao=new PinglunDaoImpl();
		

			int wtid=Integer.parseInt(request.getParameter("wtid"));
			int bplr=Integer.parseInt(request.getParameter("bplr"));
			
			HttpSession session=request.getSession();
			Tuser user=(Tuser) session.getAttribute("user");
			int plrid=user.getId();
			String plnr=request.getParameter("plnr1");
		    //String plnr=new String(plnrg.getBytes("iso-8859-1"),"utf-8");
		  
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String pltime=sdf.format(new Date());
			Pinglun pl=new Pinglun();
			pl.setPlnr(plnr);
			pl.setPlrid(plrid);
			pl.setPltime(pltime);
			pl.setWtid(wtid);
			pl.setBplr(bplr);
			dao.addPinglun(pl);
			request.getRequestDispatcher("PinglunServlet?method=listPing&wtid="+wtid+"").forward(request, response);
		}
		
		
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	doGet(request, response);
	}

}
