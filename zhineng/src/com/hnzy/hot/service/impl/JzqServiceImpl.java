package com.hnzy.hot.service.impl;

import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.hnzy.hot.dao.JzqDao;
import com.hnzy.hot.service.JzqService;
import com.hnzy.hot.socket.util.ExcelUtilS;


@Service
public class JzqServiceImpl implements JzqService{

	@Autowired
	private JzqDao jzqDao;

	@Override
	public List<String> find(@Param(value="xqm") String xqm) {
		// TODO Auto-generated method stub
		return jzqDao.find(xqm);
	}

	@Override
	public void Insert(Map<String, Object> map) {
		// TODO Auto-generated method stub
		jzqDao.Insert(map);
	}

	@Override
	public void Update(Map<String, Object> map) {
		// TODO Auto-generated method stub
		jzqDao.Update(map);
	}

	@Override
	public void Delete(String id) {
		// TODO Auto-generated method stub
		jzqDao.Delete(id);
	}

	@Override
	public List<Map<String, Object>> findIP(String JzqID) {
		// TODO Auto-generated method stub
		return jzqDao.findIP(JzqID);
	}

	@Override
	public void importExcelInfo(String  UserName,InputStream in, MultipartFile file, Integer adminId) throws Exception {
		// TODO Auto-generated method stub

		List<List<Object>> listob = ExcelUtilS.getBankListByExcel(in,file.getOriginalFilename());
	    //遍历listob数据，把数据放到List中
	    for (int i = 0; i < listob.size(); i++) {
	        List<Object> ob = listob.get(i);
	       String JzqID=""; String  JzqIp ="";   String XqName="";   String JzqPort="";   String HESName="";
	       String InstallAd=""; 
	      
	       
	      
	      
	       if(ob.get(0)==null||"".equals(ob.get(0))){
	    	  
	    	   continue;
	       }
	       if(ob.get(0)!=null&&"".equals(ob.get(0))==false){
	    	   JzqID=(String) ob.get(0);
	        }
	       if(ob.get(1)!=null&&"".equals(ob.get(1))==false){
	    	   JzqIp=(String) ob.get(1);
	        }
	       if(ob.get(2)!=null&&"".equals(ob.get(2))==false){
	    	   XqName=(String) ob.get(2);
	        }
	       if(ob.get(3)!=null&&"".equals(ob.get(3))==false){
	    	   JzqPort=(String) ob.get(3);
	        }
	       if(ob.get(4)!=null&&"".equals(ob.get(4))==false){
	    	   HESName=(String) ob.get(4);
	        }
	       if(ob.get(5)!=null&&"".equals(ob.get(5))==false){
	    	   InstallAd=(String) ob.get(5);
	        }
	     
	        Map map = new HashMap();
	        map.put("JzqID", JzqID);
	    	map.put("JzqIp", JzqIp);
	    	map.put("XqName", XqName);
	    	map.put("JzqPort", JzqPort);
	    	map.put("HESName", HESName);
	    	map.put("InstallAd", InstallAd);
	    	Insert(map);
			
			
	    }
	    

	}
}
