package com.lzcb.bigitem.dao;

import java.util.List;
import java.util.Map;


public interface JbxxDao {
	/**
	 * 查询列表
	 * @param sql
	 * @return
	 */
	public List<Map<String, Object>> queryTable(String sql);
	/**
	 * 查询并生成<ul>格式字符串
	 * @param sjjd
	 * @return
	 */
	public String queryuList(String sjjd);
	/**
	 * 查询一行记录
	 * @param id
	 * @return
	 */
	public Map<String,Object> queryARecord(String id);
}
