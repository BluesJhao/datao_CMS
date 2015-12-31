<%=packageName%>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="iframeMain">
		<g:set var="entityName" value="\${message(code: '${domainClass.propertyName}.label', default: '${className}')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>
		
		<div id="edit-${domainClass.propertyName}" class="content scaffold-edit">
			<h1 class="text-center"><g:message code="default.edit.label" args="[entityName]" /></h1>
			<g:if test="\${flash.message}">
				<div class="alert alert-warning" role="status">\${flash.message}</div>
			</g:if>
			<g:hasErrors bean="\${${propertyName}}">
			<ul class="alert alert-warning">
				<g:eachError bean="\${${propertyName}}" var="error">
				<li <g:if test="\${error in org.springframework.validation.FieldError}">data-field-id="\${error.field}"</g:if>><g:message error="\${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<div class="panel panel-info" style="padding-top:10px">
				<g:form class="form-horizontal container" method="post" <%= multiPart ? ' enctype="multipart/form-data"' : '' %>>
					<g:hiddenField name="id" value="\${${propertyName}?.id}" />
					<g:hiddenField name="version" value="\${${propertyName}?.version}" />
					<g:render template="form"/>
					<div class="col-sm-offset-5 col-sm-7">
						<hr>
						<g:actionSubmit class="save btn btn-info" action="update" value="\${message(code: 'default.button.update.label', default: 'Update')}" />
						<g:actionSubmit class="delete btn btn-danger" action="delete" value="\${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('\${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
					</div>
					
				</g:form>
			</div>	
		</div>
	</body>
</html>
