<%@ page import="com.iminer.biz.entity.job.UserJobDetail" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="iframeMain">
		<g:set var="entityName" value="${message(code: 'userJobDetail.label', default: 'UserJobDetail')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>
		<g:render template="/layouts/person/setting_header"></g:render>
		<div id="edit-userJobDetail" class="content scaffold-edit">
			<h2 class="text-center">事件修改</h2>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${userJobDetailInstance}">
			<ul class="errors">
				<g:eachError bean="${userJobDetailInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<div class="panel panel-info" style="padding-top:20px">
				<g:form class="form-horizontal container" method="post" enctype="multipart/form-data">
					<g:hiddenField name="id" value="${userJobDetailInstance?.id}" />
					<g:hiddenField name="version" value="${userJobDetailInstance?.version}" />
					<g:render template="form"/>
					<div class="col-sm-offset-5 col-sm-7">
						<hr>
						<g:actionSubmit class="save btn btn-info" action="update" value="更新" />
						<g:actionSubmit class="delete btn btn-danger" action="deleted" value="删除" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: '确认删除事件?')}');" />
					</div>
				</g:form>
			</div>	
		</div>
	</body>
</html>
