/**autocomplete相关CSS引用**/

var projectURITemp = { version: "1.0.0" ,defcon:projectURI.defcon};

console.log(projectURITemp.defcon)

document.write('<link type="text/css" rel="stylesheet" href="'+projectURITemp.defcon+'/css/autoComplete/jquery.ui.autocomplete.css">')
document.write('<link type="text/css" rel="stylesheet" href="'+projectURITemp.defcon+'/css/autoComplete/jquery.ui.theme.css">')
document.write('<link type="text/css" rel="stylesheet" href="'+projectURITemp.defcon+'/css/autoComplete/jquery.ui.menu.css">')

/**autocomplete相关JS引用**/
document.write("<script type='text/javascript' src='"+projectURITemp.defcon+"/js/autoComplete/jquery-ui.min.js'></script>");


/**
 * 新闻来源网站搜索
 * @param objId : 补全元素id
 */
function siteInfoAutoComplete(objId){
	$( "#"+objId).autocomplete({
		minLength: 1,//输入最小长度触发
		delay:0, //响应延迟，毫秒为单位
		//autoFocus:true,//是否自动选中第一个
		//disabled:true,//停止complete
		//position:{ my : "right top", at: "right bottom" },//提示框出现位置
		scroll:true,
		blurCallBackFun:siteInfoBlur,//绑定失去焦点事件
		source: function(request,response){
			$( "#"+objId).data( "ui-autocomplete" ).options.isRequest = true
			if($("#"+objId+"-objId").length > 0){
				$("#"+objId+"-objId").val("")
			}
			$.ajax({
				type:"post",
				url:projectURITemp.defcon+"/autoComplete/autoComplete",
				data:{autoKey:request.term,objectType:"sitetype"},
				success:function(data){
					$( "#"+objId).data( "ui-autocomplete" ).options.resultNum = data.length
					response( $.map( data, function( item ) {
						return {
							id: item.id,
							name: item.name,
							image:item.image
						}
					}));
				}
			})
		},
		/**
		focus: function( event, ui ) {
			$( "#"+objId ).val( ui.item.name );
			var objIdIndex = objId.split("-")
			if(objIdIndex.length > 1 && $("#selectObjectId-"+objIdIndex[1]).length > 0){
				$("#selectObjectId-"+objIdIndex[1]).val(ui.item.id)
			}
			return false;
		},**/
		select: function( event, ui ) {
			$( "#"+objId).data( "ui-autocomplete" ).options.needClose=true
			$( "#"+objId).val( ui.item.name );
			if($("#"+objId+"-objId").length > 0){
				$("#"+objId+"-objId").val(ui.item.id)
			}
			return false;
		}
	}).data( "ui-autocomplete" )._renderItem = function( ul, item ) {
		var autoKey = $( "#"+objId).val()
		var name = item.name.length > 6 ?item.name.substring(0,5)+"...":item.name
		name = name.replace(autoKey,"<font color='red'>"+autoKey+"</font>")
		return $( "<li>" )
			.append( "<a href='javascript:void(0)'><span style='width:100%' class='auto_content_span' title='"+item.name+"' data-value='"+item.id+"'>"+name+"</span></a>" )
			.appendTo( ul );
	};
}

/**
 * 搜索指数类型失去焦点事件
 */
function siteInfoBlur(){
	if($("#mediaSource").val() == ""){
		$("#mediaSource-objId").val("")
	}
}




/**
 * 电影信息搜索
 * @param objId : 补全元素id
 * @param showType : 显示类型(normal:'常规，只显示名称';detail:'详细，显示导演等信息',nameAndYear:'名称+年份')
 * @param objectTypeId : 查询实体类型
 * @param subLength : 截取长度
 * @param repeatArr : 去重元素数组
 * @param choosefun : 选中后处理放 如果为空 执行默认方式
 */
function movieInfoAutoComplete(objId,showType,objectTypeId,subLength,repeatArr,choosefun){
	$( "#"+objId).autocomplete({
		minLength: 1,//输入最小长度触发
		delay:0, //响应延迟，毫秒为单位
		//autoFocus:true,//是否自动选中第一个
		//disabled:true,//停止complete
		//position:{ my : "right top", at: "right bottom" },//提示框出现位置
		scroll:true,
		blurCallBackFun:movieInfoBlur,//绑定失去焦点事件
		source: function(request,response){
			$( "#"+objId).data( "ui-autocomplete" ).options.isRequest = true
			if($("#"+objId+"-objId").length > 0){
				$("#"+objId+"-objId").val("")
			}
			var excludeMovieIds = ""
			if(repeatArr != undefined && repeatArr.length > 0){
				for(var i=0;i<repeatArr.length;i++){
					if($(repeatArr[i]).val() != ""){
						excludeMovieIds += $(repeatArr[i]).val() + ","
					}
				}
			}
			if(excludeMovieIds != ""){
				excludeMovieIds = excludeMovieIds.substring(0,excludeMovieIds.length-1)
			}
			$.ajax({
				type:"post",
				url:projectURITemp.defcon+"/autoComplete/autoComplete",
				data:{autoKey:request.term,objectType:$("#"+objectTypeId).val(),excludeMovieIds:excludeMovieIds},
				success:function(data){
					$( "#"+objId).data( "ui-autocomplete" ).options.resultNum = data.length
					response( $.map( data, function( item ) {
						return {
							id: item.id,
							name: item.name,
							image:item.image
//							year:item.year,
//							directors:item.directors,
//							show_directors:item.show_directors,
//							actors:item.actors,
//							show_actors:item.show_actors
						}
					}));
				}
			})
		},
		/**
		focus: function( event, ui ) {
			$( "#"+objId ).val( ui.item.name );
			var objIdIndex = objId.split("-")
			if(objIdIndex.length > 1 && $("#selectObjectId-"+objIdIndex[1]).length > 0){
				$("#selectObjectId-"+objIdIndex[1]).val(ui.item.id)
			}
			return false;
		},**/
		select: function( event, ui ) {
			$( "#"+objId).data( "ui-autocomplete" ).options.needClose=true

			if(choosefun != undefined){
				choosefun(ui.item.id,ui.item.name)
			}else{
				$( "#"+objId).val( ui.item.name );
				if($("#"+objId+"-objId").length > 0){
					$("#"+objId+"-objId").val(ui.item.id)
					
				}
			}
	
			return false;
		}
	}).data( "ui-autocomplete" )._renderItem = function( ul, item ) {
		if(showType == "detail"){
			ul.attr("id","searchMoves")
			var autoKey = $( "#"+objId).val()
			var name = item.name.replace(autoKey,"<font color='red'>"+autoKey+"</font>")
			var appendStr = "<a href='javascript:void(0)' style='padding:0;height:52px;'><img width='34' height='49' src='"+item.image+"' alt='' />" +
							"<div><p>"+name
			if(item.year != undefined){
				appendStr += "（"+item.year+"）"
			}
			appendStr += "</p><p title='"+item.directors+"'>导演："+item.show_directors+"</p><p title='"+item.actors+"'>主演："+item.show_actors+"<span>电影</span></p></div></a>"
			return $( "<li>" )
				.append(appendStr)
				.appendTo( ul );
		}else if(showType == "normal"){
			if(subLength == undefined){
				subLength = 11
			}
			var autoKey = $( "#"+objId).val()
			var name = item.name.length > subLength ?item.name.substring(0,subLength-1)+"...":item.name
			name = name.replace(autoKey,"<font color='red'>"+autoKey+"</font>")
			return $( "<li>" )
				.append( "<a href='javascript:void(0)'><span style='width:100%' class='auto_content_span' title='"+item.name+"' data-value='"+item.id+"'>"+name+"</span></a>" )
				.appendTo( ul );
		}else if(showType == "nameAndYear"){
			if(subLength == undefined){
				subLength = 11
			}
			var movieYear = item.year
			if(!movieYear){
				movieYear = ""
			}else{
				movieYear = "("+movieYear+")"
			}
			var autoKey = $( "#"+objId).val()
			var name = item.name.length > subLength ?item.name.substring(0,subLength-1)+"...":item.name
			name = name.replace(autoKey,"<font color='red'>"+autoKey+"</font>")
			return $( "<li>" )
				.append( "<a href='javascript:void(0)'><span style='width:100%' class='auto_content_span' title='"+item.name+movieYear+"' data-value='"+item.id+"'>"+name+"</span></a>" )
				.appendTo( ul );
		}else if(showType="image"){
			ul.attr("id","searchMoves")
			var autoKey = $( "#"+objId).val()
			var name = item.name.replace(autoKey,"<font color='red'>"+autoKey+"</font>")
			var appendStr = "<a href='javascript:void(0)' style='padding:0;height:52px;'><img width='34' height='40' src='"+item.image+"' alt='' />"+name
			appendStr += "</a>"
			return $( "<li>" )
				.append(appendStr)
				.appendTo( ul );
		}
	};
}

/**
 * 搜索指数类型失去焦点事件
 */
function movieInfoBlur(){
	if($("#globalSearchMovie").val() == ""){
		$("#globalSearchMovie-objId").val("")
	}
	if($("#searchEventMovieName").val() == ""){
		$("#searchEventMovieName-objId").val("")
	}
	if($("#compareSearchMovie1").val() == ""){
		$("#compareSearchMovie1-objId").val("")
	}
	if($("#compareSearchMovie2").val() == ""){
		$("#compareSearchMovie2-objId").val("")
	}
	if($("#compareSearchMovie3").val() == ""){
		$("#compareSearchMovie3-objId").val("")
	}
}
/**
 * 明星信息自动补全
 * @param objId :补全元素id
 * @param completeData :原始数据
 */
function relationCodeAutoComplete(objId,hiddenValueObjId,completeData){
	$( "#"+objId).autocomplete({
		minLength: 1,//输入最小长度触发
		delay:0, //响应延迟，毫秒为单位
		//autoFocus:true,//是否自动选中第一个
		//disabled:true,//停止complete
		//position:{ my : "right top", at: "right bottom" },//提示框出现位置
		scroll:true,
		source: function(request,response){
			var searchKey = request.term
			response( $.map( completeData, function( item ) {
				if(item.relation_name.indexOf(searchKey) > -1){
					return {
						id: item.relation_id,
						name: item.relation_name
					}
				}
			}));
		},
		/**
		focus: function( event, ui ) {
			$( "#"+objId ).val( ui.item.name );
			var objIdIndex = objId.split("-")
			if(objIdIndex.length > 1 && $("#selectObjectId-"+objIdIndex[1]).length > 0){
				$("#selectObjectId-"+objIdIndex[1]).val(ui.item.id)
			}
			return false;
		},**/
		select: function( event, ui ) {
			$( "#"+objId).val( ui.item.name );
			$("#"+hiddenValueObjId).val(ui.item.id)
			/**
			var objIdIndex = objId.split("-")
			if(objIdIndex.length > 1 && $("#"+hiddenInputPrefix+"-"+objIdIndex[1]).length > 0){
				$("#"+hiddenInputPrefix+"-"+objIdIndex[1]).val(ui.item.id)
			}
			if(objId.indexOf("global") > -1){
				$("#globalSearchButton").click()
			}
			$( "#"+objId).data( "ui-autocomplete" ).options.needClose = true**/
			return false;
		}
	}).data( "ui-autocomplete" )._renderItem = function( ul, item ) {
		return $( "<li>" )
			.append( "<a href='javascript:void(0)'><span class='auto_content_span' title='"+item.name+"'>"+item.name+"</span></a>" )
			.appendTo( ul );
	};
}
