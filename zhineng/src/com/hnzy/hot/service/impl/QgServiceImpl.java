package com.hnzy.hot.service.impl;

import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.hnzy.hot.dao.QgDao;
import com.hnzy.hot.service.QgService;
import com.hnzy.hot.socket.util.ExcelUtilS;



@Service
public class QgServiceImpl implements QgService{

	@Autowired
	private QgDao qgDao;

	@Override
	public List<String> find(String xqm) {
		// TODO Auto-generated method stub
		return qgDao.find(xqm);
	}

	@Override
	public void Insert(Map<String, Object> map) {
		// TODO Auto-generated method stub
		qgDao.Insert(map);
	}

	@Override
	public void Update(Map<String, Object> map) {
		// TODO Auto-generated method stub
		qgDao.Update(map);
	}

	@Override
	public void Delete(String id) {
		// TODO Auto-generated method stub
		qgDao.Delete(id);
	}

	@Override
	public String findJzq(String QgID) {
		// TODO Auto-generated method stub
		return qgDao.findJzq(QgID);
	}
	@Override
	public void importExcelInfo(String  UserName,InputStream in, MultipartFile file, Integer adminId) throws Exception {
		// TODO Auto-generated method stub

		List<List<Object>> listob = ExcelUtilS.getBankListByExcel(in,file.getOriginalFilename());
	    //遍历listob数据，把数据放到List中
	    for (int i = 0; i < listob.size(); i++) {
	        List<Object> ob = listob.get(i);
	       String qgID=""; String  jzqID ="";   String xqName="";   String vALstID="";   String vALedID="";
	       String installAd="";   String SkqSbh="";   String skqWz="";  
	      
	       
	      
	      
	       if(ob.get(0)==null||"".equals(ob.get(0))){
	    	  
	    	   continue;
	       }
	       if(ob.get(0)!=null&&"".equals(ob.get(0))==false){
	    	   qgID=(String) ob.get(0);
	        }
	       if(ob.get(1)!=null&&"".equals(ob.get(1))==false){
	    	   jzqID=(String) ob.get(1);
	        }
	       if(ob.get(2)!=null&&"".equals(ob.get(2))==false){
	    	   xqName=(String) ob.get(2);
	        }
	       if(ob.get(3)!=null&&"".equals(ob.get(3))==false){
	    	   vALstID=(String) ob.get(3);
	        }
	       if(ob.get(4)!=null&&"".equals(ob.get(4))==false){
	    	   vALedID=(String) ob.get(4);
	        }
	       if(ob.get(5)!=null&&"".equals(ob.get(5))==false){
	    	   installAd=(String) ob.get(5);
	        }
	       if(ob.get(6)!=null&&"".equals(ob.get(6))==false){
	    	   SkqSbh=(String) ob.get(6);
	        }
	       if(ob.get(7)!=null&&"".equals(ob.get(7))==false){
	    	   skqWz=(String) ob.get(7);
	        }
	        Map map = new HashMap();
	    	map.put("jzqID", jzqID);
	    	map.put("xqName",xqName);
	        map.put("qgID",qgID);
	        map.put("vALstID",vALstID);
	    	map.put("vALedID", vALedID);
	    	map.put("installAd",installAd);
	    	map.put("SkqSbh", SkqSbh);
	    	map.put("skqWz", skqWz);
	    	System.out.println(map);
	    	Insert(map);
			
			
	    }
	    

	}
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
}
