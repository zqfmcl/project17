package com.lzcb.bigitem.dao;

import java.util.List;

import com.lzcb.bigitem.Entity.Yonghu;
import com.lzcb.bigitem.Entity.YonghuCondition;

public interface YonghuDao {
	public void addYonghu(Yonghu yonghu);
	public void upadteYonghu(Yonghu yonghu);
	public void deleteYonghu(int id);
	public Yonghu findById(int id);
	public String findYhjs(int id);//获取用户角色并拼接
	public List<Integer> findYhjsId(int yhid);//通过用户id获取用户所有角色的id
	//public String findDeptDmById(int deptid);//获取部门代码
	public List<Yonghu> findAllYonghu();
	public List<Yonghu> findBySql(YonghuCondition yhc,int currentPage,int pageSize);//搜索功能
	public int queryCount(YonghuCondition yhc);//按条件搜索查询到的总记录数
	public String getPower(String id);
	public List<Integer> findDqidById(int userid);//根据用户id查询所属角色的地区权限
}
