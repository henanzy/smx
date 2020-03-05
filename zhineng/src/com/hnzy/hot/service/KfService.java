package com.hnzy.hot.service;

import java.util.List;
import java.util.Map;

public interface KfService {
	public List<Map<String,String>>findKf(Map<String,String>map);
	public void deleteKfGd(String id);
	public List<Map<String,String>>findhfjl(Map<String,String>map);
	public void insertHf(Map<String,Object>map);
	public void DeleteKfhf(int id);
}
