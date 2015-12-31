//生日联动星座
function change1(){
					var bir = $("#birthday").val()
					var reg = /^(\d{1,4})(-|\/)(\d{1,2})\2(\d{1,2})$/;     
					var r = bir.match(reg);
					if(bir!=""&&bir!=null&&r!=null){
						var month = bir.split("-")[1]
						var day = bir.split("-")[2]
						
						if (month == 1 && day >=20 || month == 2 && day <=18) {$("#constellation").find("option[value='834']").attr("selected",true);} 
								 
						else if (month == 2 && day >=19 || month == 3 && day <=20) {$("#constellation").find("option[value='836']").attr("selected",true);} 
								
						else if (month == 3 && day >=21 || month == 4 && day <=19) {$("#constellation").find("option[value='814']").attr("selected",true);} 
								
						else if (month == 4 && day >=20 || month == 5 && day <=20) {$("#constellation").find("option[value='816']").attr("selected",true);} 
								
						else if (month == 5 && day >=21 || month == 6 && day <=21) {$("#constellation").find("option[value='818']").attr("selected",true);} 
								
						else if (month == 6 && day >=22 || month == 7 && day <=22) {$("#constellation").find("option[value='820']").attr("selected",true);} 

						else if (month == 7 && day >=23 || month == 8 && day <=22) {$("#constellation").find("option[value='822']").attr("selected",true);} 
								 
						else if (month == 8 && day >=23 || month == 9 && day <=22) {$("#constellation").find("option[value='824']").attr("selected",true);} 

						else if (month == 9 && day >=23 || month == 10 && day <=22) {$("#constellation").find("option[value='826']").attr("selected",true);} 

						else if (month == 10 && day >=23 || month == 11 && day <=21) {$("#constellation").find("option[value='828']").attr("selected",true);} 

						else if (month == 11 && day >=22 || month == 12 && day <=21) {$("#constellation").find("option[value='830']").attr("selected",true);} 

						else if (month == 12 && day >=22 || month == 1 && day <=19) {$("#constellation").find("option[value='832']").attr("selected",true);} 
							
					}
				}

//姓名联动拼音
function changeName(name){
	$.ajax({
		type:"post",
		url:projectURI.defcon+"/operationPerson/ajaxChangeName",
		data:{name:name},
		success:function(data){
			var options = '';
			$.each(data, function () { options += "<option values='"+this+"'>"+this+"</option>"; });
			$("#nameSpell").html(options);
		}
	})
}

//判断部门名称是否重复<依赖visualdatabootstrap.js的discovery_error和show_message方法>
function ajaxChange2(obj_id){
	var name = $("#"+obj_id).val()
	var tName = $("#tName").val()
	if((name!=null&&name!="")&&name==tName){
		$("#test").val(null);
		show_normalValue(obj_id)
	}else{
		$.ajax({
			type:"post",
			url:projectURI.defcon+"/privilegeOrganization/ajaxChange",
			data:{name:name},
			success:function(data){
				if(data!="false"){
					discovery_error(obj_id)
					show_message(obj_id,data);
					$("#test").val(data);
					
				}else{
					$("#test").val(null);
					
					if(name!=null&name!="")
						show_normalValue(obj_id)
				}
			}
			
		})
	}
}

//检查简单日期格式<依赖visualdatabootstrap.js的discovery_error,show_normalValue和show_message方法>
function validDate(obj_id){
	var name = $("#"+obj_id).val()
	if(name==""||name==null)
		return true
	var reg = /^(\d{4})(-|\/)(\d{1,2})\2(\d{1,2})$/;     
    var r = name.match(reg);     
    
    if(r==null){
    	
    	discovery_error(obj_id);
		show_message(obj_id,"请选择或输入格式为 年-月-日 的日期");
		return false
    }else{
    	var date = name.split("-");
    	var vDate = new Date(date[0],date[1]-1,date[2])
    	
    	if(vDate.Format("yyyy-MM-dd")!=name&&vDate.Format("yyyy-M-dd")!=name&&vDate.Format("yyyy-MM-d")!=name&&vDate.Format("yyyy-M-d")!=name){
    		discovery_error(obj_id);
    		show_message(obj_id,"请选择或输入正确日期");
    		return false;
    	}
    	show_normalValue(obj_id)
    	return true
    }    
	
	
}

//校验上传图片格式<依赖visualdatabootstrap.js的discovery_error和show_message方法>
function validImg(obj_id){
	  var imgPath = $("#"+obj_id).val();
	  var start = imgPath.lastIndexOf(".");
	  var format = imgPath.substring(start,imgPath.length).toUpperCase();
	  if(format!=".GIF"&&format!=".JPG"&&format!=".JPEG"&&format!=".BMP"&&format!=".PNG"){
		  discovery_error(obj_id);
		  show_message(obj_id,"请上传gif, jpg, jpeg, bmp, png格式的图片");
		  return false;
	  }
	  return true;
}
