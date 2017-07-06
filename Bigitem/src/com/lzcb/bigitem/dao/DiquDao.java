package com.lzcb.bigitem.dao;

import java.util.List;

import com.lzcb.bigitem.Entity.Diqu;

public interface DiquDao {
	public List<Diqu> findAllDiqu();
	public List<Integer> findXjjd(int id);//递归查询下级地区
}
