package com.lzcb.bigitem.dao;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONArray;

import com.lzcb.bigitem.Entity.Xmxx;
import com.lzcb.bigitem.utils.BeanRefUtil;
import com.lzcb.bigitem.utils.DbHelper;
import com.lzcb.bigitem.utils.FileUADHelper;
import com.lzcb.bigitem.utils.PageHelper;

public class XmsbDaoImpl implements XmsbDao {
	
	@Override
	public List<Map<String, Object>> queryTable(String sql, PageHelper p) {
		if(p!=null){
			int begin=(p.getNowPage()-1)*p.getRecordNum();
			int end=p.getNowPage()*p.getRecordNum();
			System.out.println("dao:"+sql);
			//sql=sql.replaceFirst("select ", "select rownum r,");
			sql="select * from (select rownum r,t.* from ("+sql+p.getCondition()+" order by xx.lrsj desc, xx.id ) t) tt where r>"+begin+" and r<="+end+" order by r";
		}
		return DbHelper.queryForTable(sql);
	}

	@Override
	public Map<String, Object> queryARecord(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean addXmxx(HttpServletRequest request) {
		String id=DbHelper.queryForString("select seq_bi_xmxx.nextval from dual");
		Xmxx xx=new Xmxx();
		FileUADHelper.uploadFile(request, "bi_xmxx", id,xx,"");
		xx.setId(id);
		String sql=BeanRefUtil.makeInsertSQLForBean(xx, "bi_xmxx", true);
		if("NoData!".equals(sql)){
			System.out.println(sql);
			return false;
		}
		return DbHelper.update(sql);
	}

	@Override
	public boolean updateXmxx(HttpServletRequest request, String id) {
		Xmxx xx=new Xmxx();
		FileUADHelper.uploadFile(request, "bi_xmxx", id,xx,"update");
		xx.setId(id);
		String sql=BeanRefUtil.makeUpdateSQLForBean(xx, "bi_xmxx");
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
			//sql=sql.replaceFirst("select ", "select rownum r,");
			sql="select * from (select rownum r,t.* from ("+sql+p.getCondition()+" order by xx.lrsj desc, xx.id ) t) tt where r>"+begin+" and r<="+end+" order by r";
		}
		JSONArray jsona=JSONArray.fromObject(DbHelper.queryForTable(sql));
		return jsona;
	}

}
