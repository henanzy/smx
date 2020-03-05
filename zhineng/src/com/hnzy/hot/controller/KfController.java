package com.hnzy.hot.controller;

import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hnzy.hot.service.KfService;
import com.mysql.fabric.xmlrpc.base.Data;

import net.sf.json.JSONObject;

@RequestMapping("kfCon")
@Controller
public class KfController {
	@Autowired
	private KfService kfService;
	
	@RequestMapping("kfList")
	@ResponseBody
	public JSONObject kfList(String xqName,String buildNO,String cellNO,String houseNO) throws UnsupportedEncodingException{
		JSONObject json=new JSONObject();
		if(xqName!=null){
			xqName=new String(xqName.getBytes("ISO-8859-1"),"utf-8")+"";
		}
		Map<String,String>map=new HashMap<String,String>();
		map.put("xqName", xqName);
		map.put("buildNO", buildNO);
		map.put("cellNO", cellNO);
		map.put("houseNO", houseNO);
		List<Map<String,String>> kfList=kfService.findKf(map);
		json.put("kfList",kfList);
		return json;
		
	}
	
	@RequestMapping("deleteKfGd")
	@ResponseBody
	public void deleteKfGd(String id){
		kfService.deleteKfGd(id);
	}
	@RequestMapping("hfjl")
	public String hfjl(){
		
		return "hfjl/hfjl";
	}
	
	@RequestMapping("findhfjl")
	@ResponseBody
	public JSONObject findhfjl(String xqm,String ldh,String dyh,String hh) throws UnsupportedEncodingException{
		if(xqm!=null){
			xqm=new String(xqm.getBytes("ISO-8859-1"),"utf-8");
		}
		
		Map<String,String>map=new HashMap<String,String>();
		map.put("xqName", xqm);
		map.put("buildNO", ldh);
		map.put("cellNO", dyh);
		map.put("houseNO", hh);
		JSONObject json=new JSONObject();
		List<Map<String, String>> findhfjl=kfService.findhfjl(map);
		json.put("list",findhfjl);
		return json;
	}
	
	@RequestMapping("hfjlxx")
	public String hfjlxx(){
		
		Map<String,String>map=new HashMap<String,String>();
	
		JSONObject json=new JSONObject();
		List<Map<String, String>> findhfjl=kfService.findhfjl(map);
		json.put("list",findhfjl);
		return "hfjl/hfjl";
	}
	@RequestMapping("InsertHf")
//	@ResponseBody
	public String InsertHf(String hfr,String XqName,String BuildNO,String CellNO,String HouseNO,
			String hflx,String hfjg,String hfmd ){
		JSONObject json=new JSONObject();
		Map<String,Object>map=new HashMap<String,Object>();
		Date d = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		map.put("hfr", hfr);
		map.put("XqName", XqName);
		map.put("BuildNO", BuildNO);
		map.put("CellNO", CellNO);
		map.put("HouseNO", HouseNO);
		map.put("hflx", hflx);
		map.put("hfjg", hfjg);
		map.put("hfmd", hfmd);
		map.put("hftime",sdf.format(d));
		kfService.insertHf(map);
		return "redirect:hfjl.action";
	}
	@RequestMapping("Updatehfjl")
	public String Updatehfjl(String id,String hfr,String XqName,String BuildNO,String CellNO,String HouseNO,
			String hflx,String hfjg,String hfmd ){
		Map<String,Object>map=new HashMap<String,Object>();
		Date d = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		map.put("id", id);
		map.put("hfr", hfr);
		map.put("XqName", XqName);
		map.put("BuildNO", BuildNO);
		map.put("CellNO", CellNO);
		map.put("HouseNO", HouseNO);
		map.put("hflx", hflx);
		map.put("hfjg", hfjg);
		map.put("hfmd", hfmd);
		map.put("hftime",sdf.format(d));
		kfService.insertHf(map);
		return "redirect:hfjl.action";
	}
	
	@RequestMapping("DeleteKfhf")
	@ResponseBody
	public JSONObject deletgkfhf(int id){
		JSONObject json=new JSONObject();
		kfService.DeleteKfhf(id);
		return json;
	}

}
