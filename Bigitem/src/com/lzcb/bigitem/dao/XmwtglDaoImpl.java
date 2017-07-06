package com.lzcb.bigitem.dao;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.lzcb.bigitem.Entity.Xmwtgl;
import com.lzcb.bigitem.utils.DbHelper;

public class XmwtglDaoImpl implements XmwtglDao {
	public int sump;
	@Override
	public void addXmwt(Xmwtgl xmwt) {
		// TODO Auto-generated method stub
		String sql="insert into BI_XMWTGL(id,xmid,bt,wtms,wtqk,lxr,lxdh,syzt,lrrid,plsj,lrsj) values(seq_bi_xmwtgl.nextval,"+xmwt.getXmid()+",'"+xmwt.getBt()+"','"+xmwt.getWtms()+"','"+xmwt.getWtqk()+"','"+xmwt.getLxr()+"','"+xmwt.getLxdh()+"','未审阅',"+xmwt.getLrr()+",'"+xmwt.getPlsj()+"','"+xmwt.getLrsj()+"')";
		DbHelper.update(sql);
		
	}

	@Override
	public List<Xmwtgl> findXmwt(List<Integer> dqlist,int now,int recp) {
		// TODO Auto-generated method stub
		String str="";
		for(int i=0;i<dqlist.size();i++){
			if(i<dqlist.size()-1){
				str+="SZQX="+dqlist.get(i)+" or ";
			}else{
				str+=" SZQX="+dqlist.get(i);
			}
			
		}
		Xmwtgl xmwt=null;
		List<Xmwtgl> list=null;
		int sum=DbHelper.queryCountForInt("select count(1) from (select w.*,x.SZQX,x.JSDWMC,x.XMMC from BI_XMWTGL w INNER JOIN BI_XMXX x on w.XMID=x.id where 1=1 and ("+str+")) t");
		sump=sum/recp;
		if(sum%recp!=0)sump++;
		String sql="select * from (select rownum r,t.* from (select w.*,x.SZQX,x.JSDWMC,x.XMMC from BI_XMWTGL w INNER JOIN BI_XMXX x on w.XMID=x.id where 1=1 and ("+str+") order by PLSJ DESC) t) tt where r>"+((now-1)*recp)+" and r<="+(now*recp);
		List<Map<String, Object>> mlist = DbHelper.queryForTable(sql);
		if(mlist.size()>0){
			list=new ArrayList<Xmwtgl>();
			for(int i=0;i<mlist.size();i++){
				Map<String, Object> m = mlist.get(i);
				xmwt=new Xmwtgl();
				BigDecimal bd_id=(BigDecimal)m.get("ID");
				int id=bd_id.intValue();
				xmwt.setId(id);
				BigDecimal bd_xmid=(BigDecimal)m.get("XMID");
				int xmid=bd_xmid.intValue();
				xmwt.setXmid(xmid);
				
				xmwt.setBt((String)m.get("BT"));
				xmwt.setJsdwmc((String)m.get("JSDWMC"));
				xmwt.setWtms((String)m.get("WTMS"));
				xmwt.setWtqk((String)m.get("WTQK"));
				xmwt.setLxr((String)m.get("LXR"));
				xmwt.setLxdh((String)m.get("LXDH"));
				xmwt.setSyzt((String)m.get("SYZT"));
				xmwt.setXmmc((String)m.get("XMMC"));
				xmwt.setPlsj((String)m.get("PLSJ"));
				xmwt.setLrsj((String)m.get("LRSJ"));
				xmwt.setWdxx("否");
				list.add(xmwt);
			}
		}
		
		return list;
	}
	/*public static void main(String[] args) {
		DiquDao dqdao=new DiquDaoImpl();
		XmwtglDao wtdao=new XmwtglDaoImpl();
		List<Integer> dq_list=dqdao.findXjjd(116);
		if(dq_list==null){
			dq_list=new ArrayList<Integer>();
			dq_list.add(117);
		}
		System.out.println("sdsdsd"+dq_list);
		List<Xmwtgl> xmwtlist=wtdao.findXmwt(dq_list);
		System.out.println("zxzxzx"+xmwtlist);
	}*/

	@Override
	public void updateXmwt(Xmwtgl xmwt) {
		// TODO Auto-generated method stub
		String sql="update BI_XMWTGL set BT='"+xmwt.getBt()+"',WTMS='"+xmwt.getWtms()+"',WTQK='"+xmwt.getWtqk()+"',LXR='"+xmwt.getLxr()+"',LXDH='"+xmwt.getLxdh()+"',PLSJ='"+xmwt.getPlsj()+"' where id="+xmwt.getId();
		DbHelper.update(sql);
	}

	@Override
	public void deleteXmwt(int id) {
		// TODO Auto-generated method stub
		String sql="delete from BI_XMWTGL where id="+id;
		DbHelper.update(sql);
		String sql2="delete from BI_WTPL where WTID ="+id;
		DbHelper.update(sql2);
	}

	@Override
	public void SyXmwt(int id) {
		// TODO Auto-generated method stub
		String sql="update BI_XMWTGL set SYZT='已审阅' where id="+id;
		DbHelper.update(sql);

	}

	@Override
	public Xmwtgl findXmwtById1(int id,int now,int recp) {
		// TODO Auto-generated method stub
		int sum=DbHelper.queryCountForInt("select count(1) from (select w.*,x.SZQX,x.JSDWMC,x.XMMC from BI_XMWTGL w INNER JOIN BI_XMXX x on w.XMID=x.id where 1=1 ) t");
		sump=sum/recp;
		if(sum%recp!=0)sump++;
		String sql="select * from (select rownum r,t.* from (select w.*,x.SZQX,x.JSDWMC,x.XMMC from BI_XMWTGL w INNER JOIN BI_XMXX x on w.XMID=x.id where w.ID="+id+"  order by PLSJ DESC) t) tt where r>"+((now-1)*recp)+" and r<="+(now*recp);
//		String sql="select w.*,x.SZQX,x.JSDWMC,x.XMMC from BI_XMWTGL w INNER JOIN BI_XMXX x on w.XMID=x.id where w.ID="+id;
		Map<String, Object> m = DbHelper.queryARow(sql);
		Xmwtgl xmwt=null;
		if(m!=null){
			xmwt=new Xmwtgl();
			xmwt.setBt((String)m.get("BT"));
			xmwt.setId(id);
			xmwt.setJsdwmc((String)m.get("SJDWMC"));
			xmwt.setLxdh((String)m.get("LXDH"));
			xmwt.setLxr((String)m.get("LXR"));
			xmwt.setWtms((String)m.get("WTMS"));
			xmwt.setWtqk((String)m.get("WTQK"));
			xmwt.setXmmc((String)m.get("XMMC"));
			xmwt.setPlsj((String)m.get("PLSJ"));
			xmwt.setLrsj((String)m.get("LRSJ"));
			BigDecimal bd_lrr=(BigDecimal)m.get("LRRID");
			int lrr=bd_lrr.intValue();
			xmwt.setLrr(lrr);
		}
		return xmwt;
	}
	
	@Override
	public Xmwtgl findXmwtById(int id) {
		String sql="select w.*,x.SZQX,x.JSDWMC,x.XMMC from BI_XMWTGL w INNER JOIN BI_XMXX x on w.XMID=x.id where w.ID="+id;
		Map<String, Object> m = DbHelper.queryARow(sql);
		Xmwtgl xmwt=null;
		if(m!=null){
			xmwt=new Xmwtgl();
			xmwt.setBt((String)m.get("BT"));
			xmwt.setId(id);
			xmwt.setJsdwmc((String)m.get("SJDWMC"));
			xmwt.setLxdh((String)m.get("LXDH"));
			xmwt.setLxr((String)m.get("LXR"));
			xmwt.setWtms((String)m.get("WTMS"));
			xmwt.setWtqk((String)m.get("WTQK"));
			xmwt.setXmmc((String)m.get("XMMC"));
			xmwt.setPlsj((String)m.get("PLSJ"));
			xmwt.setLrsj((String)m.get("LRSJ"));
			BigDecimal bd_lrr=(BigDecimal)m.get("LRRID");
			int lrr=bd_lrr.intValue();
			xmwt.setLrr(lrr);
		}
		return xmwt;
	}

	@Override
	public List<Xmwtgl> findXmxxByDqId(List<Integer> dqlist) {
		// TODO Auto-generated method stub
		String str="";
		for(int i=0;i<dqlist.size();i++){
			if(i<dqlist.size()-1){
				str+="SZQX="+dqlist.get(i)+" or ";
			}else{
				str+=" SZQX="+dqlist.get(i);
			}
			
		}
		Xmwtgl xmwt=null;
		List<Xmwtgl> list=null;
		String sql="select ID,XMMC from  BI_XMXX where 1=1 and ("+str+")";
		
		List<Map<String, Object>> mlist = DbHelper.queryForTable(sql);
		if(mlist.size()>0){
			list=new ArrayList<Xmwtgl>();
			for(int i=0;i<mlist.size();i++){
				Map<String, Object> m = mlist.get(i);
				xmwt=new Xmwtgl();
				BigDecimal bd_id=(BigDecimal)m.get("ID");
				int id=bd_id.intValue();
				xmwt.setXmid(id);
				xmwt.setXmmc((String)m.get("XMMC"));
				list.add(xmwt);
			}
		}
		
		return list;
	}
	
	@Override
	public List<Xmwtgl> findXmwtByLrrId1(int userid, int now, int recp) {
		int sum=DbHelper.queryCountForInt("select count(1) from (select w.*,x.SZQX,x.JSDWMC,x.XMMC from BI_XMWTGL w INNER JOIN BI_XMXX x on w.XMID=x.id where 1=1 ) t");
		sump=sum/recp;
		if(sum%recp!=0)sump++;
		String sql="select * from (select rownum r,t.* from (select w.*,x.SZQX,x.JSDWMC,x.XMMC from BI_XMWTGL w INNER JOIN BI_XMXX x on w.XMID=x.id where w.lrrid="+userid+" order by PLSJ DESC) t) tt where r>"+((now-1)*recp)+" and r<="+(now*recp);
//		String sql="select w.*,x.SZQX,x.JSDWMC,x.XMMC from BI_XMWTGL w INNER JOIN BI_XMXX x on w.XMID=x.id where w.lrrid="+userid+" order by w.PLSJ desc";
		Xmwtgl xmwt=null;
		List<Xmwtgl> list=null;
		List<Map<String, Object>> mlist = DbHelper.queryForTable(sql);
		if(mlist.size()>0){
			list=new ArrayList<Xmwtgl>();
			for(int i=0;i<mlist.size();i++){
				Map<String, Object> m = mlist.get(i);
				xmwt=new Xmwtgl();
				BigDecimal bd_id=(BigDecimal)m.get("ID");
				int id=bd_id.intValue();
				xmwt.setId(id);
				BigDecimal bd_xmid=(BigDecimal)m.get("XMID");
				int xmid=bd_xmid.intValue();
				xmwt.setXmid(xmid);
				
				xmwt.setBt((String)m.get("BT"));
				xmwt.setJsdwmc((String)m.get("JSDWMC"));
				xmwt.setWtms((String)m.get("WTMS"));
				xmwt.setWtqk((String)m.get("WTQK"));
				xmwt.setLxr((String)m.get("LXR"));
				xmwt.setLxdh((String)m.get("LXDH"));
				xmwt.setSyzt((String)m.get("SYZT"));
				xmwt.setXmmc((String)m.get("XMMC"));
				xmwt.setPlsj((String)m.get("PLSJ"));
				xmwt.setLrsj((String)m.get("LRSJ"));
				xmwt.setWdxx("否");
				list.add(xmwt);
			}
		}
		
		return list;
	}

	@Override
	public List<Xmwtgl> findXmwtByLrrId(int userid) {
		// TODO Auto-generated method stub
		String sql="select w.*,x.SZQX,x.JSDWMC,x.XMMC from BI_XMWTGL w INNER JOIN BI_XMXX x on w.XMID=x.id where w.lrrid="+userid+" order by w.PLSJ desc";
		Xmwtgl xmwt=null;
		List<Xmwtgl> list=null;
		List<Map<String, Object>> mlist = DbHelper.queryForTable(sql);
		if(mlist.size()>0){
			list=new ArrayList<Xmwtgl>();
			for(int i=0;i<mlist.size();i++){
				Map<String, Object> m = mlist.get(i);
				xmwt=new Xmwtgl();
				BigDecimal bd_id=(BigDecimal)m.get("ID");
				int id=bd_id.intValue();
				xmwt.setId(id);
				BigDecimal bd_xmid=(BigDecimal)m.get("XMID");
				int xmid=bd_xmid.intValue();
				xmwt.setXmid(xmid);
				
				xmwt.setBt((String)m.get("BT"));
				xmwt.setJsdwmc((String)m.get("JSDWMC"));
				xmwt.setWtms((String)m.get("WTMS"));
				xmwt.setWtqk((String)m.get("WTQK"));
				xmwt.setLxr((String)m.get("LXR"));
				xmwt.setLxdh((String)m.get("LXDH"));
				xmwt.setSyzt((String)m.get("SYZT"));
				xmwt.setXmmc((String)m.get("XMMC"));
				xmwt.setPlsj((String)m.get("PLSJ"));
				xmwt.setLrsj((String)m.get("LRSJ"));
				xmwt.setWdxx("否");
				list.add(xmwt);
			}
		}
		
		return list;
	}

}
