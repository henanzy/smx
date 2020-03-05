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
				
				 $("#role").append("<option value='"+list[i].id+"'>"+list[i].name+"</option>");
			}
		
		}
	});
	var per_list;
	$.ajax({
		url :  getRootPath()+"/user/getRole_Per.action", 
		async : false,
		dataType : "json",
		data : {
			id:$("#role").val(),
		},
		success : function(data) {
			 per_list=data.list;
			
		
		}
	});
	$.ajax({
		url :  getRootPath()+"/user/getPermission.action", 
		async : false,
		dataType : "json",
		data : {
			
		},
		success : function(data) {
			var list=data.list;
			for(var i=0; i<list.length; i++){
				
				if(per_list.indexOf(list[i].id+"")==-1)
					{
					 $("#per_body").append("<input type='checkbox'  value='"+list[i].id+"'>"+list[i].name+"<br/><br/>");
					}
				else{
					$("#per_body").append("<input type='checkbox' checked='checked' value='"+list[i].id+"'>"+list[i].name+"<br/><br/>");
				}
				 
				 
			}
		
		}
	});
	$("#role").change(function(){
		
		$("#per_body").empty();
		var per_list;
		$.ajax({
			url :  getRootPath()+"/user/getRole_Per.action", 
			async : false,
			dataType : "json",
			data : {
				id:$("#role").val(),
			},
			success : function(data) {
				 per_list=data.list;
				
			
			}
		});
		$.ajax({
			url :  getRootPath()+"/user/getPermission.action", 
			async : false,
			dataType : "json",
			data : {
				
			},
			success : function(data) {
				var list=data.list;
				for(var i=0; i<list.length; i++){
					
					if(per_list.indexOf(list[i].id+"")==-1)
						{
						 $("#per_body").append("<input type='checkbox'  value='"+list[i].id+"'>"+list[i].name+"<br/><br/>");
						}
					else{
						$("#per_body").append("<input type='checkbox' checked='checked' value='"+list[i].id+"'>"+list[i].name+"<br/><br/>");
					}
					 
					 
				}
			
			}
		});
	});
	

});

function update(){
	var role_id=$("#role").val();
	var per_id=[];
	 $.each($('input:checkbox:checked'),function(){
		 per_id.push( $(this).val());
		
     });
	
	 $.ajax({
			url :  getRootPath()+"/user/UpdateRole_Per.action", 
			async : false,
			dataType : "json",
			traditional:true,
			data : {
				per_id:per_id,
				role_id:role_id,
			},
			success : function(data) {
				alert("修改成功")
				
			
			}
		});
}


	

