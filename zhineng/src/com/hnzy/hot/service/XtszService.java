package com.hnzy.hot.service;

import java.util.List;
import java.util.Map;

public interface XtszService {
    public void Insert(Map<String, Object> map);
	
	public void Update(Map<String, Object> map);
	
	public List<String> finddate(Map<String, Object> map); 
	
	public List<Map<String,Object>> find(Map<String, Object> map);
	
	public List<String> findLd(Map<String, Object> map); 
}
