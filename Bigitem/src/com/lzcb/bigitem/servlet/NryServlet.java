package com.lzcb.bigitem.servlet;

import java.io.IOException;
import java.sql.Clob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.CachedRowSet;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.lzcb.bigitem.Entity.Nry;
import com.lzcb.bigitem.Entity.Tuser;
import com.lzcb.bigitem.dao.NryDao;
import com.lzcb.bigitem.dao.NryDaoImpl;
import com.lzcb.bigitem.utils.DbHelper;
import com.lzcb.bigitem.utils.FileUADHelper;
import com.lzcb.bigitem.utils.PageHelper;

public class NryServlet extends HttpServlet {

	private PageHelper page;
	
	 
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String sqls="select ll.*, xx.lmmc from t_nry ll left join t_wzlm xx on ll.sslm=xx.id where ";
		NryDao dao=new NryDaoImpl();
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String method=request.getParameter("method");
		page=(PageHelper)request.getSession().getAttribute("page");
		Tuser user=(Tuser)request.getSession().getAttribute("user");
		if(user==null&&!"getDQXMSL".equals(method)&&!"getXMTZFW".equals(method)&&!"getZBXMQK".equals(method)){
				request.getRequestDispatcher("/index.jsp").forward(request, response);
				return;
		}
		if("add".equals(method)){
			String cont=request.getParameter("cont");
			String msg=dao.addNry(request,request.getParameter("ddid"))?"操作成功":"操作失败";
			request.setAttribute("msg", msg);
			request.getSession().setAttribute("page", page);
			if(cont!=null&&"1".equals(cont)){
				request.getRequestDispatcher("JSP/xwgl/nry_add.jsp").forward(request, response);
			}else{
				List list=dao.queryTable(sqls , page);
				request.setAttribute("list", list);
				request.getRequestDispatcher("JSP/xwgl/nry_main.jsp").forward(request, response);
			}
		}else if("add1".equals(method)){
			boolean flag=true;
			Connection ct=null;
			PreparedStatement pstm = null;
			Statement statement=null;
	        ResultSet rs=null;
	        CachedRowSet crs=null;
//			String url="jdbc:oracle:thin:@191.168.0.10:1521:orcl";
	        String url="jdbc:oracle:thin:@218.56.106.155:1521:orcl";
			String username="bigitem";
			String password="apexsoft";
//			String ddid=DbHelper.queryForString("select seq_t_nry.nextval from dual");
			String ddid=request.getParameter("ddid");
			String sql = "insert into t_nry (id,bt, fbz, sslm, sfxs, zw, slt, sftj) values(?,?,?,?,?,?,?,?)";
//			Nry xx=new Nry();
//			FileUADHelper.uploadFile(request, "t_nry", ddid,xx,"");
                
			try {
				Class.forName("oracle.jdbc.driver.OracleDriver");
				//2、得到连接
				ct=DriverManager.getConnection(url,username,password);
				//把事务设为不自动 提交
				ct.setAutoCommit(false);
				
				pstm=ct.prepareStatement(sql);
//				String parameter = request.getParameter("sslm");
				pstm.setInt(1,Integer.parseInt(ddid));
				pstm.setString(2, request.getParameter("bt"));
				pstm.setInt(3, Integer.parseInt(request.getParameter("fbz")));
				pstm.setInt(4, Integer.parseInt(request.getParameter("sslm")));
				pstm.setInt(5, Integer.parseInt(request.getParameter("sfxs")));
				pstm.setString(6, request.getParameter("zw"));
				pstm.setString(7, request.getParameter("slt"));
				pstm.setInt(8,Integer.parseInt(request.getParameter("sftj")));
			
				
				pstm.executeUpdate();
				pstm.close();
				ct.close();
				//rs = pstm.executeQuery("insert into t_nry (id,bt, fbz, sslm, sfxs, zw, slt, sftj) VALUES ('"+ddid+"','"+request.getParameter("bt")+"',0,'"+request.getParameter("sslm")+"','"+request.getParameter("sfxs")+"',0,'"+request.getParameter("slt")+"','"+request.getParameter("sftj")+"')");
//				rs = statement.executeQuery("insert into t_nry (id,bt, fbz, sslm, sfxs, zw, slt, sftj) VALUES ('"+ddid+"','"+request.getParameter("bt")+"','"+request.getParameter("fbz")+"','"+request.getParameter("sslm")+"','"+request.getParameter("sfxs")+"',0,'"+request.getParameter("slt")+"','"+request.getParameter("sftj")+"')");
//				rs = statement.executeQuery("insert into t_nry (id, bt, fbz, sslm, sfxs, zw, slt, sftj) VALUES ('"+ddid+"','"+request.getParameter("bt")+"','"+request.getParameter("fbz")+"','"+request.getParameter("sslm")+"','"+request.getParameter("sfxs")+"','"+request.getParameter("zw")+"','"+request.getParameter("slt")+"','"+request.getParameter("sftj")+"')");
//				pstm = ct.prepareStatement(sql);
//				pstm.setString(1, ddid);
//				pstm.setString(2, request.getParameter("bt"));
//				pstm.setString(3, request.getParameter("fbz"));
//				pstm.setString(4, request.getParameter("sslm"));
//				pstm.setString(5, request.getParameter("sfxs"));
//				pstm.setString(6, request.getParameter("zw"));
//				pstm.setString(7, request.getParameter("slt"));
//				pstm.setString(8, request.getParameter("sftj"));
//				int i=pstm.executeUpdate();
//				if(i==0){
//					flag=false;
//				}
				
			} catch (Exception e) {
				//如果事务中的sql语句中有任何错误则进行回滚操作。
				try {
					ct.rollback();
				} catch (SQLException e1) {
					e1.printStackTrace();
				}
				e.printStackTrace();
			}finally{
				//关闭资源[先开后关，后开先关]
				if(statement!=null){
					try {
						statement.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
					statement=null;
				}
				if(ct!=null){
					try {
						ct.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
					ct=null;
				}
			}
            
			
			
			String cont=request.getParameter("cont");
//			String msg=dao.addNry(request,request.getParameter("ddid"))?"操作成功":"操作失败";
//			request.setAttribute("msg", msg);
			request.getSession().setAttribute("page", page);
			if(cont!=null&&"1".equals(cont)){
				request.getRequestDispatcher("JSP/xwgl/nry_add.jsp").forward(request, response);
			}else{
				List list=dao.queryTable(sqls , page);
				request.setAttribute("list", list);
				request.getRequestDispatcher("JSP/xwgl/nry_main.jsp").forward(request, response);
			}
		}else if("update".equals(method)){
			String msg=dao.updateNry(request,request.getParameter("xmid"))?"操作成功":"操作失败";
			request.setAttribute("msg", msg);

			List list=dao.queryTable(sqls , page);
			request.getSession().setAttribute("page", page);
			request.setAttribute("list", list);
			request.getRequestDispatcher("JSP/xwgl/nry_main.jsp").forward(request, response);
		}else if("del".equals(method)){
			String xmid=request.getParameter("xmid");
			String msg=DbHelper.update("delete from t_nry where id="+xmid)?"操作成功":"操作失败";
			if("操作成功".equals(msg))DbHelper.update("delete from fujian where ssbm='t_nry' and ssjldm="+xmid);
			request.setAttribute("msg", msg);

			List list=dao.queryTable(sqls , page);
			request.getSession().setAttribute("page", page);
			request.setAttribute("list", list);
			request.getRequestDispatcher("JSP/xwgl/nry_main.jsp").forward(request, response);
		}else if("select".equals(method)){//查询
			String sql=sqls;
			String condition="1=1  ";
			
			page=PageHelper.getpage(sql+condition, 5, condition);
			List list=dao.queryTable(sql, page);
			request.getSession().setAttribute("page", page);
			request.setAttribute("list", list);
			request.getRequestDispatcher("JSP/xwgl/nry_main.jsp").forward(request, response);
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
			request.getRequestDispatcher("JSP/xwgl/nry_main.jsp").forward(request, response);
		}else if("chgPage".equals(method)){
			String sql=sqls;
			int pageNum=Integer.parseInt(request.getParameter("pNum"));
			page=PageHelper.getpage(sql+page.getCondition(), pageNum, page.getCondition());
			List list=dao.queryTable(sql, page);
			request.getSession().setAttribute("page", page);
			request.setAttribute("list", list);
			request.getRequestDispatcher("JSP/xwgl/nry_main.jsp").forward(request, response);
		}else if("show".equals(method)){
			String xmid=request.getParameter("xmid");
			String sql="select ll.*,xx.* from t_nry ll left join t_wzlm xx on ll.sslm=xx.id where ll.id="+xmid+" ";
			Map<String, Object> xmxx=DbHelper.queryAClob(sql,"ZW");
			request.setAttribute("xmxx", xmxx);
			request.getRequestDispatcher("JSP/xwgl/nry_show.jsp").forward(request, response);
		}else if("getxm".equals(method)){
			String xmid=request.getParameter("xmid");
			String sql="select xx.* from t_wzlm xx " +
				"where xx.id="+xmid;
			Map<String, Object> xmxx=DbHelper.queryAClob(sql,"ZW");
			request.setAttribute("xmxx", xmxx);
			request.getRequestDispatcher("JSP/xwgl/nry_add.jsp").forward(request, response);
		}else if("getDQXMSL".equals(method)){//获取地区项目数量
			String sql="select dq.id,dq.dq_name,count(xm.id) xmnum from bi_dqxxb dq left join bi_xmxx xm on dq.id=xm.szqx where dq.sjjd_dm=116 group by dq.id,dq.dq_name";
			JSONObject chart=new JSONObject();
			chart.accumulate("caption", "镇办项目数量占比");
			chart.accumulate("showPercentValues", "1");
			chart.accumulate("showPercentInTooltip", "0");
			chart.accumulate("startingAngle", "30");
			chart.accumulate("decimals", "1");
			chart.accumulate("smartLineColor", "#d11b2d");
			chart.accumulate("smartLineThickness", "2");
			chart.accumulate("smartLineAlpha", "75");
			chart.accumulate("isSmartLineSlanted", "0");
			chart.accumulate("theme", "fint");
			String datas="[";
			List<Map<String, Object>> list=DbHelper.queryForTable(sql);
			for(int i=0;i<list.size();i++){
				Map<String, Object> m=list.get(i);
				datas+="{ \"label\":"+"\""+m.get("DQ_NAME")+"\", \"value\":"+"\""+m.get("XMNUM")+"\" },";
			}
			if("[".equals(datas)){
				datas="";
			}else{
				datas=datas.substring(0, datas.length()-1)+" ]";
			}
			JSONObject json=new JSONObject();
			json.accumulate("chart", chart);
			json.accumulate("data", JSONArray.fromObject(datas));
			response.getWriter().print(json);
		}else if("getXMTZFW".equals(method)){//项目投资范围
			String sql="select count(*) as xmnum,'一亿以下' as cxtj from bi_xmxx t where t.ztz<1 union all " +
					"select count(*) as xmnum,'一亿至五亿' as cxtj from bi_xmxx t where t.ztz>=1 and t.ztz<5 union all " +
					"select count(*) as xmnum,'五亿至十亿' as cxtj from bi_xmxx t where t.ztz>=5 and t.ztz<10 union all " +
					"select count(*) as xmnum,'十亿至二十亿' as cxtj from bi_xmxx t where t.ztz>=10 and t.ztz<20 union all " +
					"select count(*) as xmnum,'二十亿以上' as cxtj from bi_xmxx t where t.ztz>=20";
			JSONObject chart=new JSONObject();
			chart.accumulate("caption", "投资规模总比");
			chart.accumulate("showPercentValues", "1");
			chart.accumulate("showPercentInTooltip", "0");
			chart.accumulate("startingAngle", "30");
			chart.accumulate("decimals", "1");
			chart.accumulate("smartLineColor", "#d11b2d");
			chart.accumulate("smartLineThickness", "2");
			chart.accumulate("smartLineAlpha", "75");
			chart.accumulate("isSmartLineSlanted", "0");
			chart.accumulate("theme", "fint");
			String datas="[";
			List<Map<String, Object>> list=DbHelper.queryForTable(sql);
			for(int i=0;i<list.size();i++){
				Map<String, Object> m=list.get(i);
				datas+="{ \"label\":"+"\""+m.get("CXTJ")+"\", \"value\":"+"\""+m.get("XMNUM")+"\" },";
			}
			if("[".equals(datas)){
				datas="";
			}else{
				datas=datas.substring(0, datas.length()-1)+" ]";
			}
			JSONObject json=new JSONObject();
			json.accumulate("chart", chart);
			json.accumulate("data", JSONArray.fromObject(datas));
			response.getWriter().print(json);
		}else if("getZBXMQK".equals(method)){//镇办项目情况
			Calendar cld=Calendar.getInstance();
			int nowYear=cld.get(Calendar.YEAR);
			String sql="select dq1.id,dq1.dq_name,num1,count(xm.id) as num2 from  (select dq.id,dq.dq_name,count(xm.id) as num1 from  bi_dqxxb dq left join (select bi_xmxx.id,bi_xmxx.szqx from bi_xmxx where nf="+nowYear+") xm on dq.id=xm.szqx where dq.sjjd_dm=116 group by dq.id,dq.dq_name) dq1 left join (select bi_xmxx.id,bi_xmxx.szqx from bi_xmxx where nf="+(nowYear-1)+") xm on dq1.id=xm.szqx group by dq1.id,dq1.dq_name,dq1.num1 order by dq1.dq_name";
			JSONObject chart=new JSONObject();
			chart.accumulate("caption", "");
			chart.accumulate("xAxisname", "注释");
			chart.accumulate("yAxisName", "数量 (个)");
			chart.accumulate("plotFillAlpha", "80");
			chart.accumulate("paletteColors", "#0075c2,#1aaf5d");
			chart.accumulate("baseFontColor", "#333333");
			chart.accumulate("baseFont", "Helvetica Neue,Arial");
			chart.accumulate("captionFontSize", "14");
			chart.accumulate("subcaptionFontSize", "14");
			chart.accumulate("subcaptionFontBold", "0");
			chart.accumulate("showBorder", "0");
			chart.accumulate("bgColor", "#ffffff");
			chart.accumulate("showShadow", "0");
			chart.accumulate("canvasBgColor", "#ffffff");
			chart.accumulate("canvasBorderAlpha", "0");
			chart.accumulate("divlineAlpha", "100");
			chart.accumulate("divlineColor", "#999999");
			chart.accumulate("divlineThickness", "1");
			chart.accumulate("divLineIsDashed", "1");
			chart.accumulate("divLineDashLen", "1");
			chart.accumulate("divLineGapLen", "1");
			chart.accumulate("usePlotGradientColor", "0");
			chart.accumulate("showplotborder", "0");
			chart.accumulate("valueFontColor", "#ffffff");
			chart.accumulate("placeValuesInside", "1");
			chart.accumulate("showHoverEffect", "1");
			chart.accumulate("rotateValues", "1");
			chart.accumulate("showXAxisLine", "1");
			chart.accumulate("xAxisLineThickness", "1");
			chart.accumulate("xAxisLineColor", "#999999");
			chart.accumulate("showAlternateHGridColor", "0");
			chart.accumulate("legendBgAlpha", "0");
			chart.accumulate("legendBorderAlpha", "0");
			chart.accumulate("legendShadow", "0");
			chart.accumulate("legendItemFontSize", "10");
			chart.accumulate("legendItemFontColor", "#666666");
			String categories="[{ \"category\":[";
			String dataset1="{\"seriesname\":\"去年\",\"data\":[";//去年
			String dataset2="{\"seriesname\":\"今年\",\"data\":[";
			String trendlines="";
			float sum1=0;//去年
			float sum2=0;
			List<Map<String, Object>> list=DbHelper.queryForTable(sql);
			for(int i=0;i<list.size();i++){
				Map<String, Object> m=list.get(i);
				categories+="{\"label\":\""+m.get("DQ_NAME")+"\"},";
				dataset1+="{\"value\":\""+m.get("NUM2")+"\"},";
				dataset2+="{\"value\":\""+m.get("NUM1")+"\"},";
				sum1+=Float.parseFloat(m.get("NUM1").toString());
				sum2+=Float.parseFloat(m.get("NUM2").toString());
			}
			if("[{ \"category\":[".equals(categories)){
				categories="";
				dataset1="";
				dataset2="";
			}else{
				categories=categories.substring(0,categories.length()-1)+"]}]";
				dataset1=dataset1.substring(0, dataset1.length()-1)+"]}";
				dataset2=dataset2.substring(0, dataset2.length()-1)+"]}";
				trendlines="[{\"line\": [ {" +
						"\"startvalue\": \""+(sum1/list.size())+"\"," +
						"\"color\": \"#0075c2\"," +
						"\"displayvalue\": \"去年平均水平\"," +
						"\"valueOnRight\": \"1\"," +
						"\"thickness\": \"1\"," +
						"\"showBelow\": \"1\"," +
						"\"tooltext\": \"去年平均水平: "+(String.format("%.1f", (sum1/list.size())))+"K\"" +
						"}," +
						"{" +
						"\"startvalue\": \""+(sum2/list.size())+"\"," +
						"\"color\": \"#1aaf5d\"," +
						"\"displayvalue\": \"今年平均水平\"," +
						"\"valueOnRight\": \"1\"," +
						"\"thickness\": \"1\"," +
						"\"showBelow\": \"1\"," +
						"\"tooltext\": \"今年平均水平: "+(String.format("%.1f", (sum2/list.size())))+"K\"" +
						"}]}]";
			}
			JSONObject json=new JSONObject();
			json.accumulate("chart", chart);
			json.accumulate("categories", JSONArray.fromObject(categories));
			json.accumulate("dataset", JSONArray.fromObject("["+dataset1+","+dataset2+"]"));
			json.accumulate("trendlines", JSONArray.fromObject(trendlines));
			response.getWriter().print(json);
		}
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
