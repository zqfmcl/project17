package com.lzcb.bigitem.dao;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONArray;

import com.lzcb.bigitem.utils.PageHelper;

public interface XmsbDao {
	/**
	 * 查询表格
	 * @param sql
	 * @param p
	 * @return
	 */
	public List<Map<String, Object>> queryTable(String sql,PageHelper p);
	/**
	 * 查询一行数据
	 * @param id
	 * @return
	 */
	public Map<String,Object> queryARecord(String id);
	/**
	 * 增加项目信息
	 * @param request
	 * @return
	 */
	public boolean addXmxx(HttpServletRequest request);
	/**
	 * 更改项目信息
	 * @param request
	 * @param id
	 * @return
	 */
	public boolean updateXmxx(HttpServletRequest request,String id);
	/**
	 * 查询获取json格式数据
	 * @param sql
	 * @param p
	 * @return
	 */
	public JSONArray queryTableToJSON(String sql,PageHelper p);
}
