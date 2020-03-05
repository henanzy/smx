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
<link rel="stylesheet" type="text/css" href="../js/layer/2.4/skin/layer.css" media="screen" />
<script type="text/javascript" src="../js/layer/2.4/layer.js"></script>
<script type="text/javascript" src="../js/layui/layui.js"></script>
<script type="text/javascript" src="../js/layui/layui.all.js"></script>
<link rel="stylesheet" type="text/css" href="../js/layui/css/layui.css" media="screen" />
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


<script type="text/javascript" src="../plugins/elrte/js/elrte.min.js"></script>
<script type="text/javascript" src="../plugins/elfinder/js/elfinder.min.js"></script>

<script type="text/javascript" src="../js/mws.js"></script>
<script type="text/javascript" src="../js/demo.js"></script>
<script type="text/javascript" src="../js/themer.js"></script>



<style type="text/css">
* {
	margin: 0;
	padding: 0;
}

.table-th-css {
	position: relative !important;
	top: 0;
}

.mws-report {
	width: 98% !important;
	min-width: 170px;
	margin: 8px 1%;
	height: 70px;
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
select{
		height:24px;
		line-height:24px;
		border-radius:4px;
		background-color:rgba(43,45,49,0.8);
		color:#fff;
		cursor:pointer;
		text-align:center;
		padding:0 4px;
	}
</style>

<script>
    $(document).ready(function(){
		var shuakatableCont = $('#shuaka_table_body table tr th'); //获取th
		var shuakatableScroll = $('#shuaka_table_body'); //获取滚动条同级
		shuakatableScroll.on('scroll', scrollHandleshuaka);
		
		function scrollHandleshuaka() {
			var scrollTop = shuakatableScroll.scrollTop();
			// 当滚动距离大于0时设置top及相应的样式
			if (scrollTop > 0) {
				shuakatableCont.css({
					"top" : scrollTop + 'px',
					"marginTop" : "-1px",
					"backgroundColor" : "#EBEBEB"
				})
			} else { // 当滚动距离小于0时设置top及相应的样式 
				shuakatableCont.css({
					"top" : scrollTop + 'px',
					"marginTop" : "0",
					"backgroundColor" : "#EBEBEB"
				})
			}
		}
		

	    
    }); 
</script>


<body>
    <div id="" class="clearfix">
      
                

     	       
         <div class="mws-panel grid_8" style="width: 98%; float: left;">
         <div class="mws-panel-body">
			<div class="mws-panel-content" id="per_body">
			 <div class="layui-form-item">
           <label class="layui-form-label">用户名</label>
           <div class="layui-input-block">
               <input style="width:200px" autocomplete="off" id="username" name="username" placeholder="请输入用户名" value="" class="layui-input" maxlength="12"
                      lay-verify="required" required/>
           </div>
       </div>

       <div class="layui-form-item">
           <label class="layui-form-label">密码</label>
           <div class="layui-input-block">
               <input style="width:200px" autocomplete="off" id="password" name="password" placeholder="请输入新密码" type="password" class="layui-input" maxlength="12"
                      lay-verify="required|pass" required/>
           </div>
       </div>

      <div class="layui-form-item">
           <label class="layui-form-label">用户级别</label>
           <div class="layui-input-inline" style="width:200px;">
               <select style="width:200px"  id="type"  class="layui-input-inline">
               
               </select>
           </div>
       </div>
      

    
       
       <div class="layui-form-item model-form-footer" style="margin-left:130px">
           
           <button class="layui-btn layui-btn-normal" id="addYhSubmit" >添加</button>
       </div>
			</div>
		 </div>
			
		</div>
            
     <script type="text/javascript">
 	var form = layui.form
     form.render();
	 $.ajax({
			url :  "<%=basePath%>/user/getRole.action", 
			async : false,
			dataType : "json",
			data : {
				
			},
			success : function(data) {
				var list=data.list;
				for(var i=0; i<list.length; i++){
					
					 $("#type").append("<option value='"+list[i].id+"'>"+list[i].name+"</option>");
				}
			
			}
		});
	 $("#addYhSubmit").click(function () {
	    	var username = $('#username').val();
			var password = $('#password').val();
			var type = $('#type').val();
			var ssgs = $('#ssgs').val();
			
			if(username==""||password==""){
				alert("用户名或密码不为空!");
				return false;
			}
				$.ajax({
					url : "<%=basePath%>user/addYh.action", 
					async : false,
					dataType : "json",
					data : {
						"username" : username,
						"password" : password,
						"type" : type,
						"ssgs" : ssgs,
					},
					success : function(data) {
	
						msg = data.msg
						if(msg=="1"){
							
								alert("添加成功");
		                   
							
						}else{
							
									alert("用户名已存在!");
			                 
								
								//xzyh(1)
						}
					}

				});
	    });
     </script>
                
        
                 
</div>           
        
</body>
</html>