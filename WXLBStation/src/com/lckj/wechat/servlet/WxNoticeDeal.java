package com.lckj.wechat.servlet;

import java.io.IOException;
import java.net.URLDecoder;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lckj.bx.controler.WxNoticeSend;
import com.lckj.wechat.util.C3p0Util;

public class WxNoticeDeal extends HttpServlet {
	private WxNoticeSend wns=null;
	private WxNoticeSend getWxNoticeSend(){
		if(wns==null)wns=new WxNoticeSend();
		return wns;
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String ids=request.getParameter("ids");
		String notice=URLDecoder.decode(request.getParameter("notice"),"UTF-8");
		System.out.println(ids + " "+notice+" url:"+request.getRequestURL());
		if(ids==null||"".equals(ids)||"null".equals(ids))return;
		String sql="select wxrz from userwxh t where t.id in ("+ids+") and wxrz is not null";
		String tousers="";
		List<Map<String, Object>> list=C3p0Util.queryForTable(sql);
		for(int i=0;i<list.size();i++){
			if(i!=0)tousers+="|";
			tousers+=list.get(i).get("WXRZ");
		}
		String jsonContext="{" +
				"\"touser\":\""+tousers+"\"," +
				"\"toparty\":\"\"," +
				"\"msgtype\":\"text\"," +
				"\"agentid\":2," +
				"\"text\":{" +
				"\"content\":\""+notice+"\"}," +
				"\"safe\":0}";
		getWxNoticeSend().sendNotice(jsonContext);
	}

}
