package com.lzcb.bigitem.dao;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONArray;

import com.lzcb.bigitem.Entity.Xmddgl;
import com.lzcb.bigitem.Entity.Xmxx;
import com.lzcb.bigitem.utils.BeanRefUtil;
import com.lzcb.bigitem.utils.DbHelper;
import com.lzcb.bigitem.utils.FileUADHelper;
import com.lzcb.bigitem.utils.PageHelper;

public class XmddsbImpl implements XmddsbDao {

	
	
	@Override
	public List<Map<String, Object>> queryTable(String sql, PageHelper p) {
		if(p!=null){
			int begin=(p.getNowPage()-1)*p.getRecordNum();
			int end=p.getNowPage()*p.getRecordNum();
			//sql=sql.replaceFirst("select ", "select rownum r,");
			//sql="select * from ("+sql+p.getCondition()+") t where r>"+begin+" and r<="+end;
			sql="select * from (select rownum r,t.* from ("+sql+p.getCondition()+" order by  ll.id desc ) t) tt where r>"+begin+" and r<="+end+" order by r";
		}
		return DbHelper.queryForTable(sql);
	}

	@Override
	public Map<String, Object> queryARecord(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean addXmddsb(HttpServletRequest request,String id) {
		//String id=DbHelper.queryForString("select seq_bi_xmddgl.nextval from dual");
		Xmddgl xd=new Xmddgl();
		FileUADHelper.uploadFile(request, "bi_xmddgl", id,xd,"");
		if(xd.getXm()!=null){
		Xmxx xx=new Xmxx();
		FileUADHelper.uploadFile(request, "bi_xmxx", xd.getXm(),xx,"update");}
		xd.setId(id);
		String sql=BeanRefUtil.makeInsertSQLForBean(xd, "bi_xmddgl", true);
		if("NoData!".equals(sql)){
			System.out.println(sql);
			return false;
		}
		return DbHelper.update(sql);
	}
	
	

	@Override
	public boolean addXmddsb1(HttpServletRequest request, String id) {
		
		Xmxx xx=new Xmxx();
		FileUADHelper.uploadFile(request, "bi_xmxx", id,xx,"update");
//		xx.setId(id);
//		String sql=BeanRefUtil.makeUpdateSQLForBean(xx, "bi_xmxx");
//		if("NoData!".equals(sql)){
//			System.out.println(sql);
//			return false;
//		}
//		return DbHelper.update(sql);
		return false;
	}

	@Override
	public boolean updateXmddsb(HttpServletRequest request, String id) {
		Xmddgl xd=new Xmddgl();
		FileUADHelper.uploadFile(request, "bi_xmddgl", id,xd,"update");
		xd.setId(id);
		String sql=BeanRefUtil.makeUpdateSQLForBean(xd, "bi_xmddgl");
		if("NoData!".equals(sql)){
			System.out.println(sql);
			return false;
		}
		return DbHelper.update(sql);
	
	}

	@Override
	public JSONArray queryTableToJSON(String sql, PageHelper p) {
		
		if(p!=null){
			int begin=(p.getNowPage()-1)*p.getRecordNum();
			int end=p.getNowPage()*p.getRecordNum();
			sql=sql.replaceFirst("select ", "select rownum r,");
			sql="select * from ("+sql+p.getCondition()+") t where r>"+begin+" and r<="+end;
		}
		JSONArray jsona=JSONArray.fromObject(DbHelper.queryForTable(sql));
		return jsona;
		
	}
	
}
