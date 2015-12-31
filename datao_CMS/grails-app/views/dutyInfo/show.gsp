<%@ page import="com.iminer.biz.entity.OperationPerson" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="iframeMain" />
	</head>
	<body>
			<g:render template="/layouts/person/setting_header"></g:render>
			
			<g:if test="${flash.message}">
			<div class="alert alert-success" role="alert">${flash.message}</div>
			</g:if>
			
			<div class="panel panel-default">
				<g:form class="form-horizontal container">	
				
					<g:if test="${dutyInfoInstance?.name}">
						<div class="form-group">
						    <label for="name" class="col-sm-3 control-label">职务名称</label>
						    <div class="col-sm-9" style="margin-top:8px">
						      	<g:fieldValue bean="${dutyInfoInstance}" field="name" class="form-control"/>
						    </div>
						  </div>
					</g:if>
						  
					<g:if test="${dutyInfoInstance?.enName}">
					  <div class="form-group">
					    <label for="enName" class="col-sm-3 control-label">英文名称</label>
					    <div class="col-sm-9" style="margin-top:8px">
					      	<g:fieldValue bean="${dutyInfoInstance}" field="enName" class="form-control"/>
					    </div>
					  </div>
					 </g:if>
					  
					 <g:if test="${dutyInfoInstance?.createTime}">
					  <div class="form-group">
							<label for="createTime" class="col-sm-3 control-label">创建时间</label>
							<div class="col-sm-9" style="margin-top:8px">
								
								<g:formatDate date="${dutyInfoInstance?.createTime}" class="form-control"/>
							</div>
					   </div>
					  </g:if>
					   
					  <g:if test="${dutyInfoInstance?.createUser}">
					  	<div class="form-group">
							<label for="createUser" class="col-sm-3 control-label">创建人</label>
							<div class="col-sm-9" style="margin-top:8px">
			    				${OperationPerson.findById(dutyInfoInstance.createUser)?.name}
							</div>
						</div>
					   </g:if>	
		
					   <hr>
					    <div class="col-sm-offset-2 col-sm-10">
					    	<g:hiddenField name="id" value="${dutyInfoInstance?.id}" />
							<g:hiddenField name="version" value="${dutyInfoInstance?.version}" />
					      	<g:actionSubmit class="btn btn-info" action="edit" value="更新职务" />
					      	<g:actionSubmit class="btn btn-danger" action="delete"  value="删除职务" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
					    </div>
				</g:form>
			<hr>
		</div>
	</body>
</html>



				
