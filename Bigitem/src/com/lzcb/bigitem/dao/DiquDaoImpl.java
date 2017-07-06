package com.lzcb.bigitem.dao;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.lzcb.bigitem.Entity.Diqu;
import com.lzcb.bigitem.utils.DbHelper;

public class DiquDaoImpl implements DiquDao {

	@Override
	public List<Diqu> findAllDiqu() {
		// TODO Auto-generated method stub
		List<Diqu> list=null;
		Diqu diqu=null;
		
		String sql="select * from BI_DQXXB";
		List<Map<String, Object>> map = DbHelper.queryForTable(sql);
		if(map.size()>0){
			list=new ArrayList<Diqu>();
			for(int i=0;i<map.size();i++){
				Map<String, Object> m = map.get(i);
				diqu=new Diqu();
				BigDecimal bd_id=(BigDecimal) m.get("ID");
				int id=bd_id.intValue();
				diqu.setId(id);
				diqu.setDq_name((String)m.get("DQ_NAME"));
				list.add(diqu);
			}
		}
		return list;
	}

	@Override
	public List<Integer> findXjjd(int id) {
		// TODO Auto-generated method stub
DiquDao dao=new DiquDaoImpl();
		
		String sql="select id from BI_DQXXB where sjjd_dm="+id+"";
		List<BigDecimal> listbd=DbHelper.queryForList(sql);
		List<Integer> list=null;
		List<Integer> listcp=null;
		if(listbd.size()>0){
			list=new ArrayList<Integer>();
			
			for(BigDecimal bd:listbd){
				list.add(bd.intValue());
			}
			listcp=new ArrayList<Integer>(list);
			for(int i:listcp){
				List<Integer> listxj=dao.findXjjd(i);
				if(listxj!=null){
					list.addAll(listxj);
				}
				
			}
			
		}
		
		
		
		return list;
	}

}
