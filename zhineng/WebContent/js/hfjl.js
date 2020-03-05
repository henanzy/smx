$(document).ready(function(){
//  表格

	var qgxxList=[];
	function jsArrChange(json){
		for (var i = 0 ; i < json.length ; i ++) {
			var arr1 = [];
			arr1[0] = json[i].id;
			arr1[1] = json[i].XqName;
			arr1[2] = json[i].BuildNO;
			arr1[3] = json[i].CellNO;
			arr1[4] = json[i].HouseNO;
			arr1[5] = json[i].hflx;
			arr1[6] = json[i].hfmd;
			arr1[7] = json[i].hfjg;
			arr1[8] = json[i].hfr;
			arr1[9] = json[i].hftime;
			qgxxList.push(arr1);
		};
	}
	jsArrChange(list);
	tbodydis("",qgxxList)
	
	//新增按钮
	$("#increase_btn").click(function(){
		$("#increase_word").show();
	});

	//修改按钮
	$(".xinjgd_change").click(function(){
		xin_change(this);
	});
	//关闭新增
	$(".close").click(function(){
		$("#increase_word").hide();
		$("#change_word").hide();
	});
	
});

$("#search_btn").click(function(){
	/*layer.msg('数据加载中...', {
		icon: 16,
		shade: 0.01
		
		})*/
	var xq = $('#xq').val();
	var ld = $('#ldh').val();
	var dy = $('#dyh').val();
	var hh = $('#hh').val();
	var compareWordList = [];
	
	
	
		compareWord(xq,ld,dy,hh,compareWordList);
		qgxxList=compareWordList;
	$("#qgxx_body").empty();

	for(var x = 0;x < compareWordList.length;x ++){
		
		var newWordElemnet = "";
		if(x%2 == 1){
			newWordElemnet = "<tr class='gradeX odd'>";
		}else if(x%2 == 0){
			newWordElemnet = "<tr class='gradeX even'>";
		}
	
		for(var y = 0;y < compareWordList[x].length;y ++){
			
			

				newWordElemnet += "<td>" + compareWordList[x][y] + "</td>"
			
		}
		
		
		$("#qgxx_body").append(newWordElemnet);
		
	}
	
	tbodydis(qgxxList,compareWordList);
	


	
});

function compareWord(xq,ld,dy,hh,compareWordList){
		
		var json;
		compareWordList.length=0;
		$.ajax({
			url : "findhfjl.action", 
			async : false,
			dataType : "json",
			data : {
				"xqm":xq,
				"ldh":ld,
				"dyh":dy,
				"hh":hh,
				
			},
			success : function(data) {
			 json=data.list;
			
			}
		});

		for (var i = 0 ; i < json.length ; i ++) {
			var arr1 = [];
			arr1[0] = json[i].id;
			arr1[1] = json[i].XqName;
			arr1[2] = json[i].BuildNO;
			arr1[3] = json[i].CellNO;
			arr1[4] = json[i].HouseNO;
			arr1[5] = json[i].hflx;
			arr1[6] = json[i].hfmd;
			arr1[7] = json[i].hfjg;
			arr1[8] = json[i].hfr;
			arr1[9] = json[i].hftime;
			
			compareWordList.push(arr1);
		};
		
	}	
	
//表格写入函数带分页
function tbodydis(oldlist,newlist){
	
	if(oldlist == ""){
		var opt = [];
		for(var i = 0; i < newlist.length; i++) {
			for (var j = 0 ; j <newlist[i].length ; j ++) {
				if(j == 1){
					if( opt.indexOf(newlist[i][1]) == -1){
						opt.push(newlist[i][1]);
					}
				}
			}
		}
		
	}
	
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
					if(j==0||j==14){

						html += "<td style='display:none;'>" + newlist[i][j] + "</td>";
    					
    				}else{
                  html += "<td>" + newlist[i][j] + "</td>"
    				}
				}
				html += "<td><input class='xinjgd_change' id='xinjgd_change' type='button' value='修改' /><input class='xinjgd_del' type='button' value='删除' /></td></tr>";
			}
		}
		qgxx_body.innerHTML = html;

	
		
	
		var classname = "";
		$("table tbody td").hover(function() {
			classname = $(this).parent().attr("class");
			$(this).parent().removeClass(classname).addClass("blue");
			$("table tbody tr").find('td:eq(' + $(this).index() + ')').addClass('blue')
		}, function() {
			$(this).parent().removeClass("blue").addClass(classname);
			$("table tbody tr").find('td:eq(' + $(this).index() + ')').removeClass('blue')
		});
		
		$("#increase_btn").click(function(){

			$("#increase_word").show();
		});
		//修改按钮
		$("#xinjgd_change").click(function(){
			xin_change(this);
		});
		$(".xinjgd_del").click(function(){
			xin_del(this);
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
	var sel = $('#select').val();
	pageInit(1, sel);
	
	
	$("#word_increase_btn").click(function(){
		  $("#insert").submit();
		//获取到新增表单的信息
		/* $.ajax({
             type: "post",
            url: "findFm.action",
              dataType:'json',
          	data:{	
					"ValAd":$("#ValAd1").val(),
				},
             dataType: "json",
              success: function (data) {
            	  var flag=data.flag;
            	  if(flag==0){
            		  $("#insert").submit();
            		  alert("添加成功");
            		  $("#increase_word").hide(); 
            	  }else{
            		  alert("阀门地址已存在，请重新输入");
            	  }
             },

         })*/
	});
	//关闭新增
	$(".close").click(function(){
		$("#increase_word").hide();
		$("#change_word").hide();
	});
	$("#increase_btn").click(function(){

		$("#increase_word").show();
	});
	//修改按钮
	$(".xinjgd_change").click(function(){
		xin_change(this);
	});
	$(".xinjgd_del").click(function(){
		xin_del(this);
	});
	$("#word_change_btn").click(function(){
		 
            		  $("#update").submit();
            		  alert("修改成功");
            		  $("#change_word").hide(); 
		
	});
	var valad;
	function xin_change(p){
		$("#change_word").show();
	
		var xintr = $(p).parent().parent().children();
		//修改数据
		var changewordList = [];
		var flag=[0,1,2,3,4,5,6,7,8,9]
		for(var x = 0 ; x < 10 ; x ++){
			if(flag.includes(x)){
				changewordList.push(xintr[x].innerHTML);
			}
			
		}
		
		var changeInput = $("#change_word .change_word_input");
		for(var i = 0;i < changeInput.length;i ++){
			
				$("#change_word .change_word_input")[i].value = changewordList[i];
		}
	}
	

	


	function xin_del(p){
		var xintr = $(p).parent().parent().children();
		var id=xintr[0].innerHTML
		
		 layer.confirm('确认删除么', function(index) {
			                 $.ajax({
			                     type: "post",
			                    url: "DeleteKfhf.action",
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
}
