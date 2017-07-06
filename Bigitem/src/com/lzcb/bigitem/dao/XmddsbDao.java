package com.lzcb.bigitem.dao;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONArray;

import com.lzcb.bigitem.utils.PageHelper;

public interface XmddsbDao {

	public List<Map<String, Object>> queryTable(String sql,PageHelper p);
	public Map<String,Object> queryARecord(String id);
	public boolean addXmddsb(HttpServletRequest request,String id);
	public boolean addXmddsb1(HttpServletRequest request,String id);
	public boolean updateXmddsb(HttpServletRequest request,String id);
	public JSONArray queryTableToJSON(String sql,PageHelper p);
	
	
	
	
	
	
}
