package com.lzcb.bigitem.dao;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONArray;

import com.lzcb.bigitem.Entity.Nry;
import com.lzcb.bigitem.utils.BeanRefUtil;
import com.lzcb.bigitem.utils.DbHelper;
import com.lzcb.bigitem.utils.FileUADHelper;
import com.lzcb.bigitem.utils.PageHelper;

public class NryDaoImpl implements NryDao {

	@Override
	public List<Map<String, Object>> queryTable(String sql, PageHelper p) {
		if(p!=null){
			int begin=(p.getNowPage()-1)*p.getRecordNum();
			int end=p.getNowPage()*p.getRecordNum();
			System.out.println("dao:"+sql);
			//sql=sql.replaceFirst("select ", "select rownum r,");
			sql="select * from (select rownum r,t.* from ("+sql+p.getCondition()+" order by ll.id desc ) t) tt where r>"+begin+" and r<="+end+" order by r";
		}
		return DbHelper.queryForTable1(sql,"ZW");
	}

	@Override
	public Map<String, Object> queryARecord(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean addNry(HttpServletRequest request,String id) {
		//String id=DbHelper.queryForString("select seq_t_nry.nextval from dual");
		Nry xx=new Nry();
		FileUADHelper.uploadFile(request, "t_nry", id,xx,"");
		xx.setId(id);
		String sql=BeanRefUtil.makeInsertSQLForBean(xx, "t_nry", true);
		if("NoData!".equals(sql)){
			System.out.println(sql);
			return false;
		}
		return DbHelper.update(sql);
	}

	@Override
	public boolean updateNry(HttpServletRequest request, String id) {
		Nry xx=new Nry();
		FileUADHelper.uploadFile(request, "t_nry", id,xx,"update");
		xx.setId(id);
		String sql=BeanRefUtil.makeUpdateSQLForBean(xx, "t_nry");
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
			sql="select * from (select rownum r,t.* from ("+sql+p.getCondition()+" order by xx.id desc ) t) tt where r>"+begin+" and r<="+end+" order by r";
		}
		JSONArray jsona=JSONArray.fromObject(DbHelper.queryForTable1(sql,"ZW"));
		return jsona;
	}
	
			
	
			
}
