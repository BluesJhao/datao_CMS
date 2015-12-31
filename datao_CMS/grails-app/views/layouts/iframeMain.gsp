<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
	<head>
		<title>数据分析统计系统</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	    <meta name="viewport" content="width=device-width, initial-scale=1">
	    <link href="${grailsApplication.config.grails.app.share_file_path}/css/bootstrap-cerulean.min.css" rel="stylesheet"><!-- id="bs-css" 用于切换主题样式 -->
	    <link href="${grailsApplication.config.grails.app.share_file_path}/css/charisma-app.css" rel="stylesheet">
	    <link rel="stylesheet" type="text/css" href="${grailsApplication.config.grails.app.share_file_path}/css/fullcalendar.css"/>
	    <link rel="stylesheet" type="text/css" href="${grailsApplication.config.grails.app.share_file_path}/css/fullcalendar.print.css" media="print"/>
	    <link rel="stylesheet" type="text/css" href="${grailsApplication.config.grails.app.share_file_path}/css/chosen.min.css"/>
	    <link rel="stylesheet" type="text/css" href="${grailsApplication.config.grails.app.share_file_path}/css/colorbox.css"/>
	    <link rel="stylesheet" type="text/css" href="${grailsApplication.config.grails.app.share_file_path}/css/responsive-tables.css"/>
	    <link rel="stylesheet" type="text/css" href="${grailsApplication.config.grails.app.share_file_path}/css/bootstrap-tour.min.css"/>
	    <link href="${grailsApplication.config.grails.app.share_file_path}/css/jquery.noty.css" rel="stylesheet">
	    <link href="${grailsApplication.config.grails.app.share_file_path}/css/noty_theme_default.css" rel="stylesheet">
	    <link href="${grailsApplication.config.grails.app.share_file_path}/css/elfinder.min.css" rel="stylesheet">
	    <link href="${grailsApplication.config.grails.app.share_file_path}/css/elfinder.theme.css" rel="stylesheet">
	    <link href="${grailsApplication.config.grails.app.share_file_path}/css/jquery.iphone.toggle.css" rel="stylesheet">
	    <link href="${grailsApplication.config.grails.app.share_file_path}/css/uploadify.css" rel="stylesheet">
	    <link href="${grailsApplication.config.grails.app.share_file_path}/css/animate.min.css" rel="stylesheet">
	    <link rel="stylesheet" type="text/css" href="${grailsApplication.config.grails.app.share_file_path}/css/self.css"/>
	    <link rel="stylesheet" type="text/css" href="${grailsApplication.config.grails.app.share_file_path}/css/bootstrap-datetimepicker.min.css"/>
	    <!-- 加载本地字体文件 -->
	    <link href="${grailsApplication.config.grails.app.name}/css/fonts-source.css?201501131529" rel="stylesheet">
	    <link rel="shortcut icon" href="${grailsApplication.config.grails.app.share_file_path}/img/favicon.ico">
	    <script src="${grailsApplication.config.grails.app.share_file_path}/js/jquery2.0.3.min.js" type="text/javascript" charset="utf-8"></script>
	    <script id="iminercommon" src="${grailsApplication.config.grails.app.name}/js/iminer_common.js" type="text/javascript" charset="utf-8"></script>
	    <script src="${grailsApplication.config.grails.app.name}/js/left_menu.js" type="text/javascript" charset="utf-8"></script>
	    <script>
	    	projectURI.defcon="${grailsApplication.config.grails.app.name}"
	    </script>
		<g:layoutHead/>
		<r:layoutResources />
	</head>
	<body>
		<div class="box-content">
			<g:layoutBody/>
		</div>
		<g:javascript library="application"/>
		<r:layoutResources />
		
		<script src="${grailsApplication.config.grails.app.share_file_path}/js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
        <script src="${grailsApplication.config.grails.app.share_file_path}/js/jquery.cookie.js"></script>
        <script src="${grailsApplication.config.grails.app.share_file_path}/js/moment.min.js" type="text/javascript" charset="utf-8"></script>
        <script src="${grailsApplication.config.grails.app.share_file_path}/js/fullcalendar.min.js" type="text/javascript" charset="utf-8"></script>
        <script src="${grailsApplication.config.grails.app.share_file_path}/js/jquery.dataTables.min.js"></script>
        <script src="${grailsApplication.config.grails.app.share_file_path}/js/chosen.jquery.min.js" type="text/javascript" charset="utf-8"></script>
        <script src="${grailsApplication.config.grails.app.share_file_path}/js/jquery.colorbox-min.js" type="text/javascript" charset="utf-8"></script>
        <script src="${grailsApplication.config.grails.app.share_file_path}/js/jquery.noty.js"></script>
        <script src="${grailsApplication.config.grails.app.share_file_path}/js/responsive-tables.js" type="text/javascript" charset="utf-8"></script>
        <script src="${grailsApplication.config.grails.app.share_file_path}/js/bootstrap-tour.min.js" type="text/javascript" charset="utf-8"></script>
        <script src="${grailsApplication.config.grails.app.share_file_path}/js/jquery.raty.min.js"></script>
        <script src="${grailsApplication.config.grails.app.share_file_path}/js/jquery.iphone.toggle.js"></script>
        <script src="${grailsApplication.config.grails.app.share_file_path}/js/jquery.autogrow-textarea.js"></script>
        <script src="${grailsApplication.config.grails.app.share_file_path}/js/jquery.uploadify-3.1.min.js"></script>
        <script src="${grailsApplication.config.grails.app.share_file_path}/js/jquery.history.js"></script>
        <script src="${grailsApplication.config.grails.app.share_file_path}/js/charisma.js"></script>
        <script src="${grailsApplication.config.grails.app.share_file_path}/js/bootstrap-datetimepicker.min.js"></script>
        <script src="${grailsApplication.config.grails.app.share_file_path}/js/bootstrap-datetimepicker.zh-CN.js"></script>
	</body>
</html>
