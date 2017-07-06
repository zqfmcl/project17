package com.lzcb.bigitem.dao;

import java.util.List;

import com.lzcb.bigitem.Entity.Juese;

public interface JueseDao {
	public void addJuese(Juese juese);//添加角色信息
	public void updateJuese(Juese juese);//修改角色信息
	public void deleteJuese(int id);//删除角色
	public List<Juese> findJueseAll();//查询所有角色
	public Juese findJueseById(int id);//根据id查询角色
	public List<Integer> findPowerById(int id);//根据角色id查询拥有的权限id
	public void updatePower(String[] powerstr,int jsid);
	public List<Integer> findDiquById(int jsid);//根据角色id从角色地区关系表查询角色地区
	public void updateDiqu(String[] jsdqstr,int jsid);//更新角色地区关系表
	public String queryuList(String sjjd);
}
