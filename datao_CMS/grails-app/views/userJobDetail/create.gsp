<%@ page import="com.iminer.biz.entity.job.UserJobDetail" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="iframeMain">
		<g:set var="entityName" value="${message(code: 'userJobDetail.label', default: 'UserJobDetail')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
		
	</head>
	<body>
		<g:render template="/layouts/person/setting_header"></g:render>
		
		<div id="create-userJobDetail" class="content scaffold-create">
			<h2 class="text-center">创建工作</h2>
			<g:if test="${flash.message}">
				<div class="alert alert-warning" role="alert">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${userJobDetailInstance}">
			<ul class="alert alert-warning" role="alert">
				<g:eachError bean="${userJobDetailInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<div class="panel panel-info" style="padding-top:10px">
				<g:form  class="form-horizontal container" action="save" method="post" enctype="multipart/form-data" >
					<hr>
					<g:render template="form"/>
					<div class="col-sm-offset-5 col-sm-7">
						<hr>
						<g:submitButton name="create" class="btn btn-info" value="创建事件" style="height:45px"/>
						<button type="reset" class="btn btn-warning" style="height:45px">重置信息</button>
					</div>
				</g:form>
			</div>
		</div>
	</body>
</html>
