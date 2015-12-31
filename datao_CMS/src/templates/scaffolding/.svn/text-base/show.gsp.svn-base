<% import grails.persistence.Event %>
<%=packageName%>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="iframeMain">
		<g:set var="entityName" value="\${message(code: '${domainClass.propertyName}.label', default: '${className}')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="show-${domainClass.propertyName}" class="content scaffold-show">
			<h1 class="text-center"><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="\${flash.message}">
				<div class="alert alert-warning" role="status">\${flash.message}</div>
			</g:if>
			<div class="panel panel-info" style="padding-top:20px">
				<g:form class="form-horizontal container">
				<%  excludedProps = Event.allEvents.toList() << 'id' << 'version'
					allowedNames = domainClass.persistentProperties*.name << 'dateCreated' << 'lastUpdated'
					props = domainClass.properties.findAll { allowedNames.contains(it.name) && !excludedProps.contains(it.name) }
					Collections.sort(props, comparator.constructors[0].newInstance([domainClass] as Object[]))
					props.each { p -> %>
					<g:if test="\${${propertyName}?.${p.name}}">
					<div class="col-md-6 ">
						<label for="${p.name}" class="col-sm-3 text-right">
							<g:message code="${domainClass.propertyName}.${p.name}.label" default="${p.naturalName}" />
						</label>
						<div class="col-sm-9 text-center" >
							<g:fieldValue bean="\${${propertyName}}" field="${p.name}"/>
						</div>	
						
					 </div>
					</g:if>
				<%  } %>
				<div class="col-sm-offset-5 col-sm-7">
					<hr>
					<g:hiddenField name="id" value="\${${propertyName}?.id}" />
					<g:link class="edit btn btn-info" action="edit" id="\${${propertyName}?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete btn btn-danger" action="delete" value="\${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('\${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</div>
			</g:form>
			</div>
			
		</div>
	</body>
</html>
