package com.dgsx.hb.servlet;

import java.io.BufferedInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadBase;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.ProgressListener;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.dgsx.hb.utils.DbHelper;
import com.dgsx.hb.utils.XmlReaderHelper;

public class StudentServlet extends HttpServlet {

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
		response.setCharacterEncoding("utf-8");
		String method=request.getParameter("method");
		if("getQYLB".equals(method)){//获取企业列表
			JSONArray arr=JSONArray.fromObject(DbHelper.queryForTable("select id,qymc from e_qyjbxx order by qypf desc"));
			response.getWriter().print(arr);
		}else if("getZWLB".equals(method)){//获取职位列表
			String qyid=request.getParameter("qyid");
			JSONArray arr=JSONArray.fromObject(DbHelper.queryForTable("select id,zpgw from e_qyzpxx where ssqy="+qyid));
			response.getWriter().print(arr);
		}else if("getQYJBXX".equals(method)){//获取企业信息
			String qyid=request.getParameter("qyid");
			JSONObject obj=JSONObject.fromObject(DbHelper.queryAClob("select * from e_qyjbxx where id="+qyid+" order by qypf desc", "QYJJ"));
			response.getWriter().print(obj);
		}else if("getZWXX".equals(method)){//获取职位信息
			String zwid=request.getParameter("zwid");
			JSONObject obj=JSONObject.fromObject(DbHelper.queryARow("select zw.*,qy.qymc from e_qyzpxx zw,e_qyjbxx qy where zw.ssqy=qy.id and zw.id="+zwid));
			response.getWriter().print(obj);
		}else if("getQYSQ".equals(method)){//签约申请信息
			String userid=request.getParameter("userid");
			JSONObject obj=JSONObject.fromObject(DbHelper.queryARow("select xx.id,xx.xh,xx.xm,xx.zyb,xx.zy,xx.bj,lb.name,tjx.zymc,tbj.xzbmc from e_xsjbxx xx left join lborganization lb on xx.zyb=lb.id left join tjx_zy_gxjx01 tjx on xx.zy=tjx.id left join t_bj_gxxx04 tbj on xx.bj=tbj.id where xx.xh='"+userid+"' "));
			response.getWriter().print(obj);
		}else if("sendQYSQ".equals(method)){//提交申请信息
			JSONObject obj=JSONObject.fromObject(request.getParameter("sqxx"));
			String fields="";
			String values="";
			fields+=",xs,xh,zyb,zy,bj,sqqy,sqgw,sqsj";
			values+=","+obj.getString("ID")+",'"+obj.getString("XH")+"',"+obj.getString("ZYB")+","+obj.getString("ZY")+","+obj.getString("BJ")+","+obj.getString("qyid")+","+obj.getString("zwid")+",sysdate";
			List owerlist=DbHelper.queryForList("select id from  tuser where userid='admin' or userid in ( select gh from E_QYZDJS where E_QYZDJS.ssqy="+obj.getString("qyid")+")");
			List<String> list=getSqls("WO_XSQYSQ", "WF_XSQYSQGZL", fields, values, "19", owerlist, obj.getString("XH"));
			response.getWriter().print("{\"errcode\":\""+(DbHelper.updates(list).length>0?0:-1)+"\"}");
		}
		//LBFEEDMESSAGE
		//select * from LBNOTIFICATIONUSER t where t.notificationid=515
//		select * from LBNOTIFICATIONOPERATES t where t.operatekey='wfid' and t.operatevalue='348'
//				select * from LBNOTIFICATION t where t.id=515;
		/*
		 * select * from lbnotificationuser t//S_LBNOTIFICATIONUSER
		 * select * from LBNOTIFICATIONOPERATES t//S_LBNOTIFICATIONOPERATES
		 * select * from LBNOTIFICATION t
		 * select * from lbwfcurrentowner t//S_LBWFCURRENTOWNER
		 * */
	}
	
	private List<String> getSqls(String tablename,String gzl,String fields,String values,String stepId,List ownerlist,String xh){
		String owner="";
		//添加流操作者
		String wfcurrentownersql="";
		String wfcoSqlvalues="";
		//消息提醒用户信息
		String notifusersql="";
		String ntuvalues="";
		String subjectsql="(select id from tSequence where name='"+tablename+"')";
		String wfid=DbHelper.queryForString("select seq_os_wfentry.nextval from dual");
		String currStepid=DbHelper.queryForString("select seq_os_currentsteps.nextval from dual");
		for(int i=0;i<ownerlist.size();i++){
			Object s=ownerlist.get(i);
			if(i>0){
				wfcoSqlvalues+=" union all ";
				ntuvalues+=" union all ";
			}
			wfcoSqlvalues+=" select "+DbHelper.queryForString("select S_LBWFCURRENTOWNER.nextval from dual")+","+currStepid+","+s+",1 from dual ";
			ntuvalues+=" select "+DbHelper.queryForString("select S_LBNOTIFICATIONUSER.nextval from dual")+",(select id from tsequence where name='lbNotification'),"+s+" from dual ";
			owner+=s+",";
		}
		if(!"".equals(owner)){
			owner=owner.substring(0, owner.length()-1);
			wfcurrentownersql="insert into lbwfcurrentowner (id,stepid,owner,flag) "+wfcoSqlvalues;
			notifusersql="insert into lbnotificationuser (id,notificationid,userid) "+ntuvalues;
		}
		//流程表单
		String mainsql="insert into " +
				tablename+"(id,instid"+fields+") " +
				"values(func_nextid('"+tablename+"'),"+wfid+""+values+")";
		//工作流记录
		String wfentrysql="insert into OS_WFENTRY (id,Name,State,Initiator,Init_Date,subject) " +
				"values ("+wfid+",'"+gzl+"',1,(select id from tuser where userid='"+xh+"'),sysdate,"+subjectsql+")";
		//创建当前步骤
		String currentstepsql="insert into os_currentstep (id,entry_id,step_id,owner,start_date,status,flag) " +
				"values ("+currStepid+","+wfid+","+stepId+",'"+owner+"',sysdate,'待处理',0)";
		//工作流消息提醒
		String notifsql="insert into LBNOTIFICATION (id,objid,type,title,content,senduser,sendtime) " +
				"values (func_nextid('lbNotification'),"+wfid+"||'"+stepId+"','Workflow','流程主题:'||"+subjectsql+",(select wf_describe from os_workflowdefs where wf_name='"+gzl+"')||'["+XmlReaderHelper.getStepNameById(stepId,gzl)+"]需要你处理',(select id from tuser where userid='"+xh+"'),to_char(sysdate,'yyyy-MM-dd HH24:mi:ss'))";
		//工作流消息提醒对应关系
		String notifoptsql="insert into LBNOTIFICATIONOPERATES (id, notificationid, operatename, operatekey, operatevalue) " +
				"select "+DbHelper.queryForString("select S_LBNOTIFICATIONOPERATES.nextval from dual")+", (select id from tsequence where name = 'lbNotification'), 'execute', 'wfid', "+wfid+" from dual " +
				"union all " +
				"select "+DbHelper.queryForString("select S_LBNOTIFICATIONOPERATES.nextval from dual")+", (select id from tsequence where name = 'lbNotification'), 'execute', 'stepId', "+stepId+" from dual";
		
		List<String> list=new ArrayList<String>();
		list.add(mainsql);
		list.add(wfentrysql);
		list.add(currentstepsql);
		if(!"".equals(wfcurrentownersql))list.add(wfcurrentownersql);
		list.add(notifsql);
		list.add(notifoptsql);
		if(!"".equals(notifusersql))list.add(notifusersql);
		return list;
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
