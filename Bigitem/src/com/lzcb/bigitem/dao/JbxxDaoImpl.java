package com.lzcb.bigitem.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import com.lzcb.bigitem.utils.DbHelper;

public class JbxxDaoImpl implements JbxxDao {
	private static Set<String> stack;
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
		if(sjjd==null&&!"".equals(sjjd))
			sql="select * from bi_dqxxb b where b.sjjd_dm is null";
		else sql="select * from bi_dqxxb b where b.sjjd_dm="+sjjd;
		List<Map<String, Object>> list=DbHelper.queryForTable(sql);
		if(list.size()>0){
			ul+="<ul>";
			for(int i=0;i<list.size();i++){
				Map<String, Object> m=list.get(i);
//				if(sjjd==null){
//					ul+="<li><label>"+m.get("DQ_NAME")+"</label>&nbsp<a target='mainPage' href='JSP/jbxx/dqxxEditer.jsp?dqid="+m.get("ID")+"'>编辑</a>";
//					ul+=buildulist(m.get("ID")+"");
//					ul+="</li>";
//				}else{
					ul+="<li><label>"+m.get("DQ_NAME")+"</label>&nbsp<a data-num-p='1202' target='mainPage' href='JSP/jbxx/dqxxEditer.jsp?dqid="+m.get("ID")+"'>编辑</a>";
					ul+=buildulist(m.get("ID")+"");
					ul+="</li>";
//				}
			}
			ul+="</ul>";
		}else{
			ul="<label class='endNode'/>";
		}
		return ul;
	}
	
	public static void main(String[] args) {
		System.out.println(getDQs("127"));
	}

	@Override
	public Map<String, Object> queryARecord(String id) {
		String sql="select * from bi_dqxxb where id="+id;
		return DbHelper.queryARow(sql);
	}
	/**
	 * 获取地区权限
	 * @param uid
	 * @return
	 */
	public static String getDQs(String uid){
		String sql="select djmap.did from djmap where djmap.jid in (select userjs.js_id from userjs where userjs.user_id= '"+uid+"')";
		String dqs="";
		List list=DbHelper.queryForList(sql);
		stack=new HashSet();
		getDQList(list);
		Iterator it=stack.iterator();
		while(it.hasNext()){
			dqs+=it.next()+",";
		}
		
		if("".equals(dqs)){
			return "-1";
		}else{
			return dqs.substring(0, dqs.length()-1);
		}
		
	}
	public static String getDQsbyid(String dqid){
		List list=new ArrayList();
		String dqs="";
		list.add(dqid);
		stack=new HashSet();
		getDQList(list);
		Iterator it=stack.iterator();
		while(it.hasNext()){
			dqs+=it.next()+",";
		}
		return dqs.substring(0, dqs.length()-1);
	}
	/**
	 * 递归获取地区权限
	 * @param l
	 */
	private static void getDQList(List l){
		if(l!=null&&l.size()>0){
			String dqs="";
			String sql="select id from bi_dqxxb where sjjd_dm in (dqs) and id not in (dqs)";
			for(int i=0;i<l.size();i++){
				stack.add(l.get(i).toString());
			}
			Iterator it=stack.iterator();
			while(it.hasNext()){
				dqs+=it.next()+",";
			}
			sql=sql.replaceAll("dqs", dqs.substring(0, dqs.length()-1));
			getDQList(DbHelper.queryForList(sql));
		}
		return;
	}
}
