<ul class="nav nav-tabs">
	<li role="presentation"
		${params.controller=="privilegeOrganization"?"class='active'":""}><a
		href="${grailsApplication.config.grails.app.name}/privilegeOrganization/list">部门设置</a></li>
	<li role="presentation"
		${params.controller=="dutyInfo"?"class='active'":""}><a
		href="${grailsApplication.config.grails.app.name}/dutyInfo/list">职位设置</a></li>
	<li role="presentation"
		${params.controller=="userJobDetail"?"class='active'":""}><a
		href="${grailsApplication.config.grails.app.name}/userJobDetail/list">工作设置</a></li>
</ul>
<hr>