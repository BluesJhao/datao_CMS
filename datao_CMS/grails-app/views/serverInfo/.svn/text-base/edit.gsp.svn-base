<%@ page import="com.iminer.biz.ioperation.entity.ServerInfo" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="iframeMain">
		<g:set var="entityName" value="${message(code: 'serverInfo.label', default: 'ServerInfo')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>
		
		<div id="edit-serverInfo" class="content scaffold-edit">
			<h1 class="text-center">编辑服务器信息</h1>
			<g:if test="${flash.message}">
				<div class="alert alert-warning" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${serverInfoInstance}">
			<ul class="alert alert-warning">
				<g:eachError bean="${serverInfoInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<div class="panel panel-info" style="padding-top:10px">
				<g:form class="form-horizontal container" method="post" >
					<g:hiddenField name="id" value="${serverInfoInstance?.id}" />
					<g:hiddenField name="version" value="${serverInfoInstance?.version}" />
					<g:render template="form"/>
					<div class="col-sm-offset-5 col-sm-7">
						<hr>
						<g:actionSubmit class="save btn btn-info" action="update" value="更新" />
						<g:actionSubmit class="delete btn btn-danger" action="deleted" value="删除" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
					</div>
					
				</g:form>
			</div>	
		</div>
	</body>
</html>
