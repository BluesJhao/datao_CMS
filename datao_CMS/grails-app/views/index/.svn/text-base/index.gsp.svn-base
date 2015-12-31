<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
	<meta name="layout" content="main" />
	<title>数据分析统计系统</title>
	<script>
		$(function(){
			$("#contentIframe").attr("src","${grailsApplication.config.grails.app.name}/homePage")
			$("#leftMenu li:eq(1)").addClass("active")
			iFrameHeight()
		})
		
		//iframe自适应高度
		function iFrameHeight() {
	        var ifm= document.getElementById("contentIframe");
	        var subWeb = document.frames ? document.frames["contentIframe"].document:ifm.contentDocument;
            if(ifm != null && subWeb != null) {
                if(subWeb.body.scrollHeight < 750){
                	ifm.height = 750
                }else{
                	ifm.height = subWeb.body.scrollHeight+50;
                }
            }
	    }
	</script>
</head>
<body>
	<div class="row">
		<g:render template="/layouts/left_menu"></g:render>
		<div id="content" class="col-lg-10 col-sm-10">
			<g:render template="/layouts/bread_crumb_navigation"></g:render>
			<iframe id="contentIframe" scrolling="auto" style="border:none;" width="100%" height="100%" onload="iFrameHeight()">
			</iframe>
		</div>
	</div>
</body>
</html>