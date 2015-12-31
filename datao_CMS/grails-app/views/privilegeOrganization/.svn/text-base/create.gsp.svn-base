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
	<g:hasErrors bean="${privilegeOrganization}">
		<ul class="alert alert-warning" role="alert">
			<g:eachError bean="${privilegeOrganization}" var="error">
				<li
					<g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
						error="${error}" /></li>
			</g:eachError>
		</ul>
	</g:hasErrors>
	<div class="panel panel-default" style="padding-top: 10px">
		<g:form class="form-horizontal container" action="save">
			<g:render template="form" />

			<div class="form-group">
				<hr>
				<div class="col-sm-offset-2 col-sm-10">
					<g:submitButton id="Vsubmit" name="create" class="btn btn-info"
						value="创建部门" />
					<button type="reset" class="btn btn-warning">重置信息</button>
				</div>
			</div>
		</g:form>
	</div>
</body>
</html>
