<%@ page import="com.iminer.biz.entity.OperationPerson" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="iframeMain" />
		<script type="text/javascript">
			$(document).ready(function(){
				$('#departureDate').datetimepicker({
				    format: 'yyyy-mm-dd',
				   	autoclose: true,
				   	minView:2,
				   	language:'zh-CN'
					});
				$('#employedDate').datetimepicker({
				    format: 'yyyy-mm-dd',
				   	autoclose: true,
				   	minView:2,
				   	language:'zh-CN'
					});
				$('#birthday').datetimepicker({
				    format: 'yyyy-mm-dd',
				   	autoclose: true,
				   	minView:2,
				   	language:'zh-CN'
					});
				$('#lunarBirthday').datetimepicker({
				    format: 'yyyy-mm-dd',
				   	autoclose: true,
				   	minView:2,
				   	language:'zh-CN'
					});
							
				});
	</script>
		
	</head>
	<body>
		
		<g:if test="${flash.message}">
			<div class="alert alert-warning" role="alert">${flash.message}</div>
		</g:if>
		<g:hasErrors bean="${operationPersonInstance}">
		<ul class="alert alert-warning" role="alert">
			<g:eachError bean="${operationPersonInstance}" var="error">
			<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
			</g:eachError>
		</ul>
		</g:hasErrors>
			
			<div class="panel panel-default" style="padding-top:10px">
				<h1 class="text-center text-default">修改员工资料</h1>
				<g:form  class="form-horizontal container" enctype="multipart/form-data" >
					<g:hiddenField name="id" value="${operationPersonInstance?.id}" />
					<g:hiddenField name="version" value="${operationPersonInstance?.version}" />
					<g:render template="form"/>
				
				  	  <div class="form-group">
					  		
						    <div class="col-sm-offset-5 col-sm-7">
							      <hr>
							      <g:actionSubmit value="修改信息" class="btn btn-info" action="update" style="height:45px"/>
						    	  <button class="btn btn-danger" style="height:45px"><g:link controller="operationPerson" action="deleted" params='[id:"${operationPersonInstance.id }"]' style="text-decoration:none;color:#fff;"  onclick="return confirm('确定删除部门?');">删除员工</g:link></button>
						    </div>
					   </div>
				
			    </g:form>
			</div>
		
	</body>
</html>
