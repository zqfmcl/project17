package com.lzcb.bigitem.dao;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.lzcb.bigitem.Entity.Juese;
import com.lzcb.bigitem.utils.DbHelper;

public class JueseDaoImpl implements JueseDao {

	@Override
	public void addJuese(Juese juese) {
		// TODO Auto-generated method stub
		String sql="insert into BI_JSXX(id,JS_NAME,XT_NAME,JS_JHZT,JS_XTJSBZ) values(seq_bi_bmxx.nextval,'"+juese.getJs_name()+"','"+juese.getXt_name()+"','"+juese.getJs_jhzt()+"','"+juese.getJs_xtjsbz()+"')";
		boolean is=DbHelper.update(sql);
	}

	@Override
	public void updateJuese(Juese juese) {
		// TODO Auto-generated method stub
		String sql="update BI_JSXX set JS_NAME='"+juese.getJs_name()+"',XT_NAME='"+juese.getXt_name()+"',JS_JHZT='"+juese.getJs_jhzt()+"',JS_XTJSBZ='"+juese.getJs_xtjsbz()+"' where id="+juese.getId()+"";
		DbHelper.update(sql);
	}

	@Override
	public void deleteJuese(int id) {
		// TODO Auto-generated method stub
		String sql="delete BI_JSXX where id="+id;
		String sql2 = "delete from USERJS where JS_ID="+id+"";
		DbHelper.update(sql);
		DbHelper.update(sql2);
	}

	@Override
	public List<Juese> findJueseAll() {
		// TODO Auto-generated method stub
		List<Juese> list=null;
		Juese juese=null;
		String sql="select * from BI_JSXX";
		List<Map<String, Object>> mlist = DbHelper.queryForTable(sql);
		if(mlist.size()>0){
			list=new ArrayList<Juese>();
			for(int i=0;i<mlist.size();i++){
				Map<String, Object> m=mlist.get(i);
				juese=new Juese();
				BigDecimal bd=(BigDecimal) m.get("ID");
				int id=bd.intValue();
				juese.setId(id);
				juese.setJs_name((String)m.get("JS_NAME"));
				juese.setXt_name((String)m.get("XT_NAME"));
				juese.setJs_jhzt((String)m.get("JS_JHZT"));
				juese.setJs_xtjsbz((String)m.get("JS_XTJSBZ"));
				list.add(juese);
			}
		}
		return list;
	}

	@Override
	public Juese findJueseById(int id) {
		// TODO Auto-generated method stub
		Juese juese=null;
		String sql="select * from BI_JSXX where id="+id+"";
		Map<String, Object> m = DbHelper.queryARow(sql);
		if(m!=null){
			juese=new Juese();
			BigDecimal bd=(BigDecimal) m.get("ID");
			int id2=bd.intValue();
			juese.setId(id2);
			juese.setJs_name((String)m.get("JS_NAME"));
			juese.setXt_name((String)m.get("XT_NAME"));
			juese.setJs_jhzt((String)m.get("JS_JHZT"));
			juese.setJs_xtjsbz((String)m.get("JS_XTJSBZ"));
		}
		return juese;
	}

	@Override
	public List<Integer> findPowerById(int id) {
		// TODO Auto-generated method stub
		String sql="select PID from pjmap where JID="+id+"";
		List<BigDecimal> bdlist=DbHelper.queryForList(sql);
		List<Integer> list=null;
		if(bdlist!=null){
			list=new ArrayList<Integer>();
			for(BigDecimal bd:bdlist){
				list.add(bd.intValue());
			}
		}
		
		
		return list;
	}

	@Override
	public void updatePower(String[] powerstr, int jsid) {
		// TODO Auto-generated method stub
		String sql="delete from pjmap where jid = "+jsid+"";
		DbHelper.update(sql);
		if(powerstr!=null&&powerstr.length>0){			
			for(String powerid:powerstr){
				String sql2="insert into PJMAP(ID,PID,JID) values(seq_pjmap.nextval,"+Integer.parseInt(powerid)+","+jsid+")";
				DbHelper.update(sql2);
			}
		}
	}

	@Override
	public List<Integer> findDiquById(int jsid) {
		// TODO Auto-generated method stub
		List<Integer> list=null;
		
		String sql="select DID from DJMAP where JID="+jsid+"";
		List<BigDecimal> bdlist=DbHelper.queryForList(sql);
		if(bdlist!=null){
			list=new ArrayList<Integer>();
			for(BigDecimal bd:bdlist){
				list.add(bd.intValue());
			}
		}
		return list;
	}

	@Override
	public void updateDiqu(String[] jsdqstr, int jsid) {
		// TODO Auto-generated method stub
		String sql="delete from DJMAP where JID="+jsid+"";
		DbHelper.update(sql);
		if(jsdqstr!=null&&jsdqstr.length>0){
			
			for(String dqid:jsdqstr){
				String sql2="insert into DJMAP(ID,DID,JID) values(seq_djmap.nextval,"+dqid+","+jsid+")";
				DbHelper.update(sql2);
			}
			
		}
		
	}

	@Override
	public String queryuList(String sjjd) {
		// TODO Auto-generated method stub
		String ul=buildulist(sjjd);
		return ul;
	}
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
					ul+="<li><input name=\"dq_id\" type='checkbox' id=\""+m.get("ID")+"\" value=\""+m.get("ID")+"\" /><label>"+m.get("DQ_NAME")+"</label>";
					ul+=buildulist(m.get("ID")+"");
					ul+="</li>";
			}
			ul+="</ul>";
		}else{
			ul="<label class='endNode'/>";
		}
		return ul;
	}

}
