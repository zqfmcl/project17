package com.lzcb.bigitem.dao;

import java.util.List;
import java.util.Map;

import com.lzcb.bigitem.utils.DbHelper;

public class CyxxDaoImpl implements JbxxDao {

	@Override
	public List<Map<String, Object>> queryTable(String sql) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String queryuList(String sjjd) {
		String ul=buildulist(sjjd);
		return ul;
	}
	/**
	 * 递归动态构建<ul>格式字符串
	 * @param sjjd
	 * @return
	 */
	private String buildulist(String sjjd){
		String sql;
		String ul="";
		sql="select * from bi_cyxxb b where b.sjjd_dm="+sjjd;
		List<Map<String, Object>> list=DbHelper.queryForTable(sql);
		if(list.size()>0){
			ul+="<ul>";
			for(int i=0;i<list.size();i++){
				Map<String, Object> m=list.get(i);
				ul+="<li><label>"+m.get("CY_NAME")+"</label>&nbsp<a data-num-p='1102' target='mainPage' href='JSP/jbxx/cyxxEditer.jsp?cyid="+m.get("ID")+"'>编辑</a>";
				ul+=buildulist(m.get("ID")+"");
				ul+="</li>";
			}
			ul+="</ul>";
		}else{
			ul="<label class='endNode'/>";
		}
		return ul;
	}
	
	public static void main(String[] args) {
		System.out.println(new CyxxDaoImpl().queryuList("0"));
	}

	@Override
	public Map<String, Object> queryARecord(String id) {
		String sql="select * from bi_cyxxb where id="+id;
		return DbHelper.queryARow(sql);
	}

}
