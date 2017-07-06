<%@page import="com.lzcb.bigitem.dao.JbxxDaoImpl"%>
<%@page import="com.lzcb.bigitem.dao.JbxxDao"%>
<%@page import="com.lzcb.bigitem.utils.DbHelper"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'dqxxEditer.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="CSS/bi.main.css">
<style type="text/css">
.div-title {
	padding: 10px;
	border-bottom-style: solid;
	border-bottom-width: 1px;
	border-bottom-color: #ccc;
	border-bottom-width: 1px;
}

.form-editer {
	padding: 10px;
	border-width: 1px;
	border-style: solid;
	border-color: #ccc;
	border-radius: 3px;
}

td {
	padding: 5px;
	vertical-align: top;
	text-align: right;
}

input, select, textarea {
	text-align: left;
}

.btn{
	min-height: 0px;
	text-align: center;
}


[type="text"], select, textarea {
	width: 100%;
}
</style>
<%
	JbxxDao dao=new JbxxDaoImpl();
	String dqid=request.getParameter("dqid");
	Map rec=dao.queryARecord(dqid);
	Object sjjd=rec.get("SJJD_DM");
	String method="method=dqxxUpdate&dqid="+dqid;
	String option="";
	if(sjjd!=null){
		String ssj=DbHelper.queryForString("select sjjd_dm from bi_dqxxb where id="+sjjd);
		if(ssj!=null){
			List<Map<String,Object>> list=DbHelper.queryForTable("select * from bi_dqxxb where sjjd_dm= '"+ssj+"' order by pxh,dq_name");
			for(int i=0;i<list.size();i++)
			{
				Map m=list.get(i);
				option+="<option value='"+m.get("ID")+"' ";
				if(sjjd.equals(m.get("ID"))){
					option+="selected='selected'";
				}
				option+= " >"+m.get("DQ_NAME")+"</option>";
			}
		}else{
			List<Map<String,Object>> list=DbHelper.queryForTable("select * from bi_dqxxb where sjjd_dm is null order by pxh,dq_name");
			for(int i=0;i<list.size();i++)
			{
				Map m=list.get(i);
				option+="<option value='"+m.get("ID")+"' ";
				if(sjjd.equals(m.get("ID"))){
					option+="selected='selected'";
				}
				option+= " >"+m.get("DQ_NAME")+"</option>";
			}
		}
	}else{
		option="<option value=''>根节点</option>";
	}
 %>
  </head>
  
  <body>
    <div class="div-title">
		<span style="font-size: 20px;">编辑地区</span> &nbsp;<a
			style="text-decoration: none;font-size: 12px;" target="mainPage"
			href="javascript:history.back(-1)">返回列表</a>
	</div>
	<div style="margin-left: 20px;">
	<h5
			style="border-bottom-style:solid; border-bottom-width: 1px; border-bottom-color: #ccc;">编辑地区信息</h5>
		
    <form method="post" id="form1" name="form1" action="Jbxx.do?<%=method%>">
    <div class="form-editer">
    	<table>
    		<tr>
    			<td>名称：</td><td><input id="dqmc" name="dqmc" type="text" value="<%=(rec.get("DQ_NAME")==null?"":rec.get("DQ_NAME")+"")%>"/></td>
    		</tr><tr>
    			<td>父级：</td>
    			<td>
    				<select name="sjjd">
    					<%=option %>
    				</select>
    			</td>
    		</tr><tr>
    			<td>排序</td><td><input id="pxh" name="pxh" type="text" value="<%=(rec.get("PXH")==null?"":rec.get("PXH")+"")%>"/></td>
    		</tr><tr>
    			<td>备注</td><td><input id="bz" name="bz" type="text" value="<%=(rec.get("BZ")==null?"":rec.get("BZ")+"")%>"/></td>
    		</tr><tr>
    			<td><input type="submit" class="btn" value="保存"/></td>
    			<td><input type="button" class="btn" value="删除" onclick='javascript:location.href="Jbxx.do?<%="method=dqxxDel&dqid="+dqid%>"'/></td>
    		</tr>
    	</table>
    	</div>
    </form>
    </div>
  </body>
</html>
