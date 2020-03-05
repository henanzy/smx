<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
 <meta name="viewport" content="initial-scale=1.0, user-scalable=no"/> 
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="../js/layer/2.4/skin/layer.css" media="screen" />
<script type="text/javascript" src="../js/layer/2.4/layer.js"></script>
<script type="text/javascript" src="../js/layui/layui.js"></script>
<script type="text/javascript" src="../js/layui/layui.all.js"></script>
<link rel="stylesheet" type="text/css" href="../css/reset.css" media="screen" />
<link rel="stylesheet" type="text/css" href="../css/text.css" media="screen" />
<link rel="stylesheet" type="text/css" href="../css/fonts/ptsans/stylesheet.css" media="screen" />
<link rel="stylesheet" type="text/css" href="../css/fluid.css" media="screen" />

<link rel="stylesheet" type="text/css" href="../js/layer/2.4/skin/layer.css" media="screen" />
<script type="text/javascript" src="../js/layer/2.4/layer.js"></script>
<script type="text/javascript" src="../js/layui/layui.js"></script>
<script type="text/javascript" src="../js/layui/layui.all.js"></script>
<link rel="stylesheet" type="text/css" href="../js/layui/css/layui.css" media="screen" />
<link rel="stylesheet" type="text/css" href="../css/mws.style.css" media="screen" />
<link rel="stylesheet" type="text/css" href="../css/icons/icons.css"  />
<link rel="stylesheet" type="text/css" href="../css/admin-all.css"media="screen" /> 

<link rel="stylesheet" type="text/css" href="../css/mws.theme.css" media="screen" />


<script type="text/javascript" src="../js/jquery-1.7.1.min.js"></script>

<script type="text/javascript" src="../plugins/jimgareaselect/jquery.imgareaselect.min.js"></script>
<script type="text/javascript" src="../plugins/jquery.dualListBox-1.3.min.js"></script>
<script type="text/javascript" src="../plugins/jgrowl/jquery.jgrowl.js"></script>
<script type="text/javascript" src="../plugins/jquery.filestyle.js"></script>
<script type="text/javascript" src="../plugins/fullcalendar/fullcalendar.min.js"></script>
<script type="text/javascript" src="../plugins/jquery.dataTables.js"></script>
<script type="text/javascript" src="../plugins/flot/jquery.flot.min.js"></script>
<script type="text/javascript" src="../plugins/flot/jquery.flot.pie.min.js"></script>
<script type="text/javascript" src="../plugins/flot/jquery.flot.stack.min.js"></script>
<script type="text/javascript" src="../plugins/flot/jquery.flot.resize.min.js"></script>
<script type="text/javascript" src="../plugins/colorpicker/colorpicker.js"></script>
<script type="text/javascript" src="../plugins/tipsy/jquery.tipsy.js"></script>
<script type="text/javascript" src="../plugins/sourcerer/Sourcerer-1.2.js"></script>
<script type="text/javascript" src="../plugins/jquery.placeholder.js"></script>
<script type="text/javascript" src="../plugins/jquery.validate.js"></script>
<script type="text/javascript" src="../plugins/jquery.mousewheel.js"></script>
<script type="text/javascript" src="../plugins/spinner/ui.spinner.js"></script>
<script type="text/javascript" src="../js/jquery-ui.js"></script>

<script type="text/javascript" src="../js/mws.js"></script>
<script type="text/javascript" src="../js/demo.js"></script>
<script type="text/javascript" src="../js/themer.js"></script>
<style type="text/css">

html{height:100%}
body{height:100%;margin:0px;padding:0px}
#container{height:100%}
#message{width:20%}
#message{height:100%}


    #xincreate_table_body .mws-table tbody .gradeX .xinjgd_show,
	#xincreate_table_body .mws-table tbody .gradeX .xinjgd_change,
	#xincreate_table_body .mws-table tbody .gradeX .xinjgd_del{
		border:none;
		background-color:rgb(60,61,61);
		height:24px;
		margin-right:6px;
		margin-top:2px;
		color:#fff;
		font-size: 12px;
		border-radius:4px;
	}
	
.table-th-css {
		position: relative !important;
		top: 0;
	}	
.anchorBL{
    display:none;
}	
img { 
    max-width: inherit; 
}
#l-map{height:300px;width:100%;}
		#r-result{width:100%;}
#increase_word
	{
	    
		display:none; 
		position: fixed; 
		left: 0;
	    top:0;
	    right:0;
	    bottom:0;
	    z-index: 100;
		background:none;
		
	}
	
	  .alert-skin .layui-layer-title  {
  
  background-color: #333; 
  color: #C5D52B;
}
body .alert-skin{background: rgba(138,197,0,0.4); }
</style>
  <!--引入地图包，地图包网址的ak属性是你在百度地图开放平台上申请的秘钥-->
<script type="text/javascript" src="http://api.map.baidu.com/api?v=3.0&ak=LVGx0VQjWbumYXVBlLFXQiG90Ak2s94q"></script>
  <!--引入jquery-->
  <script src="http://lib.sinaapp.com/js/jquery/1.9.1/jquery-1.9.1.min.js"></script>
  <script type="text/javascript" src="http://api.map.baidu.com/library/Heatmap/2.0/src/Heatmap_min.js"></script><!-- 热力图JS -->
<title>地址解析</title>

</head>
<body>
<div id="container"></div>
<!-- <div id="r-result">请输入:<input type="text" id="suggestId" size="20"  style="width:150px;" /></div>
<div id="searchResultPanel" style="border:1px solid #C0C0C0;width:150px;height:auto; display:none;"></div> -->


		

<script type="text/javascript">

function G(id) {
	return document.getElementById(id);
}
	var local = layui.data('layui');
	  /* layer.open({
	    type: 1
	    ,title: '供热量信息',
	    skin:"alert-skin"
	    ,shade: false
	    ,offset: 'rt'
	    ,id: 'Notice'
	    ,area: ['250px', '240px']
	    ,moveType: 0
	    ,resize: false
	    ,content:$("#increase_word").html()
	  }); */
	
var map = new BMap.Map("container"); // 创建地图实例

 
map.centerAndZoom(new BMap.Point(112.595538,34.906607), 16); // 初始化地图，设置中心点坐标和地图级别//
map.enableScrollWheelZoom();
/* function showInfo(e){//获取点坐标
	alert(e.point.lng + ", " + e.point.lat);
}
map.addEventListener("click", showInfo); */

var data_info = [[112.595538,34.906607,"名称：一委站<br/>地址：中原路333号吉利区人民政府<br/>"],
	 [112.5898,34.902997,"名称：二委站<br/> 地址：大港路0426号西100米<br/>"],
	 [112.576438,34.90031,"名称：教育局站<br/>地址：泰安路教育体育局<br/>"],
[112.593262,34.900437,"名称：康乐小区站<br/>地址：泰安路教育体育局<br/>"],

[112.614979,34.901178,"名称：瑞隆家园站<br/>地址：河阳路瑞隆家园<br/>"],
[112.606997,34.899866,"名称：河阳心岸站<br/>地址：吉利乡河阳路河阳心安 <br/>"],
[112.57944,34.904349,"名称：紫金花园站<br/>地址：  紫金花园(河阳路南) <br/>"],
[112.571438,34.903576,"名称：实验中学站<br/>地址：吉利区泰安路附近 <br/>"],
[112.57585,34.909773,"名称：北陈小区站<br/>地址：吉利区中原路南100米 <br/>"],
[112.56939,34.905461,"名称：东杨新村站<br/>地址：泰安路教育体育局<br/>"]


	 
	];
  /* var points =[
    {"lng":111.172961,"lat":34.790836,"count":25},
    {"lng":111.172951,"lat":34.790726,"count":27},
    {"lng":111.172804,"lat":34.790681,"count":22},
    
    {"lng":111.184136,"lat":34.787531,"count":23},
    {"lng":111.184190,"lat":34.786456,"count":25},
    {"lng":111.185286,"lat":34.786160,"count":26},
    {"lng":111.185601,"lat":34.788161,"count":27},
    
    
    {"lng":111.178720,"lat":34.797854,"count":28},
    {"lng":111.178437,"lat":34.798984,"count":21},
    {"lng":111.176770,"lat":34.798328,"count":23},
    {"lng":111.177556,"lat":34.799236,"count":24},
    {"lng":111.179317,"lat":34.798551,"count":28},
    
    
    {"lng":111.177758,"lat":34.789409,"count":24},
    {"lng":111.176860,"lat":34.788546,"count":26},
    {"lng":111.178607,"lat":34.788542,"count":23},
    
    
    {"lng":111.196789,"lat":34.793819,"count":21},
    {"lng":111.195406,"lat":34.794894,"count":17},
    {"lng":111.196457,"lat":34.793812,"count":16},
    
    
    {"lng":111.211050,"lat":34.785711,"count":18},
    {"lng":111.211332,"lat":34.785741,"count":19},
    {"lng":111.212446,"lat":34.785856,"count":21},
    
    
    {"lng":111.189450,"lat":34.779711,"count":20},
    {"lng":111.190716,"lat":34.779155,"count":28},
    {"lng":111.192935,"lat":34.779059,"count":27},
    {"lng":111.193232,"lat":34.778347,"count":20},
    
    {"lng":111.186584,"lat":34.779852,"count":21},
    {"lng":111.187509,"lat":34.780482,"count":20},
    
    
    {"lng":111.200571,"lat":34.799158,"count":29},
    {"lng":111.201348,"lat":34.800248,"count":26},
    {"lng":111.201083,"lat":34.798247,"count":25},
    
    {"lng":111.171906,"lat":34.801496,"count":25},
    {"lng":111.173002,"lat":34.801522,"count":25},
    {"lng":111.171987,"lat":34.800963,"count":25}
  
   ]; */
heatmapOverlay = new BMapLib.HeatmapOverlay({"radius":70});
map.addOverlay(heatmapOverlay);
/* heatmapOverlay.setDataSet({data:points,max:30});  */ 
var opts = {
    // 信息窗口宽度
height: 100,     // 信息窗口高度
title : "换热站信息窗口" , // 信息窗口标题
enableMessage:true//设置允许信息窗发送短息
};
var myIcon = new BMap.Icon("../images/navimap/normal.png", new BMap.Size(30,25));
var icon = new BMap.Icon('pin.png', new BMap.Size(20, 32), {
    anchor: new BMap.Size(10, 30)
});
for(var i=0;i<data_info.length;i++){
var marker = new BMap.Marker(new BMap.Point(data_info[i][0],data_info[i][1]));  // 创建标注
var content = data_info[i][2];
map.addOverlay(marker);               // 将标注添加到地图中
addClickHandler(content,marker);
}


	/* $.ajax({
		url :"findJW.action",
		async : false,
		dataType : "json",
		success : function(data) {
			
			    
				var marker = new BMap.Marker(new BMap.Point("111.208757", "34.87615"),{icon:myIcon}); // 创建点正弘高新数码港
				var marker1 = new BMap.Marker(new BMap.Point("111.208347","34.83320"),{icon:myIcon}); // 创建点郑州附中小学
				var marker2 = new BMap.Marker(new BMap.Point("111.206255","34.85315"),{icon:myIcon}); // 创建点汉庭酒店
				

				 var point1 = new BMap.Point(111.208757,34.87615)
				 var point2 = new BMap.Point(111.208347,34.83320)
				 var point3 = new BMap.Point(111.206255,34.85315)
				 var pointList =[];
				 pointList.push(point1);
				 pointList.push(point2);
				 pointList.push(point3);
				 var polyline = new BMap.Polyline(pointList, { strokeColor: "red", strokeWeight: 6, strokeOpacity: 0.5 });

                map.addOverlay(polyline);
                     
		}
		});
 */

	function addClickHandler(content,marker){
		marker.addEventListener("click",function(e){
			openInfo(content,e)}
		);
	}
 	function openInfo(content,e){
		var p = e.target;
		var point = new BMap.Point(p.getPosition().lng, p.getPosition().lat);
		var infoWindow = new BMap.InfoWindow(content,opts);  // 创建信息窗口对象 
		map.openInfoWindow(infoWindow,point); //开启信息窗口
	} 



 /* 	var ac = new BMap.Autocomplete(    //建立一个自动完成的对象
 			{"input" : "suggestId"
 			,"location" : map
 		});

 		ac.addEventListener("onhighlight", function(e) { 
 			//鼠标放在下拉列表上的事件
 		var str = "";
 			var _value = e.fromitem.value;
 			var value = "";
 			if (e.fromitem.index > -1) {
 				value = _value.province +  _value.city +  _value.district +  _value.street +  _value.business;
 			}    
 			str = "FromItem<br />index = " + e.fromitem.index + "<br />value = " + value;
 			
 			value = "";
 			if (e.toitem.index > -1) {
 				_value = e.toitem.value;
 				value = _value.province +  _value.city +  _value.district +  _value.street +  _value.business;
 			}    
 			str += "<br />ToItem<br />index = " + e.toitem.index + "<br />value = " + value;
 			G("searchResultPanel").innerHTML = str;
 		}); */

 		/* var myValue;
 		ac.addEventListener("onconfirm", function(e) {    //鼠标点击下拉列表后的事件
 		var _value = e.item.value;
 			myValue = _value.province +  _value.city +  _value.district +  _value.street +  _value.business;
 			G("searchResultPanel").innerHTML ="onconfirm<br />index = " + e.item.index + "<br />myValue = " + myValue;
 			
 			setPlace();
 		}); */

 		/* function setPlace(){
 			map.clearOverlays();    //清除地图上所有覆盖物
 			function myFun(){
 				var pp = local.getResults().getPoi(0).point;    //获取第一个智能搜索的结果
 				map.centerAndZoom(pp, 18);
 				map.addOverlay(new BMap.Marker(pp));    //添加标注
 			}
 			var local = new BMap.LocalSearch(map, { //智能搜索
 			  onSearchComplete: myFun
 			});
 			local.search(myValue);
 		} */
</script>
</body>

</html>
