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
			<g:hasErrors bean="${OperationPerson}">
			<ul class="alert alert-warning" role="alert">
				<g:eachError bean="${OperationPerson}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			
			<div class="panel panel-default" style="padding-top:10px">
				<g:form  class="form-horizontal container" action="save" enctype="multipart/form-data" >
					<g:render template="form"/>
				
				  	  <div class="form-group">
					  		
						    <div class="col-sm-offset-5 col-sm-7">
							      <hr>
							      <g:submitButton id="Vsubmit" name="create" class="btn btn-info" value="创建员工" style="height:45px"/>
							      <button type="reset" class="btn btn-warning" style="height:45px">重置信息</button>
						    </div>
					   </div>
				
			    </g:form>
			</div>

	</body>
</html>
	
