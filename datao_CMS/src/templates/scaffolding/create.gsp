<%=packageName%>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="iframeMain">
		<g:set var="entityName" value="\${message(code: '${domainClass.propertyName}.label', default: '${className}')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
		
	</head>
	<body>
		
		<div id="create-${domainClass.propertyName}" class="content scaffold-create">
			<h2 class="text-center"><g:message code="default.create.label" args="[entityName]" /></h2>
			<g:if test="\${flash.message}">
				<div class="alert alert-warning" role="alert">\${flash.message}</div>
			</g:if>
			<g:hasErrors bean="\${${propertyName}}">
			<ul class="alert alert-warning" role="alert">
				<g:eachError bean="\${${propertyName}}" var="error">
				<li <g:if test="\${error in org.springframework.validation.FieldError}">data-field-id="\${error.field}"</g:if>><g:message error="\${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<div class="panel panel-info" style="padding-top:10px">
				<g:form  class="form-horizontal container" action="save" <%= multiPart ? ' enctype="multipart/form-data"' : '' %>>
					<g:render template="form"/>
					<div class="col-sm-offset-5 col-sm-7">
						<hr>
						<g:submitButton name="create" class="btn btn-info" value="\${message(code: 'default.button.create.label', default: 'Create')}" style="height:45px"/>
						<button type="reset" class="btn btn-warning" style="height:45px">重置信息</button>
					</div>
				</g:form>
			</div>
		</div>
	</body>
</html>
