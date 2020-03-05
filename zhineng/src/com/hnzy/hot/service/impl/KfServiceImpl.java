package com.hnzy.hot.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.hnzy.hot.dao.KfDao;
import com.hnzy.hot.service.KfService;
@Controller
public class KfServiceImpl implements KfService {
	@Autowired
	private KfDao kfDao;

	@Override
	public List<Map<String, String>> findKf(Map<String, String> map) {
		// TODO Auto-generated method stub
		return kfDao.findKf(map);
	}

	@Override
	public void deleteKfGd(String id) {
		// TODO Auto-generated method stub
		kfDao.deleteKfGd(id);
	}

	@Override
	public List<Map<String, String>> findhfjl(Map<String, String> map) {
		// TODO Auto-generated method stub
		return kfDao.findhfjl(map);
	}

	@Override
	public void insertHf(Map<String, Object> map) {
		// TODO Auto-generated method stub
		kfDao.insertHf(map);
	}

	@Override
	public void DeleteKfhf(int id) {
		// TODO Auto-generated method stub
		kfDao.DeleteKfhf(id);
	}

}
