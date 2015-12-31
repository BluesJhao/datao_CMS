var host_id="http://192.168.0.128:8080";


function check_value(obj_id,obj_value,obj_type,obj_name,obje_message){



}
var color=["has-warning","has-error","has-success"]
var icon=["glyphicon-warning-sign","glyphicon-remove","glyphicon-ok"]





var value_date=new Array();


/*
添加校验内容
 */
function addVlue(_d){
	_d.obj_value=$("#"+_d.obj_id).val();
	_d.obj_name=$("[ for='"+_d.obj_id+"' ]").text();
	_d.obj_message=$("[ for='"+_d.obj_id+"' ]").text();
	console.log(_d.isblur);
	if(_d.isblur==undefined){
		_d.isblur=true;
	}
    value_date.push(_d)//添加内容
    if(_d.isblur){
        $("#"+_d.obj_id).blur(function(){
        	verify_one_data(_d);
        });
    }

}


function verify_one_data(_d){
	//判断该函数是否隐藏，就不进行校验
	if($("#"+_d.obj_id).parents("div .form-group").is(":hidden")&&_d.c_hidden){
		return true;
	}
     if(!check_MaxSize(_d.checkcn,_d.obj_id,$("#"+_d.obj_id).val(),_d.obj_name,_d.obj_message,_d.check_Max_size,_d.show_id)){
        return false
    }else{
		show_normalValue(_d.obj_id,_d.show_id)
	}
	 if(!check_MinSize(_d.checkcn,_d.obj_id,$("#"+_d.obj_id).val(),_d.obj_name,_d.obj_message,_d.check_Min_size,_d.show_id)){
        return false
    }else{
		show_normalValue(_d.obj_id,_d.show_id)	
	}

    var char_array=toBin(_d.obj_type)
    for (var i = char_array.length - 1; i >= 0; i--) {

        if (char_array[i] == '1') {
            var arryz=char_array.length-1-i;
            var type = checktype[arryz];
            var isCheck=true;
            switch (type) {
                // 0校验长度   1是必填项，2email，4phonenumber，8url、16telephoneNumber、32身份证号码、64日期、128正整数、256不能包含中文、
                // 512时间、1024是否是手机号码
                case 1:
                    isCheck = check_required(_d.obj_id,$("#"+_d.obj_id).val(),_d.obj_type,_d.obj_name,_d.obj_message,_d.show_id);
                    break;
                case 2:
                    isCheck = check_email(_d.obj_id,$("#"+_d.obj_id).val(),_d.obj_type,_d.obj_name,_d.obj_message,_d.show_id)
                    break;
                case 4:
                    isCheck = check_phonenumber(_d.obj_id,$("#"+_d.obj_id).val(),_d.obj_type,_d.obj_name,_d.obj_message,_d.show_id);
                    break;
                case 8:
                    isCheck = check_url(_d.obj_id,$("#"+_d.obj_id).val(),_d.obj_type,_d.obj_name,_d.obj_message,_d.show_id);
                    break;
                case 16:
                    isCheck = check_telephoneNumber(_d.obj_id,$("#"+_d.obj_id).val(),_d.obj_type,_d.obj_name,_d.obj_message,_d.show_id);
                    break;
				case 32:
                    isCheck = check_number(_d.obj_id,$("#"+_d.obj_id).val(),_d.obj_name,_d.obj_message,_d.show_id);
                     break;
				case 64:
                    isCheck = check_number(_d.obj_id,$("#"+_d.obj_id).val(),_d.obj_name,_d.obj_message,_d.show_id);
                     break;
				case 128:
                    isCheck = check_pos_num(_d.obj_id,$("#"+_d.obj_id).val(),_d.obj_name,_d.obj_message,_d.show_id);
                     break;
				case 256:
					isCheck = check_funcChina(_d.obj_id,$("#"+_d.obj_id).val(),_d.obj_name,_d.obj_message,_d.show_id);
					break;
					
                default:
                    break;
            }
            if (!isCheck) {
                return false;
            }else{
                show_normalValue(_d.obj_id,_d.show_id)
            }

        }

    }
	return true;
}











// 1表示必填项校验
var checktype=[1,2,4,8,16,32,64,128,256]


function restore_module(){
    var dsize=value_date.length
    for(var j=0;j<dsize;j++){
		show_normalValue(value_date[j].obj_id,value_date[j].show_id)	
    }
}



function verify_data(){
    var dsize=value_date.length
    for(var j=0;j<dsize;j++){
		if(!verify_one_data(value_date[j])){
			return false
		}
	
    }
    return true

}

/*
校验必填项
 */
function check_required(obj_id,obj_value,obj_type,obj_name,obj_message,show_id){
    if(obj_value==""||obj_value==null||obj_value==undefined||obj_value=="undefined"){
        discovery_error(obj_id)
		show_message(obj_id," 请填写"+obj_name,show_id)
        return false
    }
    return true
}

/*
校验邮箱
 */
function check_email(obj_id,obj_value,obj_type,obj_name,obj_message,show_id){
	if(obj_value==""||obj_value==null){
		return true;
	}
    var myreg = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
    if(!myreg.test(obj_value)){
        discovery_error(obj_id)
        show_message(obj_id," 请填写有效邮箱",show_id)
        return false
    }
    return true
}
/*
校验手机号码
 */
function check_phonenumber(obj_id,obj_value,obj_type,obj_name,obj_messag,show_id){
	if(obj_value==""||obj_value==null){
		return true;
	}

    var strRegex = "^[1][358]\\d{9}\$"
    var re = new RegExp(strRegex)

    if(!re.test(obj_value)){
        discovery_error(obj_id)
        show_message(obj_id," 请填写有效手机号码",show_id)
         return false
    }
    return true


}
/*
校验最大长度
 */

function check_MaxSize(type,obj_id,obj_value,obj_name,obj_message,check_lenth,show_id){
    if(check_lenth==0||obj_value==""||obj_value==null){
        return true;
    }
	if(type){
		   if(len(obj_value)>check_lenth){
			discovery_error(obj_id)
			show_message(obj_id," 长度不能大于"+check_lenth/2,show_id)
			return false
		}
	}else{
	   if(obj_value.length>check_lenth){
			discovery_error(obj_id)
			show_message(obj_id," 长度不能大于"+check_lenth,show_id)
			return false
		}
	}
    return true
}
/**
校验最小长度
*/
function check_MinSize(type,obj_id,obj_value,obj_name,obj_message,check_lenth,show_id){
    if(check_lenth==0||obj_value==""||obj_value==null){
        return true;
    }
	if(type){
		   if(len(obj_value)<check_lenth){
			discovery_error(obj_id)
			show_message(obj_id," 长度不能小于"+check_lenth/2,show_id)
			return false
		}
	}else{
	   if(obj_value.length<check_lenth){
			discovery_error(obj_id)
			show_message(obj_id," 长度不能小于"+check_lenth,show_id)
			return false
		}
	}
    return true
}





/*
校验电话号码
 */
function check_telephoneNumber(obj_id,obj_value,obj_name,obj_message,show_id){
	if(obj_value==""||obj_value==null){
		return true;
	}
    var p1 = /^(\[0+]\d{2,3})?(-)?(0\d{2,3})?(-)?\d{7,8}(-)?(\d{3,})?$/;// /(^\([1-9]{3}\)[1-9]{3}(-\d{4})?$)|(^\([1-9]{3}\)\s[1-9]{3}(-\d{4})?$)|(^([1-9]{3}\s\/\s[1-9]{3}(-\d{4}))?$)|(^([1-9]{3}-[1-9]{3}(-\d{4}))?$)|(^([1-9]{3}\s[1-9]{3}(\s\d{4}))?$)|(^\d{10}$)/
    //[-\\w]{1,20}/;
    if (!p1.test(obj_value)){
        discovery_error(obj_id)
        show_message(obj_id," 电话格式不正确",show_id)
        return false
    }
    return true
 }


function check_url(obj_id,obj_value,obj_name,obj_message,show_id){
	if(obj_value==""||obj_value==null){
		return true;
	}
    var strRegex = "^((https|http|ftp|rtsp|mms)?://)"
        + "?(([0-9a-z_!~*'().&=+$%-]+: )?[0-9a-z_!~*'().&=+$%-]+@)?" //ftp的user@
        + "(([0-9]{1,3}\.){3}[0-9]{1,3}" // IP形式的URL- 199.194.52.184
        + "|" // 允许IP和DOMAIN（域名）
        + "([0-9a-z_!~*'()-]+\.)*" // 域名- www.
        + "([0-9a-z][0-9a-z-]{0,61})?[0-9a-z]\." // 二级域名
        + "[a-z]{2,6})" // first level domain- .com or .museum
        + "(:[0-9]{1,4})?" // 端口- :80
        + "((/?)|" // a slash isn't required if there is no file name
        + "(/[0-9a-zA-Z_!~*'().;?:@&=+$,%#-]+)+/?)$";
    var re=new RegExp(strRegex);
    //if(b!='undefined' && !b){(re.test(comUrl))
    if(!re.test(obj_value)){
        discovery_error(obj_id);
		show_message(obj_id," 网址不正确",show_id)
        return false
    }
    return true
}


function discovery_error(obj_id){
	
	$("#"+obj_id).focus();
//    $("#"+obj_id).css("border-bottom","3px solid #FF0000")
	$("#"+obj_id).parents("div .form-group").removeClass(color[2]).removeClass(color[10]).addClass(color[0])
	$("#"+obj_id).siblings(".glyphicon").removeClass(icon[2]).removeClass(icon[1]).addClass(icon[0]);
}

function show_message(obj_id,obj_message,show_id){
	var _id=obj_id
	if(show_id){
		_id=show_id
	}
	$("#"+$("#"+_id).attr("aria-describedby")).removeClass("sr-only").addClass("help-block").text(obj_message);
}
/**
 * 正确信息后的结果
 * @param obj_id
 * @param show_id
 */
function show_normalValue(obj_id,show_id){
	var _id=obj_id
	if(show_id){
		_id=show_id
	}
	$("#"+$("#"+_id).attr("aria-describedby")).removeClass("help-block").addClass("sr-only").text("");
	$("#"+_id).parents("div .form-group").removeClass(color[1]).removeClass(color[0]).addClass(color[2])
	$("#"+_id).siblings(".glyphicon").removeClass(icon[1]).removeClass(icon[0]).addClass(icon[2]);
}


function check_number(obj_id,obj_value,obj_name,obj_message,show_id){

	if(obj_value==""||obj_value==null){
		return true;
	}
	if(!_checkNumber(obj_value)){
        discovery_error(obj_id)
        show_message(obj_id,obj_message+"必须是数字",show_id)
		return false;
	}
	return true;
}
function check_pos_num(obj_id,obj_value,obj_name,obj_message,show_id){
	if(obj_value==""||obj_value==null){
		return true;
	}
	if(!isNaN(obj_value)){
	   //alert("是数字");
		if(parseInt(obj_value)<0){
			discovery_error(obj_id)
			show_message(obj_id,obj_name+"必须是正数",show_id)
			return false;
		}
	}else{
		discovery_error(obj_id)
		show_message(obj_id,obj_name+"必须是数字",show_id)
		return false;
	}
	
	return true;
}
function check_funcChina(obj_id,obj_value,obj_name,obj_message,show_id){
  if(/.*[\u4e00-\u9fa5]+.*$/.test(obj_value)) {   
	  show_message(obj_id,obj_name+"不能包含中文",show_id);   
    return false;   
   }   
    return true;   
}   
function _checkNumber(_v){
	var _n=new Number(_v)
	if(isNaN(_n)){
		return false;
	}
	return true;
}


function check_date(obj_id,obj_value,obj_name,obj_message,show_id){
	var ol=obj_value.length;
	if(ol<4){
		discovery_error(obj_id)
		show_message(obj_id,obj_name+"日期格式不正确！",show_id)
		return false;
	}
	if(ol==4){
		if(!_checkNumber(obj_value)){
			discovery_error(obj_id)
			show_message(obj_id,obj_name+"日期格式不正确！",show_id)
			return false;
		}else{
			if(new Number(obj_value)<1900){
				discovery_error(obj_id)
				show_message(obj_id,obj_name+"不能小于1900年！",show_id)
				return false;
			}
			return true;
		}
			
	}else{
		var _year=obj_value.substring(0,4);
		if(!_checkNumber(_year)){
			discovery_error(obj_id)
			show_message(obj_id,obj_name+"日期格式不正确！",show_id)
			return false;
		}
		var _temp=obj_value.substring(4)
		if(_temp.length<=2){
			//判断月
			if(!_checkNumber(_temp)){
				discovery_error(obj_id)
				show_message(obj_id,obj_name+"日期格式不正确！",show_id)
				return false;
			}
			
		}
	}
	
	
}








function ajaxQuery_CheckValue(object_id,object_value,object_type,show_id){
    	//if(b!='undefined' && !b){(contactPersonTel)


	$.ajax({
			type : "get",
			async:false,
			url : host_id+"/ireport/login/searchIfUnique",
			dataType : "jsonp",
			data:{
				name:object_id,
				object_value:object_value
			},
			jsonp: "callbackparam",//��������ڽ���callback���õ�function��Ĳ���
			//jsonpCallback:"success_jsonpCallback",//callback��function���
			success:function(data){
				//if(b!='undefined' && !b){(data)
				if(data){
					$("#"+object_id).css("border-bottom","3px solid #FF0000")
					$("#"+object_id).siblings().empty().append(" ��ʹ��")
					return false
				}else{
					$("#"+object_id).css("border","medium none")
					
					$("#"+object_id).siblings().empty().append("")
					return true
				}
				
			},
			error:function(XMLHttpRequest, textStatus, errorThrown){
				return false
			}
		});

    }

/**
 * 转化成二进制
 * @param intNum
 * @return {Array}
 */
function toBin(intNum) {
    var char_array=new Array();
    var answer = "";
    if(/\d+/.test(intNum)) {
        while(intNum != 0) {
            char_array.push(Math.abs(intNum%2))
            answer = Math.abs(intNum%2)+answer;
            intNum = parseInt(intNum/2);
        }
        if(answer.length == 0)
            char_array
    } else {
        char_array.push(0)
    }

	var char_array1=new Array()
	for(var i=char_array.length-1;i>=0;i--){
		char_array1.push(char_array[i])
	}

    return char_array1
}









/**
获得汉子的长度
*/
function len(s)
{
	var l=0;
	var a=s.split("");
		for(var i=0;i<a.length;i++)
		{
			if(a[i].charCodeAt(0)<299){l++ }
		else{ l+=2};
		}
	return l;
}



/*
校验必填邮箱
 */
function check_Nemail(obj_id,obj_value,obj_type,obj_name,obj_message,show_id){
	if(obj_value==""||obj_value==null){
		discovery_error(obj_id)
		show_message(obj_id," 请填写Email",show_id)
		return false;
	}
    var myreg = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
    if(!myreg.test(obj_value)){
        discovery_error(obj_id)
        show_message(obj_id," 请填写有效Email",show_id)
        return false
    }
    return true
}


