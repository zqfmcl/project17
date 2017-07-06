package com.lzcb.bigitem.dao;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.lzcb.bigitem.Entity.Pinglun;
import com.lzcb.bigitem.utils.DbHelper;

public class PinglunDaoImpl implements PinglunDao {

	@Override
	public void addPinglun(Pinglun pl) {
		// TODO Auto-generated method stub
		String sql="select PLCS from BI_WTPL where wtid="+pl.getWtid()+" order by PLTIME desc";
		String cs = DbHelper.queryForString(sql);
		
		
		int plcs=1;
		if(cs!=null){
	
			plcs=Integer.parseInt(cs)+1;
		}
		
		String sql3="select LRRID from BI_XMWTGL where id="+pl.getWtid()+"";
		String twrid = DbHelper.queryForString(sql3);
		int twr=Integer.parseInt(twrid);
		
		String sql2="insert into BI_WTPL(ID,WTID,PLRID,PLNR,PLTIME,BPLR,ISCK,TWR,LZCK,PLCS) values(seq_bi_wtpl.nextval,"+pl.getWtid()+","+pl.getPlrid()+",'"+pl.getPlnr()+"','"+pl.getPltime()+"',"+pl.getBplr()+",'否',"+twr+",'否',"+plcs+")";
		DbHelper.update(sql2);
		String sql4="update BI_XMWTGL set PLSJ='"+pl.getPltime()+"' where id="+pl.getWtid()+"";
		DbHelper.update(sql4);
	}

	@Override
	public List<Pinglun> findAllPinglun(int wtid) {
		// TODO Auto-generated method stub
		List<Pinglun> list=null;
		Pinglun pl=null;
		String sql="select p.*,w.BT,t1.USERNAME as PLRNAME,t2.USERNAME as BPLRNAME,t3.USERNAME as TWRNAME from BI_WTPL p LEFT OUTER JOIN BI_XMWTGL w on w.ID=p.WTID LEFT OUTER JOIN TUSER t1 on t1.ID=p.PLRID LEFT OUTER JOIN TUSER t2 on t2.ID=p.BPLR LEFT OUTER JOIN TUSER t3 on t3.ID=p.TWR Where WTID="+wtid+" ORDER BY PLTIME";
		List<Map<String, Object>> mlist = DbHelper.queryForTable(sql);
		if(mlist.size()>0){
			list=new ArrayList<Pinglun>();
			for(int i=0;i<mlist.size();i++){
				Map<String, Object> m = mlist.get(i);
				pl=new Pinglun();
				BigDecimal bd_id = (BigDecimal) m.get("ID");
				int id = bd_id.intValue();
		
				BigDecimal bd_plrid = (BigDecimal) m.get("PLRID");
				int plrid = bd_plrid.intValue();
				BigDecimal bd_bplr = (BigDecimal) m.get("BPLR");
				int bplr = bd_bplr.intValue();
				BigDecimal bd_twr = (BigDecimal) m.get("TWR");
				int twr = bd_twr.intValue();
				BigDecimal bd_plcs = (BigDecimal) m.get("PLCS");
				int plcs = bd_plcs.intValue();
				String plnr=(String) m.get("PLNR");
				String pltime=(String) m.get("PLTIME");
				String plrname=(String)m.get("PLRNAME");
				String bplrname=(String)m.get("BPLRNAME");
				String twrname=(String)m.get("TWRNAME");
				pl.setId(id);
				pl.setBplr(bplr);
				pl.setBplrname(bplrname);
				pl.setPlcs(plcs);
				pl.setPlnr(plnr);
				pl.setPlrid(plrid);
				pl.setPlrname(plrname);
				pl.setPltime(pltime);
				pl.setTwr(twr);
				pl.setTwrname(twrname);
				pl.setWtid(wtid);
				list.add(pl);
				
			}
		}
		return list;
	}

	@Override
	public void updateTwrck(int wtid, int twrid) {
		// TODO Auto-generated method stub
		String sql="update BI_WTPL SET LZCK='是' where WTID="+wtid+" and TWR="+twrid+"";
		DbHelper.update(sql);
	}

	@Override
	public void updateBplrck(int wtid, int bplr) {
		// TODO Auto-generated method stub
		String sql="update BI_WTPL SET ISCK='是' where WTID="+wtid+" and BPLR="+bplr+"";
		DbHelper.update(sql);
	}

	@Override
	public int isckPinglun(int wtid, int bplr) {
		// TODO Auto-generated method stub
		String sql="select count(*) from BI_WTPL where ISCK='否' and WTID="+wtid+" and BPLR="+bplr+"";
		String countstr = DbHelper.queryForString(sql);
		int count =Integer.parseInt(countstr);
		return count;
	}

	@Override
	public int lzckPinglun(int wtid, int twrid) {
		// TODO Auto-generated method stub
		String sql="select count(*) from BI_WTPL where LZCK='否' and WTID="+wtid+" and TWR="+twrid+"";
		String countstr = DbHelper.queryForString(sql);
		int count =Integer.parseInt(countstr);
		return count;
	}


}
