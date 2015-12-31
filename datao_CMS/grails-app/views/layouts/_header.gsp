<div class="navbar navbar-default" role="navigation">
	<div class="navbar-inner">
		<button type="button" class="navbar-toggle pull-left animated flip">
			<span class="sr-only">Toggle navigation</span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
		</button>
		<a class="navbar-brand" href="http://118.192.65.91:8900/ifilm" target="_blank">
			<img alt="Charisma Logo" src="${grailsApplication.config.grails.app.share_file_path}/img/logo20.png" class="hidden-xs" />
			<span>数据分析统计系统</span>
		</a>
		<!-- user dropdown starts -->
		<div class="btn-group pull-right">
			<button class="btn btn-default dropdown-toggle" data-toggle="dropdown">
				<i class="glyphicon glyphicon-user"></i>
				<span class="hidden-sm hidden-xs">${session?.user?.username }</span>
				<span class="caret"></span>
			</button>
			<ul class="dropdown-menu">
				<li class="divider"></li>
				<li><a href="${grailsApplication.config.grails.app.name}/login/loginOut">Logout</a></li>
			</ul>
		</div>
		<!-- user dropdown ends -->
	</div>
</div>