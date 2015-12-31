<%@ page import="com.iminer.biz.entity.DutyInfo" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="iframeMain" />

	</head>
	<body>
			<g:render template="/layouts/person/setting_header"></g:render>
		
			<g:if test="${flash.message}">
			<div class="alert alert-warning" role="alert">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${dutyInfoInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${dutyInfoInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<div class="panel panel-default" style="padding-top:10px">
				<g:form  class="form-horizontal container" action="save" >
					<g:hiddenField name="id" value="${dutyInfoInstance?.id}" />
					<g:hiddenField name="version" value="${dutyInfoInstance?.version}" />
					<g:render template="form"/>
				
				  		<div class="form-group">
					  		<hr>
						    <div class="col-sm-offset-2 col-sm-10">
						      <g:actionSubmit class="btn btn-info " action="update" value="更新职务" />
							  <g:actionSubmit class="btn btn-danger" action="delete" value="删除职务" formnovalidate="" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: '你确定删除职务?')}');" />
						    </div>
					  </div>
				
				</g:form>
			
			</div>
	</body>
</html>
