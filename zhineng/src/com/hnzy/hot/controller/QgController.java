package com.hnzy.hot.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hnzy.hot.service.JzqService;
import com.hnzy.hot.service.QgService;
import com.hnzy.hot.service.UserService;
import com.hnzy.hot.socket.server.ServerHandler;
import com.hnzy.hot.socket.server.ServerSessionMap;
import com.hnzy.hot.socket.util.CzUtil;
import com.hnzy.hot.socket.util.MapUtils;
import com.hnzy.hot.socket.util.MapUtilsSkq;

import net.sf.json.JSONObject;


@Controller
@RequestMapping("qg")
public class QgController {
	@Autowired
	private QgService qgService;
	@Autowired
	private JzqService jzqService;
	@Autowired
	private UserService userService;
	// 日志文件
	private static Log log = LogFactory.getLog(QgController.class);
	@RequestMapping("/qugxx")
    public String qugxx(HttpSession session){
		String type =(String) session.getAttribute("type");
		if("jtyh".equals(type)){
			return "ZhiNeng/shebei/qugxx_jt";
		}
    	return "ZhiNeng/shebei/qugxx";
    }
	
	@RequestMapping("find")
	@ResponseBody
	public JSONObject findXq(){
		JSONObject json=new JSONObject();
		
		json.put("list", qgService.find());
		return json;
	}
	
	@RequestMapping("Insert")
	
	public String Insert(HttpSession session,String qgID,String jzqID,String xqName,String vALstID,String vALedID,String installAd,String SkqSbh,String skqWz){
		
	Map<String, Object> map =new  HashMap<String, Object>();
	map.put("qgID", qgID);
	map.put("jzqID", jzqID);
	if(xqName!=null){
		map.put("xqName", xqName);
	}
	String	userName=(String) session.getAttribute("UserName");
	if(userName==null||"".equals(userName)){
		 return "redirect:qugxx.action";
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
		 
		 return "redirect:qugxx.action";
	 }
	map.put("vALstID", vALstID);
	map.put("vALedID", vALedID);
	map.put("installAd", installAd);
	map.put("SkqSbh", SkqSbh);
	map.put("skqWz", skqWz);
	qgService.Insert(map);
		return "redirect:qugxx.action";
		
	}
	
@RequestMapping("Update")
	
	public String Update(HttpSession session,String qgID,String jzqID,String xqName,String vALstID,String vALedID,String installAd,String id,String SkqSbh,String skqWz){
		
	Map<String, Object> map =new  HashMap<String, Object>();
	map.put("qgID", qgID);
	map.put("jzqID", jzqID);
	if(xqName!=null){
		map.put("xqName", xqName);
	}
	String	userName=(String) session.getAttribute("UserName");
	if(userName==null||"".equals(userName)){
		 return "redirect:qugxx.action";
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
		 
		 return "redirect:qugxx.action";
	 }
	map.put("vALstID", vALstID);
	map.put("vALedID", vALedID);
	map.put("installAd", installAd);
	map.put("SkqSbh", SkqSbh);
	map.put("skqWz", skqWz);
	map.put("id", id);
	qgService.Update(map);
		return "redirect:qugxx.action";
		
	}


@RequestMapping("QgTS")
@ResponseBody
public String QgTS(HttpSession session, String qgId) {
	// 区管ID
	String ip = jzqService.findIP(qgService.findJzq(qgId)).get(0).get("JzqIP").toString();  
				// 端口号
	String port =jzqService.findIP(qgService.findJzq(qgId)).get(0).get("JzqPort").toString();
				// // IP地址和端口号
	String pString = qgTs(ip, port, qgId);
	return pString;

}
//查询通信状态
public String qgTs(String jzqIp, String port,String ids) {
	String pt = "/" + jzqIp + ":" + port;
	String ja = "F00A0500" + ids;//改为区管地址 F0 0A 05 00 AA AA AA AA XX FF 
	boolean sessionmap = cz(ja, pt);//改为区管地址 F0 0A 05 01 D0 D0 D0 11 XX FF 
	
	log.info("查询区管通信状态发送数据："+ja);
	try {
		Thread.sleep(3000);

	} catch (InterruptedException e) {
		e.printStackTrace();
	}
	if (sessionmap == true && MapUtils.getMapUtils().get("qg")!=null && MapUtils.getMapUtils().get("qg") .equals("success")) {
		 MapUtils.getMapUtils().add("qg", null);
		return "0";
	} else if (sessionmap == true  && MapUtils.getMapUtils().get("qg")!=null && MapUtils.getMapUtils().get("qg") .equals("fail")) {
		 MapUtils.getMapUtils().add("qg", null);
		return "1";
	} else if (sessionmap == false) {
		 MapUtils.getMapUtils().add("qg", null);
		log.info("发送数据失败,集中器不在线");
		return "3";
	} else {
		 MapUtils.getMapUtils().add("qg", null);
		return "2";
	}
}

@RequestMapping("SkqState")
@ResponseBody
public String SkqState(HttpSession session, String qgid,String skqSbh) {
	String ip = jzqService.findIP(qgService.findJzq(qgid)).get(0).get("JzqIP").toString();  
	// 端口号
String port =jzqService.findIP(qgService.findJzq(qgid)).get(0).get("JzqPort").toString();
if(skqSbh!=""){
	// // IP地址和端口号
	String pt = "/" + ip + ":" + port;
	int Sbh=Integer.valueOf(skqSbh);
	// 十进制转换为十六进制
	 skqSbh = Integer.toHexString(Sbh);
			// fmId十进制
			String ja = "F00F3A000" + skqSbh + "0000000000";
			log.info("刷卡器发送数据："+ja);
			boolean sessionmap = cz(ja, pt);
			try {
				Thread.sleep(3000);

			} catch (InterruptedException e) {
				e.printStackTrace();
			}
			if (sessionmap == true && MapUtilsSkq.getMapUtils().get("Dskq")!=null && MapUtilsSkq.getMapUtils().get("Dskq").equals("success")) {
				MapUtilsSkq.getMapUtils().add("Dskq", null);
				return "0";
			} else if (sessionmap == true && MapUtilsSkq.getMapUtils().get("Dskq")!=null && MapUtilsSkq.getMapUtils().get("Dskq").equals("cs") 
					|| sessionmap == true && MapUtilsSkq.getMapUtils().get("Dskq") == null) {
				MapUtilsSkq.getMapUtils().add("Dskq", null);
				return "1";
			} else if (sessionmap == false && MapUtilsSkq.getMapUtils().get("Dskq") == null) {
				log.info("发送数据失败,集中器不在线");
				MapUtilsSkq.getMapUtils().add("Dskq", null);
				return "3";
			}else {
				MapUtilsSkq.getMapUtils().add("Dskq", null);
				return "2";
			}
	}
		return "2";

}

@RequestMapping("jzqState")
@ResponseBody
public String jzqState(HttpSession session, String qgid,String jzqId) {
	String ip = jzqService.findIP(qgService.findJzq(qgid)).get(0).get("JzqIP").toString();  
	// 端口号
String port =jzqService.findIP(qgService.findJzq(qgid)).get(0).get("JzqPort").toString();
String pt = "/" + ip + ":" + port;
String ja = "F00A0100" + jzqId ;
boolean sessionmap = cz(ja, pt);
log.info("查询集中器状态发送数据："+ja);
try {
	Thread.sleep(3000);

} catch (InterruptedException e) {
	e.printStackTrace();
}
if(sessionmap==true && MapUtils.getMapUtils().get("jzq")!=null && MapUtils.getMapUtils().get("jzq").equals("success")){
	 MapUtils.getMapUtils().add("jzq", null);
	return "0";
}else if(sessionmap==true && MapUtils.getMapUtils().get("jzq")!=null && MapUtils.getMapUtils().get("jzq").equals("fail")){
	 MapUtils.getMapUtils().add("jzq", null);
	return "1";
}else if(sessionmap==false){
	 MapUtils.getMapUtils().add("jzq", null);
	log.info("发送数据失败,集中器不在线");
	return "3";
}else {
	 MapUtils.getMapUtils().add("jzq", null);
	return "2";
}	

}
String UppWdsd;
String UppTjzq;
String UppTjcs;
@RequestMapping("FsCs")
@ResponseBody
public String Fscs(HttpSession session, String qgId, String  wdsd, String  tjzq, String tjcs,String sdbs) {

	if(session.getAttribute("UserName")!=null && session.getAttribute("UserName").equals("供热管理处")){
		return "5";
	}else {
		String ip = jzqService.findIP(qgService.findJzq(qgId)).get(0).get("JzqIP").toString();
		String port = jzqService.findIP(qgService.findJzq(qgId)).get(0).get("JzqPort").toString();
	// 参数十进制转换为十六进制
	if(wdsd!=""&& tjzq!=""&&tjcs!=""){
		// 参数十进制转换为十六进制
		int WDsd=Integer.valueOf(wdsd);
		int TJzq=Integer.valueOf(tjzq);
		int TJcs=Integer.valueOf(tjcs);
		String Wdsd = "00" + Integer.toHexString(WDsd);
		String subwdsd = Wdsd.substring(Wdsd.length() - 2);
		String Tjzq = "00" + Integer.toHexString(TJzq);
		String subtjzq = Tjzq.substring(Tjzq.length() - 2);
		String Tjcs = "00" + Integer.toHexString(TJcs);
		String subtjcs = Tjcs.substring(Tjcs.length() - 2);
		 UppWdsd = CzUtil.Uppercase(subwdsd).toString();
		 UppTjzq = CzUtil.Uppercase(subtjzq).toString();
		 UppTjcs = CzUtil.Uppercase(subtjcs).toString();
	}else{
		UppWdsd="FF";
		UppTjzq="FF";
		UppTjcs="FF";
	}
				if(sdbs.equals("02")){
					sdbs="FF";
				}
			 //IP地址和端口号
			String pt = "/" + ip + ":" + port;
			String ja = "F0160900" + qgId + "04AAAAAAAAFFFF"+sdbs+"FF"+UppWdsd + "" + UppTjzq + "" + UppTjcs;
			log.info("区管设置参数："+ja);
			boolean	sessionmap = cz(ja, pt);
			try {
				Thread.sleep(3000);

			} catch (InterruptedException e) {
				e.printStackTrace();
			}
			if(sessionmap==true){
				return "0";
			}else{
				return "1";
			}
	}
}

public boolean cz(String ja, String pt) {

	// 把十六进制数，转换为十进制相加
	int jia = CzUtil.FsZh(ja);
	// 十进制转换为十六进制
	String hex = Integer.toHexString(jia);
	// 截取相加结果后两位
	String je = null;
	for (int j = 0; j < hex.length() - 1; j++) {
		je = hex.charAt(hex.length() - 2) + "" + hex.charAt(hex.length() - 1);
	}
	String[] keys = new String[] { pt };
	String mString = ja + je + "FF";
	// 解码
	byte[] b = CzUtil.jm(mString);
	ServerSessionMap sessionMap = ServerSessionMap.getInstance();
	boolean sessionmap = sessionMap.sendMessage(keys, b);
	return sessionmap;

}

@RequestMapping("Delete")
@ResponseBody
public JSONObject Delete(String id){
	JSONObject json=new JSONObject();
	
	qgService.Delete(id);
	return json;
}
}