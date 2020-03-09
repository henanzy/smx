package com.hnzy.hot.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface JzqDao {
	
	public List<String> find(@Param(value="xqm") String xqm);
	
	public void Insert(Map<String, Object> map);
	
	public void Update(Map<String, Object> map);
	
	public void Delete(String id);
	
	public List<Map<String, Object>> findIP(String JzqID);
	
}
