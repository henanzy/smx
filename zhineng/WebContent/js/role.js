function getRootPath(){      
	var curWwwPath=window.document.location.href;      
    var pathName=window.document.location.pathname;      
    var pos=curWwwPath.indexOf(pathName); 
    var localhostPaht=curWwwPath.substring(0,pos);      
    var projectName=pathName.substring(0,pathName.substr(1).indexOf('/')+1);      
    return(localhostPaht+projectName);  
} 


$(document).ready(function(){
//  表格
	$.ajax({
		url :  getRootPath()+"/user/getRole.action", 
		async : false,
		dataType : "json",
		data : {
			
		},
		success : function(data) {
			var list=data.list;
			for(var i=0; i<list.length; i++){
				
				 $("#role_id").append("<option value='"+list[i].id+"'>"+list[i].name+"</option>");
			}
		
		}
	});
	var qgxxList=[];
	function jsArrChange(json){
		for (var i = 0 ; i < json.length ; i ++) {
			var arr1 = [];
			arr1[0] = json[i].id;
			arr1[1] = json[i].username;
			arr1[2] = json[i].name;
			arr1[3] = json[i].role_id;
			
			qgxxList.push(arr1);
		};
	}
	jsArrChange(list);
	tbodydis("",qgxxList)
	
	
});


//表格写入函数带分页
function tbodydis(oldlist,newlist){
	

	
	var current = 1;
	function pageInit(currentPage, pagesize) {
		current = currentPage; // 将当前页存储全局变量
		pageCount = Math.ceil(newlist.length / pagesize); // 一共分多少页
		currentNum.innerHTML = currentPage;
		num.innerHTML = newlist.length + "条";
		pages.innerHTML = pageCount;
		var startRow = (currentPage - 1) * pagesize; // 开始显示的行
		var endRow = currentPage * pagesize - 1; // 结束显示的行
		var endRow = (endRow > newlist.length) ? newlist.length : endRow; // 如果结束行数大于总数目，显示总数目，否则结束行
		
		var html = "";
		for(var i = 0; i < newlist.length; i++) {
			if(i >= startRow && i <= endRow) { // 通过间隔分隔数组
				if(i%2 == 1){
					html += "<tr class='gradeX odd'>";
				}else if(i%2 == 0){
					html += "<tr class='gradeX even'>";
				}
				

				for (var j = 0 ; j <newlist[i].length ; j ++) {
					if(j==0){

						html += "<td style='display:none;'>" + newlist[i][j] + "</td>";
    					
    				}else{
                  html += "<td>" + newlist[i][j] + "</td>"
    				}
				}
				html += "<td><input class='xinjgd_change'  type='button' value='修改角色' /></td></tr>";
			}
		}
		jzq_body.innerHTML = html;

		$(".close").click(function(){
			$("#increase_word").hide();
			$("#change_word").hide();
		});
		
	
		var classname = "";
		$("table tbody td").hover(function() {
			classname = $(this).parent().attr("class");
			$(this).parent().removeClass(classname).addClass("blue");
			$("table tbody tr").find('td:eq(' + $(this).index() + ')').addClass('blue')
		}, function() {
			$(this).parent().removeClass("blue").addClass(classname);
			$("table tbody tr").find('td:eq(' + $(this).index() + ')').removeClass('blue')
		});
		$(".xinjgd_change").click(function(){
			xin_change(this);
		});

		$(".xinjgd_del").click(function(){
			xin_del(this);
		});
		$("#word_change_btn").unbind().click(function(){
	        alert("修改成功")
			
			/*alert(increaseValue);*/
			$("#change_word").hide(); 
		});
	}
	
	select.onchange = function(ev) {
		pageInit(1, this.value)
	}
	first.onclick = function() {
		pageInit(1, select.value)
	}
	end.onclick = function() {
		pageInit(pageCount, select.value)
	}

	next.onclick = function() {
		var curr = current + 1;
		if(curr > pageCount) {
			return
		}
		pageInit(curr, select.value)
	}

	last.onclick = function() {
		var curr = current - 1;
		if(curr < 1) {
			return
		}
		pageInit(curr, select.value)
	}
	pageInit(1, 15);
	$(".close").click(function(){
		$("#increase_word").hide();
		$("#change_word").hide();
	});
	



	$(".xinjgd_del").click(function(){
		xin_del(this);
	});

	
	$(".xinjgd_change").click(function(){
		xin_change(this);
	});
	
	$("#word_change_btn").unbind().click(function(){
        
		
		/*alert(increaseValue);*/
		$("#change_word").hide(); 
	});


	function xin_del(p){
		
		var xintr = $(p).parent().parent().children();
		var id=xintr[0].innerHTML
		
		 layer.confirm('确认删除么', function(index) {
			                 $.ajax({
			                     type: "post",
			                    url: getRootPath()+"/ZskCon/updateUser.action",
			                      dataType:'json',
			                  	data:{	
			      					"id":id,	
			      				},
			                     dataType: "json",
			                      success: function (data) {
			                    	   layer.close(index);
			                          window.location.reload();
			                     },
			  
			                 })
			              });
	}
	
	function xin_change(p){
		$("#change_word").show();
		var xintr = $(p).parent().parent().children();
		//修改数据
		var id=xintr[0].innerHTML
		$("#id").val(id);
		
	}
}
