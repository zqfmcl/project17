package com.lzcb.bigitem.dao;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.lzcb.bigitem.Entity.Yonghu;
import com.lzcb.bigitem.Entity.YonghuCondition;
import com.lzcb.bigitem.utils.DbHelper;

public class YonghuDaoImpl implements YonghuDao {

	@Override
	public void addYonghu(Yonghu yonghu) {
		// TODO Auto-generated method stub
		int id;
		String[] jsid = yonghu.getJsid();
		String sql = "insert into TUSER(id,USERID,USERNAME,BM_ID,EMAIL,JHZT,PASSWORD,DQ_ID) values(seq_tuser.nextval,'"+yonghu.getUserid()+"','"+yonghu.getUsername()+"',"+yonghu.getBm_id()+",'"+yonghu.getEmail()+"','"+yonghu.getJhzt()+"','"+yonghu.getPassword()+"',"+yonghu.getDq_id()+")";
		DbHelper.update(sql);
		String sql2 = "select id from TUSER where USERID='"+yonghu.getUserid()+"'";
		
		Map<String, Object> m = DbHelper.queryARow(sql2);
		if(m!=null){
			BigDecimal bd=(BigDecimal) m.get("ID");
			id=bd.intValue();
			for (String js : jsid) {
				String sql3 = "insert into USERJS(id,USER_ID,JS_ID)values(seq_userjs.nextval,"+id+","+Integer.parseInt(js)+")";
				DbHelper.update(sql3);
			}
		}
	}

	@Override
	public void upadteYonghu(Yonghu yonghu) {
		// TODO Auto-generated method stub
		int id;
		String[] jsid = yonghu.getJsid();
		String sql = "update TUSER set USERID='"+yonghu.getUserid()+"',USERNAME='"+yonghu.getUsername()+"',BM_ID="+yonghu.getBm_id()+",EMAIL='"+yonghu.getEmail()+"',JHZT='"+yonghu.getJhzt()+"',PASSWORD='"+yonghu.getPassword()+"',DQ_ID="+yonghu.getDq_id()+" where id="+yonghu.getId()+"";
		String sql2 = "delete from USERJS where USER_ID="+yonghu.getId()+"";
		String sql3 = "select id from TUSER where USERID='"+yonghu.getUserid()+"'";
		
		
		DbHelper.update(sql);
		DbHelper.update(sql2);
		Map<String, Object> m = DbHelper.queryARow(sql3);
		if(m!=null){
			BigDecimal bd=(BigDecimal) m.get("ID");
			id=bd.intValue();
			for (String js : jsid) {
				String sql4 = "insert into USERJS(id,USER_ID,JS_ID)values(seq_userjs.nextval,"+id+","+Integer.parseInt(js)+")";
				DbHelper.update(sql4);
			}
		}
	}

	@Override
	public void deleteYonghu(int id) {
		// TODO Auto-generated method stub
		String sql = "delete from USERJS where USER_ID="+id+"";
		String sql2 = "delete from TUSER where id="+id+"";
		DbHelper.update(sql);
		DbHelper.update(sql2);
	}

	@Override
	public Yonghu findById(int id) {
		// TODO Auto-generated method stub
		YonghuDao dao=new YonghuDaoImpl();
		String sql = "select t.*,d.DQ_NAME from TUSER t left outer join BI_BMXX b on t.bm_id=b.id left outer join BI_DQXXB d on t.DQ_ID=d.ID where t.id="+id+"";
		Yonghu yonghu=null;
		Map<String, Object> m = DbHelper.queryARow(sql);
		
		if(m!=null){
			yonghu =new Yonghu();
			BigDecimal bd_id = (BigDecimal) m.get("ID");
			int id2 = bd_id.intValue();
			BigDecimal bd_bmid = (BigDecimal) m.get("BM_ID");
			int bm_id = bd_bmid.intValue();
			BigDecimal bd_dqid=(BigDecimal) m.get("DQ_ID");
			int dq_id=bd_dqid.intValue();
			yonghu.setBm_id(bm_id);
			String strjs = dao.findYhjs(id2);
			yonghu.setBm_name((String) m.get("BM_NAME"));
			yonghu.setId(id2);
			yonghu.setUserid((String) m.get("USERID"));
			yonghu.setUsername((String) m.get("USERNAME"));
			yonghu.setEmail((String) m.get("EMAIL"));
			yonghu.setJhzt((String) m.get("JHZT"));
			yonghu.setPassword((String) m.get("PASSWORD"));
			yonghu.setYhjs(strjs);
			yonghu.setBm_dm((String) m.get("BM_DM"));
			yonghu.setDq_id(dq_id);
			yonghu.setDq_name((String)m.get("DQ_NAME"));
			
		}
		
		
		return yonghu;
	}

	@Override
	public String findYhjs(int id) {
		// TODO Auto-generated method stub
		String str = "";
		YonghuDao dao = new YonghuDaoImpl();
		String sql = "select b.JS_NAME from USERJS u inner join BI_JSXX b on u.js_id=b.id and u.USER_ID="
				+ id + " order by b.id";
		List<String> list = DbHelper.queryForList(sql);
		for (String s : list) {
			str += s + ";";
		}
		if (str.length() - 1 != -1) {
			str = str.substring(0, str.length() - 1);
		} else {
			str = "";
		}
		return str;
	}

	@Override
	public List<Integer> findYhjsId(int yhid) {
		// TODO Auto-generated method stub
		String sql = "select JS_ID from USERJS where user_id="+yhid+"";
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
	public List<Yonghu> findAllYonghu() {
		// TODO Auto-generated method stub
		YonghuDao dao = new YonghuDaoImpl();
		String sql = "select t.*,d.DQ_NAME from TUSER t left outer join BI_BMXX b on t.bm_id=b.id left outer join BI_DQXXB d on t.DQ_ID=d.ID";
		List<Yonghu> list = null;
		Yonghu yonghu = null;
		List<Map<String, Object>> mlist = DbHelper.queryForTable(sql);
		if (mlist.size() > 0) {
			list = new ArrayList<Yonghu>();
			for (int i = 0; i < mlist.size(); i++) {
				Map<String, Object> m = mlist.get(i);
				yonghu = new Yonghu();
				BigDecimal bd_id = (BigDecimal) m.get("ID");
				int id = bd_id.intValue();
				BigDecimal bd_bmid = (BigDecimal) m.get("BM_ID");
				int bm_id = bd_bmid.intValue();
				BigDecimal bd_dqid=(BigDecimal) m.get("DQ_ID");
				int dq_id=bd_dqid.intValue();

				yonghu.setBm_id(bm_id);
				String strjs = dao.findYhjs(id);
				yonghu.setBm_name((String) m.get("BM_NAME"));
				yonghu.setId(id);
				yonghu.setUserid((String) m.get("USERID"));
				yonghu.setUsername((String) m.get("USERNAME"));
				yonghu.setEmail((String) m.get("EMAIL"));
				yonghu.setJhzt((String) m.get("JHZT"));
				yonghu.setPassword((String) m.get("PASSWORD"));
				yonghu.setYhjs(strjs);
				yonghu.setBm_dm((String) m.get("BM_DM"));
				yonghu.setDq_id(dq_id);
				yonghu.setDq_name((String)m.get("DQ_NAME"));

				list.add(yonghu);
			}
		}
		return list;
	}

	@Override
	public List<Yonghu> findBySql(YonghuCondition yhc, int currentPage,
			int pageSize) {
		// TODO Auto-generated method stub
		DiquDao dqdao=new DiquDaoImpl();
		List<Integer> dq_idlist=yhc.getDq_idlist();
		List<Integer> dqlist=new ArrayList<Integer>();
		dqlist.addAll(dq_idlist);
		for(Integer dq_id:dq_idlist){
			List<Integer> diqulist=dqdao.findXjjd(dq_id);
			if(diqulist!=null&&diqulist.size()>0){
				dqlist.addAll(diqulist);
			}
		}
		
		String dqsql="1=1";
		if(dqlist!=null&&"".equals(dqlist)){
			if(dqlist.size()>0){
				dqsql="";
				for(int i=0;i<dqlist.size();i++){
					if(i<dqlist.size()-1){
						dqsql+=" DQ_ID="+dqlist.get(i)+" or ";
					}else{
						dqsql+=" DQ_ID="+dqlist.get(i)+" ";
					}
					
				}
			}
		}else{
			dqsql="1=1";
		}
		
		String email = yhc.getEmail_query();
		String userId = yhc.getUserid_query();
		Integer deptid = yhc.getBmid_query();
		StringBuffer sb = new StringBuffer();
		int[] arr =yhc.getJs_query();
		if (arr != null&&arr[0]!=0) {
			
			sb.append("select * from (select t.* from TUSER t where 1=1 AND("+dqsql+") order by t.id) where 1=1 and id in (select USER_ID from USERJS where JS_ID ="
					+ arr[0] + ")");
			for (int i = 1; i < arr.length; i++) {
				sb.insert(0, "select * from (").append(
						") where 1=1 and id in (select USER_ID from USERJS where JS_ID ="
								+ arr[i] + ")");
			}
		} else {
			sb.append("select * from (select t.* from TUSER t WHERE 1=1 AND ( "+dqsql+") order by t.id) where 1=1");
		}
		sb.insert(0, "select rownum no,x.* from (").append(") x where 1=1");
		if (email != null && !email.trim().equals("")) {
			sb.append(" and x.EMAIL like '%"+email+"%'");			
		}
		if (userId != null && !userId.trim().equals("")) {
			sb.append(" and x.USERID like '%"+userId+"%'");			
		}
		if (deptid != null && deptid!=0) {
			sb.append(" and x.BM_ID = "+deptid+"");			
		}
		int startNo=(currentPage-1)*pageSize+1;
		sb.insert(0, "select * from (").append(" and rownum<"+(startNo+pageSize)+") where no>="+startNo+"");

		
		
		YonghuDao dao = new YonghuDaoImpl();
		String sql =sb.toString();
		List<Yonghu> list = null;
		Yonghu yonghu = null;
		List<Map<String, Object>> mlist = DbHelper.queryForTable(sql);
		if (mlist.size() > 0) {
			list = new ArrayList<Yonghu>();
			for (int i = 0; i < mlist.size(); i++) {
				Map<String, Object> m = mlist.get(i);
				yonghu = new Yonghu();
				BigDecimal bd_id = (BigDecimal) m.get("ID");
				int id = bd_id.intValue();
				BigDecimal bd_bmid = (BigDecimal) m.get("BM_ID");
				int bm_id = bd_bmid.intValue();
				BigDecimal bd_dqid=(BigDecimal) m.get("DQ_ID");
				int dq_id=bd_dqid.intValue();
				String sql2="select DQ_NAME from BI_DQXXB where ID="+dq_id+"";
				String dq_name=DbHelper.queryForString(sql2);
				yonghu.setBm_id(bm_id);
				String strjs = dao.findYhjs(id);
				yonghu.setBm_name((String) m.get("BM_NAME"));
				yonghu.setId(id);
				yonghu.setUserid((String) m.get("USERID"));
				yonghu.setUsername((String) m.get("USERNAME"));
				yonghu.setEmail((String) m.get("EMAIL"));
				yonghu.setJhzt((String) m.get("JHZT"));
				yonghu.setPassword((String) m.get("PASSWORD"));
				yonghu.setYhjs(strjs);
				yonghu.setBm_dm((String) m.get("BM_DM"));
				
				yonghu.setDq_id(dq_id);
				yonghu.setDq_name(dq_name);
				list.add(yonghu);
			}
		}
		return list;
	}

	@Override
	public int queryCount(YonghuCondition yhc) {
		// TODO Auto-generated method stub
		DiquDao dqdao=new DiquDaoImpl();
		List<Integer> dq_idlist=yhc.getDq_idlist();
		List<Integer> dqlist=new ArrayList<Integer>();
		dqlist.addAll(dq_idlist);
		for(Integer dq_id:dq_idlist){
			List<Integer> diqulist=dqdao.findXjjd(dq_id);
			if(diqulist!=null&&diqulist.size()>0){
				dqlist.addAll(diqulist);
			}
		}
		String dqsql=" 1=1 ";
		if(dqlist!=null){
			if(dqlist.size()>0){
				dqsql="";
				for(int i=0;i<dqlist.size();i++){
					if(i<dqlist.size()-1){
						dqsql+=" DQ_ID="+dqlist.get(i)+" or ";
					}else{
						dqsql+=" DQ_ID="+dqlist.get(i)+" ";
					}
					
				}
			}
		}else{
			dqsql="1=1";
		}
		
		String email = yhc.getEmail_query();
		String userId = yhc.getUserid_query();
		Integer deptid = yhc.getBmid_query();
		StringBuffer sb = new StringBuffer();
		StringBuffer sbcount=new StringBuffer();
		int[] arr =yhc.getJs_query();
		
		if (arr != null&&arr[0]!=0) {
			sb.append("select * from (select t.* from TUSER t where 1=1 and ( "+dqsql+") order by t.id) where 1=1 and id in (select USER_ID from USERJS where JS_ID ="
					+ arr[0] + ")");
			for (int i = 1; i < arr.length; i++) {
				sb.insert(0, "select * from (").append(
						") where 1=1 and id in (select USER_ID from USERJS where JS_ID ="
								+ arr[i] + ")");
			}
		} else {
			sb.append("select * from (select t.* from TUSER t where 1=1 and ("+dqsql+") order by t.id) where 1=1");
		}
		
		sbcount.append(sb);
		sbcount.insert(0, "select count(*) from (").append(") x where 1=1");

		sb.insert(0, "select rownum no,x.* from (").append(") x where 1=1");
		if (email != null && !email.trim().equals("")) {
			sbcount.append(" and x.EMAIL like '%"+email+"%'");
			
		}
		if (userId != null && !userId.trim().equals("")) {
			sbcount.append(" and x.USERID like '%"+userId+"%'");			
		}
		if (deptid != null&&deptid!=0) {
			sbcount.append(" and x.BM_ID = "+deptid+"");
		}
		int count = DbHelper.queryCountForInt(sbcount.toString());
		return count;
	}
	@Override
	public String getPower(String id) {
		String power="{";
		String childp="";
		String sql="select powerid from power where power.id in (select pjmap.pid from pjmap where pjmap.jid in (select userjs.js_id from userjs where userjs.user_id='"+id+"')) order by powerid";
		List<String> list=DbHelper.queryForList(sql);
		for(int i=0;i<list.size();i++){
			String p=list.get(i);
			if((!"".equals(childp))&&childp.substring(1, 3).equals(p.substring(0, 2))){
				childp+="'"+p+"':1,";
			}else{
				if(!"".equals(childp)){
					power+=childp.substring(0, childp.length()-1)+"},";
				}
				childp="'"+p.substring(0, 2)+"':{'"+p+"':1,";
			}
		}
		if(!"".equals(childp)){
			power+=childp.substring(0, childp.length()-1)+"},";
		}
		if(list.size()>0)power=power.substring(0,power.length()-1);
		power+="}";
		return power;
	}
	public static void main(String[] args) {
		//{'01':{'0101':1,'0102':1},'02':{'0201':1,'0202':1,'0204':1,'0205':1,'0206':1}}
		System.out.println(new YonghuDaoImpl().getPower("127"));
	}
	public List<Integer> findDqidById(int userid) {
		// TODO Auto-generated method stub
		String sql="select d.DID from USERJS u inner join DJMAP d on u.JS_ID=d.JID where u.USER_ID="+userid+"";
		List<BigDecimal> bdlist=DbHelper.queryForList(sql);

		List<Integer> list=null;
		if(bdlist!=null){
			list=new ArrayList<Integer>();
			for(BigDecimal bd:bdlist){
				
				if(bd!=null){
					list.add(bd.intValue());
				}
				
			}
		}				
		return list;
	}
}
