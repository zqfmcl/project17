package com.lzcb.bigitem.dao;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.lzcb.bigitem.Entity.Department;
import com.lzcb.bigitem.utils.DbHelper;

public class DepartmentDaoImpl implements DepartmentDao {

	@Override
	public void addDepartment(Department department) {
		// TODO Auto-generated method stub
        String sql="insert into BI_BMXX(id,BM_NAME,BM_DM,BM_PXH,BM_SJJD,BM_ZDBH,BM_BZ,BM_LONGNAME) values(seq_bi_bmxx.nextval,'"+department.getBm_name()+"','"+department.getBm_dm()+"',"+ department.getBm_pxh()+","+department.getBm_sjjd()+",'"+department.getBm_zdbh()+"','"+department.getBm_bz()+"','"+department.getBm_longname()+"')";
		
		DbHelper.update(sql);
	}

	@Override
	public void updateDepartment(Department department) {
		// TODO Auto-generated method stub
		DepartmentDao dao=new DepartmentDaoImpl();
		int bm_sjjd=dao.idByDeptName(department.getSjbh());
		Department dept=dao.findDeptById(bm_sjjd);
		String bm_longname="";
		if(bm_sjjd!=-1){
			dept=dao.findDeptById(bm_sjjd);
			bm_longname=dept.getBm_longname()+">>"+department.getBm_name();
		}else{
			bm_longname=department.getBm_name();
		}		
		String sql="update BI_BMXX set BM_NAME='"+department.getBm_name()+"',BM_DM='"+department.getBm_dm()+"',BM_PXH="+department.getBm_pxh()+",BM_SJJD="+bm_sjjd+",BM_ZDBH='"+department.getBm_zdbh()+"',BM_BZ='"+department.getBm_bz()+"',BM_LONGNAME='"+bm_longname+"' where id="+department.getId()+"";
		DbHelper.update(sql);
	}

	@Override
	public void deleteDepartment(int id) {
		// TODO Auto-generated method stub
		String sql="delete BI_BMXX where id="+id+"";
		DbHelper.update(sql);
	}

	@Override
	public List<Department> findDeptAll(int currentPage, int pageSize) {
		// TODO Auto-generated method stub
		List<Department> list=null;
		Department department=null;
		int startNo=(currentPage-1)*pageSize+1;
		
		String sql="select * from (select rownum no,BI_BMXX.* from BI_BMXX where rownum<"+(startNo+pageSize)+") where no>="+startNo+"";
		List<Map<String, Object>> mlist = DbHelper.queryForTable(sql);
		if(mlist.size()>0){
			list=new ArrayList<Department>();
			for(int i=0;i<mlist.size();i++){
				Map<String, Object> m=mlist.get(i);
				department=new Department();
				BigDecimal bd_id=(BigDecimal) m.get("ID");
				int id=bd_id.intValue();
				BigDecimal bd_pxh=(BigDecimal) m.get("BM_PXH");
				int bm_pxh=bd_id.intValue();
				BigDecimal bd_sjjd=(BigDecimal) m.get("BM_SJJD");
				int bm_sjjd=bd_id.intValue();
				department.setId(id);
				department.setBm_name((String)m.get("BM_NAME"));
				department.setBm_dm((String)m.get("BM_DM"));
				department.setBm_pxh(bm_pxh);
				department.setBm_sjjd(bm_sjjd);
				department.setBm_zdbh((String)m.get("BM_ZDBH"));
				department.setBm_bz((String)m.get("BM_BZ"));
				department.setBm_longname((String)m.get("BM_LONGNAME"));
				
				list.add(department);
			}
		}
		return list;
	}

	@Override
	public List<Department> findDeptAll() {
		// TODO Auto-generated method stub
		List<Department> list=null;
		Department department=null;
		
		
		String sql="select * from BI_BMXX";
		List<Map<String, Object>> mlist = DbHelper.queryForTable(sql);
		if(mlist.size()>0){
			list=new ArrayList<Department>();
			for(int i=0;i<mlist.size();i++){
				Map<String, Object> m=mlist.get(i);
				department=new Department();
				BigDecimal bd_id=(BigDecimal) m.get("ID");
				int id=bd_id.intValue();
				BigDecimal bd_pxh=(BigDecimal) m.get("BM_PXH");
				int bm_pxh=bd_id.intValue();
				BigDecimal bd_sjjd=(BigDecimal) m.get("BM_SJJD");
				int bm_sjjd=bd_id.intValue();
				department.setId(id);
				department.setBm_name((String)m.get("BM_NAME"));
				department.setBm_dm((String)m.get("BM_DM"));
				department.setBm_pxh(bm_pxh);
				department.setBm_sjjd(bm_sjjd);
				department.setBm_zdbh((String)m.get("BM_ZDBH"));
				department.setBm_bz((String)m.get("BM_BZ"));
				department.setBm_longname((String)m.get("BM_LONGNAME"));
				
				list.add(department);
			}
		}
		return list;
	}

	@Override
	public Department findDeptById(int id) {
		// TODO Auto-generated method stub
		DepartmentDao dao=new DepartmentDaoImpl();
		Department department =null;
		String sql="select * from BI_BMXX where id="+id+"";
		Map<String, Object> m = DbHelper.queryARow(sql);
		if(m!=null){
			department=new Department();
			BigDecimal bd_id=(BigDecimal) m.get("ID");
			int id2=bd_id.intValue();
			BigDecimal bd_pxh=(BigDecimal) m.get("BM_PXH");
			int bm_pxh=bd_id.intValue();
			BigDecimal bd_sjjd=(BigDecimal) m.get("BM_SJJD");
			int bm_sjjd=bd_sjjd.intValue();
			department.setId(id2);
			department.setBm_name((String)m.get("BM_NAME"));
			department.setBm_dm((String)m.get("BM_DM"));
			department.setBm_pxh(bm_pxh);
			department.setBm_sjjd(bm_sjjd);
			department.setBm_zdbh((String)m.get("BM_ZDBH"));
			department.setBm_bz((String)m.get("BM_BZ"));
			department.setBm_longname((String)m.get("BM_LONGNAME"));
			String sjbh=dao.nameByDeptId(bm_sjjd);
			department.setSjbh(sjbh);
		}
		return department;
	}

	@Override
	public List<String> findSjbh() {
		// TODO Auto-generated method stub
		String sql="select distinct BM_NAME from BI_BMXX";
		List<String> list=DbHelper.queryForList(sql);
		return list;
	}

	@Override
	public String nameByDeptId(int id) {
		// TODO Auto-generated method stub
		String sql="select BM_NAME from BI_BMXX where id="+id+"";
		String name=DbHelper.queryForString(sql);
		return name;
	}

	@Override
	public int idByDeptName(String name) {
		// TODO Auto-generated method stub
		Department department =null;
		String sql="select ID from BI_BMXX where BM_NAME='"+name+"'";
		Map<String, Object> m = DbHelper.queryARow(sql);
		int id=-1;
		if(m!=null){			
			BigDecimal bd_id=(BigDecimal) m.get("ID");
			id=bd_id.intValue();			
		}
		return id;
		
	}

	@Override
	public int queryCount() {
		// TODO Auto-generated method stub
		String sql="select count(*) from BI_BMXX";
		int count=DbHelper.queryCountForInt(sql);
		
		
		return count;
	}

}
