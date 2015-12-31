<%@ page import="com.iminer.biz.entity.PrivilegeOrganization"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="iframeMain" />
</head>
<body>
	<g:render template="/layouts/person/setting_header"></g:render>
	<g:if test="${flash.message}">
		<div class="alert alert-success" role="alert">
			${flash.message}
		</div>
	</g:if>
	<div class="panel panel-default">
		<g:form class="form-horizontal container">
			<g:if test="${privilegeOrganizationInstance?.name}">
				<div class="form-group">
					<label for="name" class="col-sm-3 control-label">部门名称</label>
					<div class="col-sm-9" style="margin-top: 8px">
						<g:fieldValue bean="${privilegeOrganizationInstance}" field="name"
							class="form-control" style="margin-left:20px" />
					</div>
				</div>
			</g:if>
			<g:if test="${privilegeOrganizationInstance?.pid}">
				<div class="form-group">
					<label for="pid" class="col-sm-3 control-label">上级部门 </label>
					<div class="col-sm-9" style="margin-top: 8px">
						<g:fieldValue bean="${privilegeOrganizationInstance}"
							field="fName" class="form-control" style="margin-left:20px" />
					</div>
				</div>
			</g:if>
			<g:if test="${privilegeOrganizationInstance?.comment}">
				<div class="form-group">
					<label for="comment" class="col-sm-3 control-label">部门备注</label>
					<div class="col-sm-9" style="margin-top: 8px">
						<g:fieldValue bean="${privilegeOrganizationInstance}"
							field="comment" class="form-control" style="margin-left:20px" />
					</div>
				</div>
			</g:if>
			<g:if test="${privilegeOrganizationInstance?.showFname}">
				<div class="form-group">
					<label for="showFname" class="col-sm-3 control-label">上级部门<br>名称显示
					</label>
					<div class="col-sm-9" style="margin-top: 16px">
						<g:if test="${privilegeOrganizationInstance?.showFname}">
							<span style="margin-left: 20px">是</span>
						</g:if>
					</div>
				</div>
			</g:if>
			<g:if test="${privilegeOrganizationInstance?.isAvailable}">
				<div class="form-group">
					<label for="isAvailable" class="col-sm-3 control-label">部门有效</label>
					<div class="col-sm-9" style="margin-top: 8px">
						<g:if test="${privilegeOrganizationInstance?.isAvailable}">
							<span style="margin-left: 20px">是</span>
						</g:if>
						<g:else>否</g:else>
					</div>
				</div>
			</g:if>
			<g:if
				test="${privilegeOrganizationInstance?.leaderIdOperationPerson}">
				<div class="form-group">
					<label for="leaderIdOperationPerson" class="col-sm-3 control-label">负责人</label>
					<div class="col-sm-9" style="margin-top: 8px">
						<g:link controller="operationPerson" action="show"
							id="${privilegeOrganizationInstance?.leaderIdOperationPerson?.id}"
							style="margin-left:20px">
							${privilegeOrganizationInstance?.leaderIdOperationPerson?.name}
						</g:link>
					</div>
				</div>
			</g:if>
			<hr>
			<div class="col-sm-offset-2 col-sm-10">
				<g:hiddenField name="id"
					value="${privilegeOrganizationInstance?.id}" />
				<g:hiddenField name="version"
					value="${privilegeOrganizationInstance?.version}" />
				<g:if test="${privilegeOrganizationInstance?.isAvailable==false }">
					<g:actionSubmit action="deleted" class="btn btn-danger"
						value="恢复部门" onclick="return confirm('你确定恢复部门 ?');" />
				</g:if>
				<g:else>
					<g:actionSubmit class="btn btn-info" action="edit" value="更新部门" />
					<g:actionSubmit class="btn btn-danger" action="deleted"
						value="删除部门" onclick="return confirm('你确定删除部门 ?');" />
				</g:else>

			</div>
		</g:form>
		<hr>
	</div>
</body>
</html>
