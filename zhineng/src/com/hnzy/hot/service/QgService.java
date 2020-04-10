package com.hnzy.hot.service;

import java.io.InputStream;
import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

public interface QgService {
	public List<String> find(String xqm);
	
	public void Insert(Map<String, Object> map);
	
	public void Update(Map<String, Object> map);
	
	public void Delete(String id);
	
	public String findJzq(String QgID);
	
	public void importExcelInfo(String  UserName,InputStream in, MultipartFile file,Integer adminId) throws Exception;
}
