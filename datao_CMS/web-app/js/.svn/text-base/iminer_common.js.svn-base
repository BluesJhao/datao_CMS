//全局监听ajax方法，session过期后跳转登录页面
$(document).ajaxComplete(function(event, xhr, settings) {
	var sessionstatus = xhr.getResponseHeader("timeout"); // 通过XMLHttpRequest取得响应头，sessionstatus，
	if (sessionstatus == "true") {
		var appname = xhr.getResponseHeader("appname");
		location.href = appname + "/"
	}
});


var projectURI ={ version: "1.0.0" ,defcon:"/operation"};

/**解决IE浏览器不支持数组indexOf方法**/
if (!Array.prototype.indexOf){
	 Array.prototype.indexOf = function (item) {
		var len = this.length;
		for (var i = 0; i < len; i++) {
			if (this[i] === item) {
				return i;
			}
		}
		return -1;
	}
}

/**
 * 日期格式化
 *
 */
Date.prototype.Format = function(format){
	var o = { 
		"M+" : this.getMonth()+1, //month 
		"d+" : this.getDate(), //day 
		"h+" : this.getHours(), //hour 
		"m+" : this.getMinutes(), //minute 
		"s+" : this.getSeconds(), //second 
		"q+" : Math.floor((this.getMonth()+3)/3), //quarter 
		"S" : this.getMilliseconds() //millisecond 
	} 

	if(/(y+)/.test(format)) { 
		format = format.replace(RegExp.$1, (this.getFullYear()+"").substr(4 - RegExp.$1.length)); 
	} 

	for(var k in o) { 
		if(new RegExp("("+ k +")").test(format)) { 
			format = format.replace(RegExp.$1, RegExp.$1.length==1 ? o[k] : ("00"+ o[k]).substr((""+ o[k]).length)); 
		} 
	} 
	return format; 
}