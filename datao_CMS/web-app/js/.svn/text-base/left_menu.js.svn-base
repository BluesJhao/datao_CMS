/**
 * 左侧菜单相关交互
 */


/**
 * 功能内容高度自适应
 */
function contentIframeHeight(){
	var ifm= document.getElementById("contentIframe");
    var subWeb = document.frames ? document.frames["contentIframe"].document:ifm.contentDocument;
    if(ifm != null && subWeb != null) {
    	ifm.height = subWeb.body.scrollHeight;
    }
}

/**
 * 左侧菜单栏点击事件
 * @param obj : 当前点击dom对象
 * @param targetUrl ：iframe加载url
 */
function menuClick(obj,targetUrl){
	//处理左侧菜单选中状态
	$("#leftMenu li").removeClass("active")
	$(obj).parents("li").addClass("active")
	//处理面包屑导航
	$("#breadcrumb").empty()
	$("#leftMenu .active").each(function(){
		var aTag = $(this).find("a:eq(0)")
		if(aTag.find("span").length > 0){//有子级
			$("#breadcrumb").append("<li>"+aTag.find("span").text()+"</li>")
		}else{
			$("#breadcrumb").append("<li>"+aTag.text()+"</li>")
		}
	})
	//重置iframe加载地址
	$("#contentIframe").attr("src",targetUrl)
}

