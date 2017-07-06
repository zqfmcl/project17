package com.lzcb.bigitem.dao;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONArray;

import com.lzcb.bigitem.utils.PageHelper;

public interface NryDao {
	public List<Map<String, Object>> queryTable(String sql,PageHelper p);
	public Map<String,Object> queryARecord(String id);
	public boolean addNry(HttpServletRequest request,String id);
	public boolean updateNry(HttpServletRequest request,String id);
	public JSONArray queryTableToJSON(String sql,PageHelper p);
}
