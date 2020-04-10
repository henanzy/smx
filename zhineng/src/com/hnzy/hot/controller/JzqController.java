package com.hnzy.hot.controller;

import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.hnzy.hot.service.JzqService;
import com.hnzy.hot.service.QgService;
import com.hnzy.hot.service.UserService;

import net.sf.json.JSONObject;


@Controller
@RequestMapping("jzq")
public class JzqController {
	@Autowired
	private JzqService jzqService;
	@Autowired
	private QgService qgService;
	@Autowired
	private UserService userService;
	@RequestMapping("/jizqxx")
    public String jizqxx(HttpSession session){
		String type =(String) session.getAttribute("type");
		if("jtyh".equals(type)){
			return "ZhiNeng/shebei/jizqxx_jt";
		}
    	return "ZhiNeng/shebei/jizqxx";
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
	@RequestMapping("find")
	@ResponseBody
	public JSONObject findXq(String xqm){
		JSONObject json=new JSONObject();
		
		json.put("list", jzqService.find(getUtf8(xqm)));
		return json;
	}
	
	@RequestMapping("Insert")
	
	public String Insert(HttpSession session,String JzqID,String JzqIp,String JzqPort,String XqName,String HESName,String InstallAd){
		
	Map<String, Object> map =new  HashMap<String, Object>();
	String	userName=(String) session.getAttribute("UserName");
	if(userName==null||"".equals(userName)){
		 return "redirect:jizqxx.action";
	}
	String roleId=userService.getRoleByName(userName);
	 List<Integer> list=userService.getRole_Per(roleId);
	 String per_id=userService.getRoleIdByName("设备信息修改")+"";
	 int flag=0;
	 for (int i = 0; i < list.size(); i++) {
		if(per_id.equals(list.get(i)+"")){
			flag=1;
		}
	}
	 if(flag==0){
		 
		 return "redirect:jizqxx.action";
	 }
	map.put("JzqID", JzqID);
	map.put("JzqIp", JzqIp);
	if(XqName!=null){
		map.put("XqName", XqName);
	}
	map.put("JzqPort", JzqPort);
	map.put("HESName", HESName);
	map.put("InstallAd", InstallAd);
	
	jzqService.Insert(map);
		return "redirect:jizqxx.action";
		
	}
	
@RequestMapping("Update")
	
	public String Update(HttpSession session,String JzqID,String JzqIp,String JzqPort,String XqName,String HESName,String InstallAd,String id){
	String	userName=(String) session.getAttribute("UserName");
	if(userName==null||"".equals(userName)){
		 return "redirect:jizqxx.action";
	}
	String roleId=userService.getRoleByName(userName);
	 List<Integer> list=userService.getRole_Per(roleId);
	 String per_id=userService.getRoleIdByName("设备信息修改")+"";
	 int flag=0;
	 for (int i = 0; i < list.size(); i++) {
		if(per_id.equals(list.get(i)+"")){
			flag=1;
		}
	}
	 if(flag==0){
		 
		 return "redirect:jizqxx.action";
	 }
	Map<String, Object> map =new  HashMap<String, Object>();
	map.put("JzqID", JzqID);
	map.put("JzqIp", JzqIp);
	if(XqName!=null){
		map.put("XqName", XqName);
	}
	
	map.put("JzqPort", JzqPort);
	map.put("HESName", HESName);
	map.put("InstallAd", InstallAd);
	map.put("id", id);
	jzqService.Update(map);
		return "redirect:jizqxx.action";
		
	}

@RequestMapping("Delete")
@ResponseBody
public JSONObject Delete(HttpSession session,String id){
	JSONObject json=new JSONObject();
	
	jzqService.Delete(id);
	return json;
}
@RequestMapping("/qgdr")
public String qgdr(HttpSession session){
	
	return "ZhiNeng/shebei/qgdr";
}
@RequestMapping("read")
public String impotr(HttpServletRequest request,HttpSession session, Model model) throws Exception {
int adminId = 1;
//获取上传的文件
MultipartHttpServletRequest multipart = (MultipartHttpServletRequest) request;
MultipartFile file = multipart.getFile("Importfile");

if(file.getSize()>0){
//数据导入
	 
	 String UserName=(String) session.getAttribute("UserName");
	 if(UserName!=null){
		 InputStream in = file.getInputStream();
		 qgService.importExcelInfo(UserName,in,file,adminId);
		 in.close();
	 }else{
		 return "faile";
	 }
	
	return "Excelsuccess";
}else{
	 return "faile";
}
}

@RequestMapping("/jzqdr")
public String jzqdr(HttpSession session){
	
	return "ZhiNeng/shebei/jzqdr";
}

@RequestMapping("readjzq")
public String readjzq(HttpServletRequest request,HttpSession session, Model model) throws Exception {
int adminId = 1;
//获取上传的文件
MultipartHttpServletRequest multipart = (MultipartHttpServletRequest) request;
MultipartFile file = multipart.getFile("Importfile");

if(file.getSize()>0){
//数据导入
	 
	 String UserName=(String) session.getAttribute("UserName");
	 if(UserName!=null){
		 InputStream in = file.getInputStream();
		 jzqService.importExcelInfo(UserName,in,file,adminId);
		 in.close();
	 }else{
		 return "faile";
	 }
	
	return "Excelsuccess";
}else{
	 return "faile";
}
}
}