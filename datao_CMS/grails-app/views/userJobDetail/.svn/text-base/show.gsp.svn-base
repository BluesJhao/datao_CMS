<%@ page import="com.iminer.biz.entity.job.UserJobDetail"%>
<%@ page import="com.iminer.biz.entity.job.JobUser"%>
<%@ page import="com.iminer.biz.entity.job.Attach"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="iframeMain">
<g:set var="entityName"
	value="${message(code: 'userJobDetail.label', default: 'UserJobDetail')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
	<g:render template="/layouts/person/setting_header"></g:render>
	<div id="show-userJobDetail" class="content scaffold-show">
		<h2 class="text-center">详细事件</h2>
		<g:if test="${flash.message}">
			<div class="alert alert-success" role="status">
				${flash.message}
			</div>
		</g:if>
		<div class="panel panel-info" style="padding-top: 40px">
			<g:form class="form-horizontal container">

				<g:if test="${userJobDetailInstance?.name}">
					<div class="col-md-6 ">
						<label for="name" class="col-sm-3 text-right"> <g:message
								code="userJobDetail.name.label" default="标题" />
						</label>
						<div class="col-sm-9 text-center">
							<g:fieldValue bean="${userJobDetailInstance}" field="name" />
						</div>
					</div>
				</g:if>
				<g:if test="${userJobDetailInstance?.jobContent}">
					<div class="col-md-6 ">
						<label for="jobContent" class="col-sm-3 text-right"> <g:message
								code="userJobDetail.jobContent.label" default="事件内容" />
						</label>
						<div class="col-sm-9 text-center" style="max-height:80px;overflow-y:scroll">
								<g:fieldValue bean="${userJobDetailInstance}" field="jobContent" />
						</div>
					</div>
				</g:if>
				<g:if test="${userJobDetailInstance?.type}">
					<div class="col-md-6 ">
						<label for="type" class="col-sm-3 text-right"> <g:message
								code="userJobDetail.type.label" default="类型" />
						</label>
						<div class="col-sm-9 text-center">
							<g:if test="${userJobDetailInstance?.type }">
								${com.iminer.biz.entity.job.JobCode.get(userJobDetailInstance?.type)?.name}
							</g:if>
						</div>
					</div>
				</g:if>
				<g:if test="${userJobDetailInstance?.isAvailable}">
					<div class="col-md-6 ">
						<label for="isAvailable" class="col-sm-3 text-right"> <g:message
								code="userJobDetail.isAvailable.label" default="是否可用" />
						</label>
						<div class="col-sm-9 text-center">
							<g:if test="${userJobDetailInstance?.isAvailable}">
								<span style="margin-left: 20px">是</span>
							</g:if>
							<g:else>否</g:else>
						</div>
					</div>
				</g:if>
				<div class="col-md-6 ">
					<label for="personId" class="col-sm-3 text-right"> <g:message
							code="userJobDetail.personId.label" default="主办人" />
					</label>
					<div class="col-sm-9 text-center">
						<g:if test="${userJobDetailInstance?.id !=null }">
							<g:each
								in="${com.iminer.biz.entity.OperationPerson.findAll("from OperationPerson where id in (select personId from JobUser where jobId = :jobId)",[jobId:userJobDetailInstance?.id]) }"
								status="i" var="opi">
								<span style="margin-right: 10px"> ${com.iminer.biz.entity.OperationPerson.get(opi.id).name}
								</span>
							</g:each>
						</g:if>
					</div>
				</div>
				<g:if test="${userJobDetailInstance?.id}">
					<div class="col-md-6 ">
						<label for="attach" class="col-sm-3 text-right"> <g:message
								code="userJobDetail.attach.label" default="附件" />
						</label>
						<div class="col-sm-9 text-center">
							<g:each in="${Attach.findAllByJobId(userJobDetailInstance?.id) }"
								var="i">
								${i.name+"."+i.fileSuffix }
								[
								<g:link target="_blank" action="preview" id="${i.id }">预览</g:link>
								<g:link action="download" id="${i.id }">下载</g:link>
								]<br>
							</g:each>
						</div>
					</div>
				</g:if>
				<div class="col-sm-offset-5 col-sm-7">
					<hr>
					<g:hiddenField name="id" value="${userJobDetailInstance?.id}" />
					<g:link class="edit btn btn-info" action="edit"
						id="${userJobDetailInstance?.id}">修改</g:link>
					<g:actionSubmit class="delete btn btn-danger" action="deleted"
						value="删除" onclick="return confirm('确认删除事件?');" />
				</div>
			</g:form>
		</div>
	</div>
</body>
</html>
