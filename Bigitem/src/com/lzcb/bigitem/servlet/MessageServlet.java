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
import com.lzcb.bigitem.dao.DiquDao;
import com.lzcb.bigitem.dao.DiquDaoImpl;
import com.lzcb.bigitem.dao.JbxxDaoImpl;
import com.lzcb.bigitem.dao.XmwtglDao;
import com.lzcb.bigitem.dao.XmwtglDaoImpl;
import com.lzcb.bigitem.dao.YonghuDao;
import com.lzcb.bigitem.dao.YonghuDaoImpl;
import com.lzcb.bigitem.utils.DbHelper;

public class MessageServlet extends HttpServlet {

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		HttpSession session=request.getSession();
		Tuser user=(Tuser) session.getAttribute("user");
		if(user==null){
			request.getRequestDispatcher("/index.jsp").forward(request, response);
			return;
		}else{
			int lrr=user.getId();
			String messageInfo = request.getParameter("messageInfo");
			String ht=DbHelper.queryForString("select count(*) from BI_REASON r inner join BI_XMXX x on r.XMID = x.id where x.LRR="+lrr+" and ISCK='F' order by r.TIME DESC");
			int htcount=Integer.parseInt(ht);//回退/否决的消息数
			
			String sbstr=DbHelper.queryForString("select count(*) from BI_XMXX where SHBZ is null and szqx in ("+JbxxDaoImpl.getDQs(user.getId()+"")+")");
			int sbcount=Integer.parseInt(sbstr);//项目申报的消息数
			
			String wtglstr=DbHelper.queryForString("select count(*) from BI_WTPL where TWR="+lrr+" AND LZCK='否'");
			int wtglcount=Integer.parseInt(wtglstr);
			
			String wtplstr=DbHelper.queryForString("select count(*) from BI_WTPL where BPLR="+lrr+" AND ISCK='否'  AND TWR<>"+lrr+"");
			int wtplcount=Integer.parseInt(wtplstr);
			
			int plcount=wtglcount+wtplcount;
			
			String xmwtstr=DbHelper.queryForString("select count(*) from BI_XMWTGL where SYZT='未审阅'");
			int xmwtcount=Integer.parseInt(xmwtstr);		
			
			String ddstr=DbHelper.queryForString("select count(*) from BI_XMDDGL ll left join bi_xmxx xx on ll.xm=xx.id where shbs='未通过' and xx.szqx in ("+JbxxDaoImpl.getDQs(user.getId()+"")+")");
			int ddcount=Integer.parseInt(ddstr);
			
			
			DiquDao dqdao=new DiquDaoImpl();
			YonghuDao yhdao=new YonghuDaoImpl();
			List<Integer> jsdqlist=yhdao.findDqidById(user.getId());
		
			List<Integer> dq_list=dqdao.findXjjd(user.getDq_id());
			if(dq_list==null){
				dq_list=new ArrayList<Integer>();
			}if(jsdqlist!=null){
				dq_list.addAll(jsdqlist);
			}
			dq_list.add(user.getDq_id());
			String str="";
			for(int i=0;i<dq_list.size();i++){
				if(i<dq_list.size()-1){
					str+="xm.SZQX="+dq_list.get(i)+" or ";
				}else{
					str+=" xm.SZQX="+dq_list.get(i);
				}
				
			}
			
			String sql="select count(*) from BI_REASON re inner join BI_XMDDGL dd on dd.ID=re.DDID inner join BI_XMXX xm on re.XMID2=xm.ID where re.isck='F' and re.type=2 and ("+str+")";
			String ddhtstr=DbHelper.queryForString(sql);
			int ddhtcount=Integer.parseInt(ddhtstr);
			
			String sql2="select count(*) from BI_REASON re inner join BI_XMDDGL dd on dd.ID=re.DDID inner join BI_XMXX xm on re.XMID2=xm.ID where re.isck='F' and re.type=1 and ("+str+")";
			String ddfjstr=DbHelper.queryForString(sql2);
			int ddfjcount=Integer.parseInt(ddfjstr);
			
			
			List<Integer> jslist = yhdao.findYhjsId(user.getId());
			int infocount=plcount;
			for(Integer jsid:jslist){
				if(jsid==240){
					infocount=sbcount+plcount+xmwtcount+ddcount;
				}else if(jsid==239){
					infocount=sbcount+plcount+xmwtcount+ddcount;
				}else if(jsid==238){
					infocount=htcount+plcount+ddhtcount+ddfjcount;
//					infocount=sbcount+plcount+xmwtcount+ddcount;
				}else if(jsid==237){
					infocount=plcount+sbcount+ddcount;
				}
			}


			
			
			
			StringBuffer sb = new StringBuffer("");
			SimpleDateFormat sdf=new SimpleDateFormat("mm");
			String data=sdf.format(new Date());
			sb.append("{");
			sb.append("\"messages\":[");
			
				sb.append("{\"message\":\" "+sbcount+" \"},{\"message\":\""+htcount+"\"},{\"message\":\" "+plcount+" \"},{\"message\":\""+xmwtcount+"\"},{\"message\":\""+ddcount+"\"},{\"message\":\""+ddhtcount+"\"},{\"message\":\""+ddfjcount+"\"},{\"message\":\" "+infocount+" \"}");
			
			sb.append("]}");
			//System.out.println(sb);

			response.setContentType("text/html;charset=utf-8");

			PrintWriter out = response.getWriter();
			out.println(sb.toString());
			out.flush();
			out.close();
		}
		
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
