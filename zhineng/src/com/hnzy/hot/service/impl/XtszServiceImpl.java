package com.hnzy.hot.service.impl;

import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hnzy.hot.dao.XtxzDao;
import com.hnzy.hot.service.XtszService;



@Service
public class XtszServiceImpl implements XtszService{

	@Autowired
	private XtxzDao xtszDao;

	
	private String getUtf8(String str){
		if(str!=null){
			try {
				str=new String(str.getBytes("ISO-8859-1"),"utf-8");
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return str;
	}


	@Override
	public void Insert(Map<String, Object> map) {
		// TODO Auto-generated method stub
		xtszDao.Insert(map);
	}


	@Override
	public void Update(Map<String, Object> map) {
		// TODO Auto-generated method stub
		xtszDao.Update(map);
	}


	@Override
	public List<String> finddate(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return xtszDao.finddate(map);
	}


	@Override
	public List<Map<String, Object>> find(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return xtszDao.find(map);
	}


	@Override
	public List<String> findLd(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return xtszDao.findLd(map);
	}
}
