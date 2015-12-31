<%@ page import="com.iminer.biz.entity.PrivilegeOrganization"%>

<g:if test="${flash.message}">
	<div class="alert alert-warning" role="alert">
		${flash.message}
	</div>
</g:if>
<table class="table table-bordered">
	<thead>
		<tr class="alert alert-info" role="alert">
			<th>
				${message(code: 'privilegeOrganization.name.label', default: '部门名称')}
			</th>
			<th>
				${message(code: 'privilegeOrganization.pid.label', default: '上级部门')}
			</th>
			<th>
				${message(code: 'privilegeOrganization.leaderIdOperationPerson.label', default: '负责人')}
			</th>
			<th style="width: 400px" class="text-center">操作</th>
		</tr>
	</thead>
	<tbody>
		<g:each in="${privilegeOrganizationInstanceList}" status="i"
			var="privilegeOrganizationInstance">
			<tr>
				<td><g:link action="show"
						id="${privilegeOrganizationInstance?.id}">
						${fieldValue(bean: privilegeOrganizationInstance, field: "name")}
					</g:link></td>
				<td>
					${privilegeOrganizationInstance?.fName}
				</td>
				<td><g:if
						test="${privilegeOrganizationInstance?.leaderIdOperationPerson}">
						${privilegeOrganizationInstance.leaderIdOperationPerson?.name}
					</g:if></td>
				<td class="text-center"><g:form>
						<g:hiddenField name="id"
							value="${privilegeOrganizationInstance?.id}" />
						<g:hiddenField name="version"
							value="${privilegeOrganizationInstance?.version}" />
						<g:if test="${privilegeOrganizationInstance?.isAvailable==false }">
							<g:hiddenField name="isAvailable" value="true" />
							<g:actionSubmit action="deleted" class="btn btn-danger"
								value="恢复部门" onclick="return confirm('你确定恢复部门 ?');" />
						</g:if>
						<g:else>
							<g:actionSubmit class="btn btn-info" action="edit" value="修改部门" />
							<g:actionSubmit class="btn btn-info" action="create"
								value="新增下属部门" />
							<g:actionSubmit action="deleted" class="btn btn-danger"
								value="删除部门" onclick="return confirm('你确定删除部门 ?');" />
						</g:else>
					</g:form></td>
			</tr>
		</g:each>
	</tbody>
	</tbody>
</table>
<g:if test="${privilegeOrganizationInstanceTotal }">
	<div class="m-pageing">
		<bs:ajaxPageTag totalCount="${privilegeOrganizationInstanceTotal }"
			offset="${params.offset }" max="${params.max }"
			onclick="ajaxGetBoxOfficeRankInfo"
			url="${grailsApplication.config.grails.app.name}/privilegeOrganization/search" />
	</div>
</g:if>
<g:else>
	<hr>
	<h1 class="text-center">没有数据</h1>
</g:else>
