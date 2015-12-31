<% import grails.persistence.Event %>
<%=packageName%>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="iframeMain">
		<g:set var="entityName" value="\${message(code: '${domainClass.propertyName}.label', default: '${className}')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
			<g:if test="\${flash.message}">
			<div class="alert alert-warning" role="alert">\${flash.message}</div>
			</g:if>
			
			<g:formRemote  name ="search"  url ="[controller:'OperationPerson',action:'search']"  update ="[success:'message',failure:'error']" >
		        <div class="box-inner">
		            <div data-original-title="" class="box-header well">
		           		 <ul class="nav pull-right">
		                      <g:link action="create"><div><i class="glyphicon glyphicon-plus"></i><g:message code="default.new.label" args="[entityName]" /></div></g:link>
		                 </ul>
		                 <div><i class="glyphicon glyphicon-th"></i>条件查询</div>
		            </div>
			        <div class="box-content">
			        	<ul class="nav nav-list" >
				        	<li >
				                 <div class="form-inline">
				                      <div class="form-group" >
				                                    
				                           <div class="input-group">
				                                 <div class="input-group-addon">查询条件1</div>
				                                 <input type="text" name="name1" id="name1" class="form-control span3"  placeholder="name1">
				                           </div>
				                                    
				                      </div>
				                                  
				                      <div class="form-group">
				                           <div class="input-group">
				                                <div class="input-group-addon">查询条件2</div>
				                                <input type="text" name="name2" id="name2" class="form-control span3"  placeholder="name2">
				                           </div>
				                      </div>
				
									  <button class="btn btn-success" style="width:200px"><i class="glyphicon glyphicon-search"></i>查询</button>
				                 </div>
				                      
				            </li>    
				            <li>
				                 <div id="errorMessage" class="alert-warning text-center" style="display:none;margin-top:0;margin-bottom:0;height:30px;padding-top:5px;width:276px"></div>
				                         
				            </li>
				                            
				        </ul>
			        </div>
		                
		    	</div>
			</g:formRemote>  
			<hr>
			<table class="table table-bordered">
				<thead>
					<tr class="alert alert-info">
					<%  excludedProps = Event.allEvents.toList() << 'id' << 'version'
						allowedNames = domainClass.persistentProperties*.name << 'dateCreated' << 'lastUpdated'
						props = domainClass.properties.findAll { allowedNames.contains(it.name) && !excludedProps.contains(it.name) && it.type != null && !Collection.isAssignableFrom(it.type) }
						Collections.sort(props, comparator.constructors[0].newInstance([domainClass] as Object[]))
						props.eachWithIndex { p, i ->
							if (i < 6) {
								if (p.isAssociation()) { %>
						<th><g:message code="${domainClass.propertyName}.${p.name}.label" default="${p.naturalName}" /></th>
					<%      } else { %>
						<g:sortableColumn property="${p.name}" title="\${message(code: '${domainClass.propertyName}.${p.name}.label', default: '${p.naturalName}')}" />
					<%  }   }   } %>
					<th class="text-center">Operation</th>
					</tr>
				</thead>
				<tbody>
				<g:each in="\${${propertyName}List}" status="i" var="${propertyName}">
					<tr>
					<%  props.eachWithIndex { p, i ->
							if (i == 0) { %>
						<td><g:link action="show" id="\${${propertyName}.id}">\${fieldValue(bean: ${propertyName}, field: "${p.name}")}</g:link></td>
					<%      } else if (i < 6) {
								if (p.type == Boolean || p.type == boolean) { %>
						<td><g:formatBoolean boolean="\${${propertyName}.${p.name}}" /></td>
					<%          } else if (p.type == Date || p.type == java.sql.Date || p.type == java.sql.Time || p.type == Calendar) { %>
						<td><g:formatDate date="\${${propertyName}.${p.name}}" /></td>
					<%          } else { %>
						<td>\${fieldValue(bean: ${propertyName}, field: "${p.name}")}</td>
					<%  }   }   } %>
					<td class="text-center">
							<g:form>
								<g:hiddenField name="id" value="\${${propertyName}.id}" />
								<g:hiddenField name="version" value="\${${propertyName}.version}" />
						      	<g:actionSubmit class="btn btn-info" action="edit" value="修改信息" />
						      	<g:actionSubmit action="deleted" class="btn btn-danger" value="删除记录"  onclick="return confirm('确认删除员工?');" />
	                      	</g:form>
                      </td>
					</tr>
				</g:each>
				</tbody>
			</table>
			
		<div class="pagination">
				<g:paginate total="\${${propertyName}Total}" />
		</div>
	</body>
</html>
