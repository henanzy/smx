<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>

<!-- Required Stylesheets -->
<link rel="stylesheet" type="text/css" href="../css/reset.css" media="screen" />
<link rel="stylesheet" type="text/css" href="../css/text.css" media="screen" />
<link rel="stylesheet" type="text/css" href="../css/fonts/ptsans/stylesheet.css" media="screen" />
<link rel="stylesheet" type="text/css" href="../css/fluid.css" media="screen" />

<link rel="stylesheet" type="text/css" href="../css/mws.style.css" media="screen" />
<link rel="stylesheet" type="text/css" href="../css/icons/icons.css" media="screen" />

<!-- Demo and Plugin Stylesheets -->
<link rel="stylesheet" type="text/css" href="../css/demo.css" media="screen" />

<link rel="stylesheet" type="text/css" href="../plugins/colorpicker/colorpicker.css" media="screen" />
<link rel="stylesheet" type="text/css" href="../plugins/jimgareaselect/css/imgareaselect-default.css" media="screen" />
<link rel="stylesheet" type="text/css" href="../plugins/fullcalendar/fullcalendar.css" media="screen" />
<link rel="stylesheet" type="text/css" href="../plugins/fullcalendar/fullcalendar.print.css" media="print" />
<link rel="stylesheet" type="text/css" href="../plugins/tipsy/tipsy.css" media="screen" />
<link rel="stylesheet" type="text/css" href="../plugins/sourcerer/Sourcerer-1.2.css" media="screen" />
<link rel="stylesheet" type="text/css" href="../plugins/jgrowl/jquery.jgrowl.css" media="screen" />
<link rel="stylesheet" type="text/css" href="../plugins/spinner/spinner.css" media="screen" />
<link rel="stylesheet" type="text/css" href="../css/jui/jquery.ui.css" media="screen" />
<link rel="stylesheet" type="text/css" href="../plugins/elrte/css/elrte.full.css" media="screen" />
<link rel="stylesheet" type="text/css" href="../plugins/elfinder/css/elfinder.css" media="screen" />

<!-- Theme Stylesheet -->
<link rel="stylesheet" type="text/css" href="../css/mws.theme.css" media="screen" />

<!-- JavaScript Plugins -->

<script type="text/javascript" src="../js/jquery-1.7.1.min.js"></script>

<script type="text/javascript" src="../plugins/jimgareaselect/jquery.imgareaselect.min.js"></script>
<script type="text/javascript" src="../plugins/jquery.dualListBox-1.3.min.js"></script>
<script type="text/javascript" src="../plugins/jgrowl/jquery.jgrowl.js"></script>
<script type="text/javascript" src="../plugins/jquery.filestyle.js"></script>
<script type="text/javascript" src="../plugins/fullcalendar/fullcalendar.min.js"></script>
<script type="text/javascript" src="../plugins/jquery.dataTables.js"></script>
<!--[if lt IE 9]>
<script type="text/javascript" src="../plugins/flot/excanvas.min.js"></script>
<![endif]-->
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

<script type="text/javascript" src="../js/layer/2.4/layer.js"></script>
<script type="text/javascript" src="../js/layui/layui.js"></script>
<script type="text/javascript" src="../js/layui/layui.all.js"></script>
<link rel="stylesheet" type="text/css" href="../js/layui/css/layui.css" media="screen" />
<script type="text/javascript" src="../plugins/elrte/js/elrte.min.js"></script>
<script type="text/javascript" src="../plugins/elfinder/js/elfinder.min.js"></script>

<script type="text/javascript" src="../js/mws.js"></script>
<script type="text/javascript" src="../js/demo.js"></script>
<script type="text/javascript" src="../js/themer.js"></script>
<link rel="stylesheet" type="text/css" href="../css/qiytl.css" media="screen" />
<script type="text/javascript" src="../js/demo.formelements.js"></script>


<style type="text/css">
* {
	margin: 0;
	padding: 0;
}
		th,td{  
  
  white-space: nowrap;
} 
	/*修改按钮 */
	#xincreate_table_body .mws-table tbody .gradeX .xinjgd_show,
	#xincreate_table_body .mws-table tbody .gradeX .xinjgd_change,
	#xincreate_table_body .mws-table tbody .gradeX .xinjgd_del{
		border:none;
		background-color:rgb(60,61,61);
		height:24px;
		width:40px;
		margin-right:16px;
		margin-top:2px;
		color:#fff;
		font-size: 12px;
		border-radius:4px;
	}
#increase_word,
	#change_word{
		display:none;
		position: fixed;
		left: 0;
	    top:0;
	    right:0;
	    bottom:0;
	    z-index: 100; 
		background-color:rgba(0,0,0,0.6);
	}
	
	/* 新增修改弹出框关闭按钮 */
	#increase_word .close,
	#change_word .close{
		display:block;
		background-color:rgb(193,213,43);
		width:24px;
		height:24px;
		color: #fff;
    	border-radius: 13px;
		position:absolute;
		top:14px;
		right:20px;
		line-height: 24px;
   		text-align: center;
   		font-size: 18px;
	}
	#hh{
		width:60px;
		height:24px;
		line-height:24px;
		border-radius:4px;
		background-color:rgba(43,45,49,0.8);
		color:#fff;
		cursor:pointer;
		text-align:center;
		padding:0 4px;
	}
	#increase_word .close::before,
	#change_word .close::before {
	    content: "\2716";
	}
	
	/* 新增修改弹出框input */
	#increase_word .mws-form-row .increase_word_input,
	#change_word .mws-form-row .change_word_input {
		width:200px;
	}
	
	/* 新增修改弹出框label */
	#increase_word .mws-form-row label,
	#change_word .mws-form-row label{
		width:150px;
	}
	
	/* 新增修改弹出框确认按钮 */
	#increase_word #word_increase_btn,
	#change_word #word_change_btn{
		position:relative;
		top:10px;
		left:47%;
	}
	
.table-th-css {
	position: relative !important;
	top: 0;
}

.mws-report {
	width: 98% !important;
	min-width: 170px;
	margin: 8px 1%;
	height: 90px;
	float: left;
	cursor: pointer;
	display: block;
	text-decoration: none;
	color: #323232;
	-webkit-box-sizing: border-box; /* Safari/Chrome, other WebKit */
	-moz-box-sizing: border-box; /* Firefox, other Gecko */
	box-sizing: border-box; /* Opera/IE 8+ */
	background: #ffffff;
	border: 1px solid #cccccc;
	/* CSS 3 */
	-webkit-border-radius: 6px;
	-o-border-radius: 6px;
	-moz-border-radius: 6px;
	-khtml-border-radius: 6px;
	border-radius: 6px;
}


/* 新增修改弹出框 */
	#increase_word,
	#change_word{
		display:none;
		position: fixed;
		left: 0;
	    top:0;
	    right:0;
	    bottom:0;
	    z-index: 100; 
		background-color:rgba(0,0,0,0.6);
	}
		/*修改按钮 */
	 .xinjgd_change,
	 .xinjgd_del{
		border:none;
		background-color:rgb(60,61,61);
		height:24px;
		width:60px;
		margin-right:16px;
		margin-top:2px;
		color:#fff;
		font-size: 12px;
		border-radius:4px;
	}
	/* 新增修改弹出框关闭按钮 */
	#increase_word .close,
	#change_word .close{
		display:block;
		background-color:rgb(193,213,43);
		width:24px;
		height:24px;
		color: #fff;
    	border-radius: 13px;
		position:absolute;
		top:14px;
		right:20px;
		line-height: 24px;
   		text-align: center;
   		font-size: 18px;
	}
	#increase_word .close::before,
	#change_word .close::before {
	    content: "\2716";
	}
	
	/* 新增修改弹出框input */
	#increase_word .mws-form-row .increase_word_input,
	#change_word .mws-form-row .change_word_input {
		width:300px;
	}
	
	/* 新增修改弹出框label */
	#increase_word .mws-form-row label,
	#change_word .mws-form-row label{
		width:115px;
	}
	
	/* 新增修改弹出框确认按钮 */
	#increase_word #word_increase_btn,
	#change_word #word_change_btn{
		position:relative;
		top:0px;
		left:47%;
	}
	

nav li,
	select{
		height:24px;
		line-height:24px;
		border-radius:4px;
		background-color:rgba(43,45,49,0.8);
		color:#fff;
		cursor:pointer;
		text-align:center;
		padding:0 4px;
		list-style-type:none;
	}

.imageClass{
width: 100%;
  height: 0;
  padding-top: 100%;
  overflow: hidden;
  background-position: center center;
  background-repeat: no-repeat;
  background-size: cover;
  -webkit-background-size: cover;
  -moz-background-size: cover;}
</style>

<script>

    $(document).ready(function(){
		var qgxxtableCont = $('#qgxx_table_body table tr th'); //获取th
		var qgxxtableScroll = $('#qgxx_table_body'); //获取滚动条同级
		qgxxtableScroll.on('scroll', scrollHandleqgxx);
		
		function scrollHandleqgxx() {
			var scrollTop = qgxxtableScroll.scrollTop();
			// 当滚动距离大于0时设置top及相应的样式
			if (scrollTop > 0) {
				qgxxtableCont.css({
					"top" : scrollTop + 'px',
					"marginTop" : "-1px",
					"backgroundColor" : "#EBEBEB"
				})
			} else { // 当滚动距离小于0时设置top及相应的样式 
				qgxxtableCont.css({
					"top" : scrollTop + 'px',
					"marginTop" : "0",
					"backgroundColor" : "#EBEBEB"
				})
			}
		}
		

	    
    }); 
</script>
<script type="text/javascript">
var list;
$.ajax({
		url : "<%=basePath%>kfCon/kfList.action", 
		async : false,
		dataType : "json",
		data : {
		
		},
		success : function(data) {
			
			list=data.kfList;	   
		}

	});

</script>
<script type="text/javascript">
function amplificationImg(url) {
     $("#imageClass").attr("src", url);
    var height = "100px";//拿的图片原来宽高，建议自定义宽高
    var width = "100px";
    layer.open({
        type: 0,
        title: false,
        closeBtn: 0,
        shadeClose: true,
        offset: '120px',
        area: [width + 'px', height + 'px'], //宽高
        content: "<img style='width:700px;height:550px;'  src=" + url + " />"
    }); 
}
</script>
<body>
    <div id="" class="clearfix">
      
            	<div class="mws-report-container clearfix">
            
            	
                   	 <p class="mws-report" href="#" style="font-size: 14px;padding:10px;min-width:1100px;height:80px">
                   	 <span>选择公司：
					<select id="ssgs" style="width:150px"
						name="ssgs">
						
					</select>
				</span>
				 
                    <span>选择小区：
						<select id="xq" style="width:150px"
						name="xqName">
						
					</select>
					</span>
					<span>楼栋号：
						<select name="ldh" id="ldh" style="width:70px">
							<option value="" >楼栋</option>
					</select>
					</span>
					<span>单元号：
						<select name="dyh" id="dyh" style="width:70px">
							<option value="" >单元</option>
					</select>
					</span>
					
					户号<input type="text" name="hh" id="hh" size=6px
						value="" /> &nbsp;&nbsp;&nbsp; 
					
					 <input type="submit" id="search_btn" class="mws-button black"  value="搜索"/>&nbsp;&nbsp;&nbsp;
                       
                   </p> 
                </div>
                

     	  	<div class="mws-panel grid_8" >
                	<div class="mws-panel-header">
                    	<span class="mws-i-24 i-table-1">数据显示</span>
                    </div>

                    <div id="qgxx_table_body" class="mws-panel-body" style="width:99.5%; height:580px; overflow:auto;">

                        <table class="mws-table" >
                            <thead >
                                <tr>
                                   
                                    <th class="table-th-css">小区名称</th>
                                    <th class="table-th-css">楼栋</th>
                                    <th class="table-th-css">单元</th>
                                    <th class="table-th-css">户号</th>
                                    <th class="table-th-css">传感器地址</th>
                                    <th class="table-th-css">安装人</th>
                                    <th class="table-th-css">安置位置</th>
                                    <th class="table-th-css">安装时间</th>
                                    <th class="table-th-css">操作</th>
                                </tr>
                            </thead>
                            <tbody id="qgxx_body">
                               
                            </tbody>
                        </table>
                    </div>
                </div>
                
         
                  
		<nav style="width:100%;">
            <ul style="width:550px;display:flex;justify-content:space-between;margin:0 auto;" >
            	
                <li id="first">首页</li>
                <li id="last">上一页</li>
                <li id="next">下一页</li>
                <li id="end">尾页</li>   
                <li id="curpage">当前第<span id="currentNum" ></span>页 /共<span id='pages'></span>页</li>
                <li>共<span id="num"></span></li>
                
                    <select name="" id="select" >
                        <option value="10">10</option>
                        <option value="15"  selected = "selected">15</option>
                        <option value="20" >20</option>
                        <option value="25">25</option>
                        <option value="30">30</option>
                         <option value="500">500</option>
                    </select>
                     
            </ul>
         </nav>
     
     
     	<div class="wz_modify" style="min-width:1000px;overflow-x: hidden;">
			<div class="wz_modify_body">
				<span class="close"></span>
				<h5>文章修改</h5>

				<form action="updateZsk.action" method="POST">
					<p><label><span>文章标题：</span><input class="wz_modify_input" type="text" required="required" autofocus="autofocus" name="title" value="" /></label></p>
					<p><label><span>文章内容：</span><textarea class="wz_modify_input" name="contents" required="required"></textarea></label></p>
					<p><label><span>作者：</span><input class="wz_modify_input" required="required" type="text" name="author" value="" /></label></p>
					<p><label><span>发布时间：</span><input class="wz_modify_input" required="required" readonly="readonly" type="text" name="tm" value="" /></label></p>
					<input type="hidden" name="zsktype" value="企业条例"/>
					<input class="wz_modify_input"  readonly="readonly" type="hidden" name="Id" value="" />
					<p class="wz_mod_p"><input id="wz_mod_btn" type="submit" value="确定修改" /></p>

				</form>
			</div>
		</div>
     
     
        <div id="increase_word">
			<div class="mws-panel grid_4"
				style="width: 400px; min-width: 500px; margin: 20px 30%;">
				<div class="mws-panel-header">
					<span class="mws-i-24 i-pencil">新增用户</span> <span class="close"></span>
				</div>
				<div class="mws-panel-body" style="height: 550px;">
					<form class="mws-form" id="insert" action="InsertYh.action" method="post">
						<div class="mws-form-inline">
						
						<div class="mws-form-row">
								<label>&emsp;用户姓名：</label>

								<div class="mws-form-item large">
								 <input type="text" class="mws-textinput increase_word_input" 
										name="YhName" value="" autofocus="autofocus" />
								</div>
						</div>
						<div class="mws-form-row">
								<label>&emsp;小区名称：</label>

								<div class="mws-form-item large">
								<select style="height:40px;width:250px" id="xq1" name="XqName">
							      <option value="" >--选择小区--</option>
					            </select>
								</div>
						</div>
						<div class="mws-form-row">
								<label>&emsp;楼栋号：</label>

								<div class="mws-form-item large">
									<select style="height:40px;width:250px" name="BuildNO" id="ldh1" >
							           <option value="" >--选择楼栋--</option>
					                 </select>
								</div>
						</div>
						<div class="mws-form-row">
								<label>&emsp;单元号：</label>

								<div class="mws-form-item large">
									<select style="height:40px;width:250px" name="CellNO" id="dyh1">
							<option value="" >--选择单元--</option>
					                 </select>
								</div>
						</div>
						
						<div class="mws-form-row">
								<label>&emsp;户号：</label>

								<div class="mws-form-item large">
									<input type="text" class="mws-textinput increase_word_input" 
										name="HouseNO" id="hh1" value="" autofocus="autofocus" />
								</div>
						</div>
							<div class="mws-form-row">
								<label>&emsp;阀门地址：</label>

								<div class="mws-form-item large">
									<input type="text" class="mws-textinput increase_word_input" 
										name="ValAd" id="ValAd1" value="" autofocus="autofocus" />
								</div>
							</div>	
									
							<div class="mws-form-row">
								<label>&emsp;区管ID：</label>

								<div class="mws-form-item large">
									<input type="text" class="mws-textinput increase_word_input" 
										name="QgID" value="" autofocus="autofocus" />
								</div>
							</div>
							<div class="mws-form-row">
								<label>&emsp;用户类别：</label>

								<div class="mws-form-item large">
								<select style="height:40px;width:250px"  name="yhfl">
							     <option value="普通用户" >普通用户</option>
							     <option value="退费停暖" >退费停暖</option>
							     <option value="重点监控" >重点监控</option>
							     <option value="特殊情况" >特殊情况</option>
					            </select>
								</div>
						</div>
							<div class="mws-form-row">
								<label>&emsp;备注：</label>

								<div class="mws-form-item large">
									<input type="text" class="mws-textinput increase_word_input" 
										name="Bz" value="" autofocus="autofocus" />
								</div>
							</div>
							

						</div>
						<input type="button" id="word_increase_btn"
							class="mws-button black" value="新增" />
					</form>
				</div>
			</div>
		</div>
		
		<div id="change_word">
			<div class="mws-panel grid_4"
				style="width: 400px; min-width: 550px; margin: 20px 30%;">
				<div class="mws-panel-header">
					<span class="mws-i-24 i-pencil">查看图片</span> <span class="close"></span>
				</div>
				<div class="mws-panel-body" style="height: 400px;">
					<form class="mws-form" id="update" action="UpdateYh.action" method="post">
						<div class="mws-form-inline">
						 <input type="hidden" class="mws-textinput change_word_input"
							name="id" id="id" value="" />
						
							<div id="imagePathView" style="hight:200px;">
							
							</div>
							<!-- <div>
							<div>123456</div>
							<img alt="" src="https://www.hn-zy.com/cjqUpload/201910/21572083936579.jpg" style="hight:500px;width:300px">
							</div> -->
						</div>		
					</form>
				</div>
			</div>
		</div>
       

                 
</div>           
<script type="text/javascript">
var ssgs="<%=request.getSession().getAttribute("ssgs")%>"
if(ssgs!="null"){
	$("#ssgs").append("<option value='"+ssgs+"'>"+ssgs+"</option>");
}else{
	var gsList;
	$.ajax({
			url : "<%=basePath%>user/getgs.action", 
			async : false,
			dataType : "json",
			data : {
			
			},
			success : function(data) {
				
				gsList=data.list;	   
				
               for(var i=0; i<gsList.length; i++){
					
					$("#ssgs").append("<option value='"+gsList[i]+"'>"+gsList[i]+"</option>");
					
				}
			}

		});

}
	
var xq;

 $.ajax({
		url : "<%=basePath%>yhInfo/findXq.action", 
		async : false,
		dataType : "json",
		data : {
			
		},
		success : function(data) {
			
			var opt="";
			 xq=data.Xq;
			
			 for(var i=0; i<xq.length; i++){
					
					$("#xq").append("<option value='"+xq[i].XqName+"'>"+xq[i].XqName+"</option>");
					$("#xq1").append("<option value='"+xq[i].XqName+"'>"+xq[i].XqName+"</option>");
					$("#xq2").append("<option value='"+xq[i].XqName+"'>"+xq[i].XqName+"</option>");
					
				}
		}

	});

 
 $("#xq").change(function(){
	 $.ajax({
			url : "<%=basePath%>yhInfo/findLd.action", 
			async : false,
			dataType : "json",
			data : {
				"xqm" : $("#xq").val(),
			},
			success : function(data) {
				$("#ldh option:gt(0)").remove();
				$("#dyh option:gt(0)").remove();
				$("#hh option:gt(0)").remove();
				var ld=data.Ld;
				for(var i=0; i<ld.length; i++){
					
					$("#ldh").append("<option value='"+ld[i].BuildNo+"'>"+ld[i].BuildNo+"</option>");
				}	
			}

		});
		
		
	});
 
 $("#ldh").change(function(){
	 $.ajax({
			url : "<%=basePath%>yhInfo/findDy.action", 
			async : false,
			dataType : "json",
			data : {
				"xqm" : $("#xq").val(),
				"ldh" : $("#ldh").val(),
			},
			success : function(data) {
				$("#dyh option:gt(0)").remove();
				$("#hh option:gt(0)").remove();
				var dy=data.Dy;
				for(var i=0; i<dy.length; i++){
					
					$("#dyh").append("<option value='"+dy[i].CellNo+"'>"+dy[i].CellNo+"</option>");
				}	
			}

		});
		
		
	});
 


 </script>        
<script type="text/javascript" src="../js/gdxq.js"></script>



</body>
</html>