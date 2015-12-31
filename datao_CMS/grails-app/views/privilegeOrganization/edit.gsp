<%@ page import="com.iminer.biz.entity.PrivilegeOrganization"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="iframeMain" />
</head>
<body>
	<g:render template="/layouts/person/setting_header"></g:render>
	<g:if test="${flash.message}">
		<div class="alert alert-warning" role="alert">
			${flash.message}
		</div>
	</g:if>
	<g:hasErrors bean="${privilegeOrganizationInstance}">
		<ul class="errors" role="alert">
			<g:eachError bean="${privilegeOrganizationInstance}" var="error">
				<li
					<g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
						error="${error}" /></li>
			</g:eachError>
		</ul>
	</g:hasErrors>
	<div class="panel panel-default" style="padding-top: 10px">
		<g:form class="form-horizontal container">
			<g:hiddenField name="id" value="${privilegeOrganizationInstance?.id}" />
			<g:hiddenField name="version"
				value="${privilegeOrganizationInstance?.version}" />
			<g:render template="form" />

			<div class="form-group">
				<hr>
				<div class="col-sm-offset-2 col-sm-10">
					<g:actionSubmit class="btn btn-info " action="update" value="更新部门" />
					<g:if test="${privilegeOrganizationInstance?.isAvailable==false }">
						<g:actionSubmit action="deleted" class="btn btn-danger"
							value="恢复部门" onclick="return confirm('你确定恢复部门 ?');" />
					</g:if>
					<g:else>
						<button class="btn btn-danger">
							<g:link controller="privilegeOrganization" action="deleted"
								params='[id:"${privilegeOrganizationInstance.id }"]'
								style="text-decoration:none;color:#fff;"
								onclick="return confirm('确定删除部门?');">删除部门</g:link>
						</button>
					</g:else>
				</div>
			</div>
		</g:form>
	</div>
</body>
</html>



