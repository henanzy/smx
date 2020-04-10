package com.hnzy.hot.controller;

import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hnzy.hot.service.XtszService;
import com.hnzy.hot.service.YhInfoService;

import net.sf.json.JSONObject;

@Controller
@RequestMapping("XtszCon")
public class XtszController {

	@Autowired
	private XtszService xtszService;
	@Autowired
	private YhInfoService yhService;
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
@RequestMapping("Insert")
	
	public String Insert(HttpSession session,String xqm,String ldh,String date1,String date2,String date3,String date4,String date5,
			int h1,int h2,int h3,int h4,int h5,String date6,int h6,String date7,int h7,String date8,int h8) throws ParseException{
	String[] dateList= new String[]{date1,date2,date3,date4,date5,date6,date7,date8};
	int[] hList= new int[]{h1,h2,h3,h4,h5,h6,h7,h8};
	 SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	 SimpleDateFormat sdf1 = new SimpleDateFormat("yyyyMMddhh");
	if(ldh!=null&&"".equals(ldh)==false){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("xqm", xqm);
		map.put("ldh", ldh);
		map.put("flag", 0);
		for (int i = 0; i < dateList.length; i++) {
			 Map<String, Object> dataMap = new HashMap<String, Object>();
			 dataMap.putAll(map);
			 dataMap.put("num",i+1);
			if(dateList[i]!=null&&"".equals(dateList[i])==false){
				 Date date= sdf.parse(dateList[i]);
				 Calendar cal = Calendar.getInstance(); // creates calendar

				    cal.setTime(date); // sets calendar time/date

				    cal.add(Calendar.HOUR_OF_DAY, hList[i]); // adds one hour

				   
				 dataMap.put("date",sdf1.format(cal.getTime()));
				 
			}else{
				dataMap.put("date", null);
			}
			
			
			 
			
			
			 List list=xtszService.finddate(dataMap);
			 if(list.size()==0){
				 xtszService.Insert(dataMap);
			 }else{
				 xtszService.Update(dataMap);
			 }
			
		}
		
	}else{
		Map maps = new HashMap<String, Object>();
		maps.put("xqm", xqm);
		List<String> ldlist=xtszService.findLd(maps);
		for (int a = 0; a < ldlist.size(); a++) {	
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("xqm", xqm);
			map.put("ldh", ldlist.get(a));
			map.put("flag", 0);
			for (int i = 0; i < dateList.length; i++) {
				 Map<String, Object> dataMap = new HashMap<String, Object>();
				 dataMap.putAll(map);
				 dataMap.put("num",i+1);
				if(dateList[i]!=null&&"".equals(dateList[i])==false){
					 Date date= sdf.parse(dateList[i]);
					 Calendar cal = Calendar.getInstance(); // creates calendar

					    cal.setTime(date); // sets calendar time/date

					    cal.add(Calendar.HOUR_OF_DAY, hList[i]); // adds one hour

					   
					 dataMap.put("date",sdf1.format(cal.getTime()));
					 
				}else{
					dataMap.put("date", null);
				}
				
				
				 
				
				
				 List list=xtszService.finddate(dataMap);
				 if(list.size()==0){
					 xtszService.Insert(dataMap);
				 }else{
					 xtszService.Update(dataMap);
				 }
		}
		
	}
	
	}
	 
		return "redirect:sjsd.action";
		
	}
	@RequestMapping("sjsd")
	public String sjsd(){
		return "xtsz/sjsd";
	}
	
	@RequestMapping("find")
	@ResponseBody
	public JSONObject findLd(String xqm,String ldh) throws UnsupportedEncodingException{
		JSONObject json=new JSONObject();
		Map<String, Object> map = new HashMap<String, Object>();
		/*xqm=new String(xqm.getBytes("ISO-8859-1"),"utf-8");*/
		
		map.put("xqm", getUtf8(xqm));
		map.put("ldh", getUtf8(ldh));
		json.put("list", xtszService.find(map));
		return json;
	}
	
}
