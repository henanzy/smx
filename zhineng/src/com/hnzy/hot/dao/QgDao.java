package com.hnzy.hot.dao;

import java.util.List;
import java.util.Map;

public interface QgDao {
	
	public List<String> find();
	
	public void Insert(Map<String, Object> map);
	
	public void Update(Map<String, Object> map);
	
	public void Delete(String id);
	
	public String findJzq(String QgID);
	
}
