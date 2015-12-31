<%@ page import="com.iminer.biz.entity.OperationPerson"%>
<%@ page import="com.iminer.biz.entity.PrivilegeOrganization"%>

<g:if test="${flash.message}">
	<div class="alert alert-warning" role="alert">
		${flash.message}
	</div>
</g:if>


<table class="table table-bordered">
	<thead>
		<tr class="alert alert-info">
			<th>相片</th>
			<th>
				${message(code: 'operationPerson.name.label', default: '姓名')}
			</th>
			<th>
				${message(code: 'operationPerson.organizationId.label', default: '部门')}
			</th>
			<th>
				${message(code: 'operationPerson.commonDuties.label', default: '职务')}
			</th>
			<th>
				${message(code: 'operationPerson.employeeId.label', default: '工号')}
			</th>
			<th>
				${message(code: 'operationPerson.birthday.label', default: '生日')}
			</th>
			<th>
				${message(code: 'operationPerson.gender.label', default: '性别')}
			</th>
			<th>
				${message(code: 'operationPerson.constellation.label', default: '星座')}
			</th>
			<th>
				${message(code: 'operationPerson.extensionNumber.label', default: '分机号')}
			</th>

			<th class="text-center">操作</th>
		</tr>
	</thead>
	<tbody>
		<g:each in="${operationPersonInstanceList}" status="i"
			var="operationPersonInstance">
			<tr>
				<td><img class="media-object" alt=""
					style="width: 32px; hight: 32px;"
					onerror="this.src='${grailsApplication.config.grails.app.name}/images/people.png'"
					src="${grailsApplication.config.grails.app.name}/operationPerson/getPersonImage?id=${operationPersonInstance?.id}"
					onclick='getImgPath(this.src)'></td>
				<td><g:link action="show" id="${operationPersonInstance?.id}">
						${fieldValue(bean: operationPersonInstance, field: "name")}
					</g:link></td>
				<td><g:if
						test="${operationPersonInstance?.organizationId?.showFname }">
						${fieldValue(bean: operationPersonInstance, field: "organizationId.fName")}
					</g:if> <g:else>
						${fieldValue(bean: operationPersonInstance, field: "organizationId.name")}
					</g:else></td>
				<td>
					${fieldValue(bean: operationPersonInstance, field: "commonDuties")}
				</td>
				<td>
					${fieldValue(bean: operationPersonInstance, field: "employeeId")}
				</td>
				<td>
					${operationPersonInstance?.birthday?.format('MM月dd日')}
				</td>
				<td>
					${operationPersonInstance.gender==1?'男':'女'}
				</td>
				<td><g:if test="${operationPersonInstance?.constellation }">
						${com.iminer.biz.Category.findById(operationPersonInstance?.constellation)?.name}
					</g:if></td>
				<td>
					${fieldValue(bean: operationPersonInstance, field: "extensionNumber")}
				</td>
				<td class="text-center"><g:form>
						<g:hiddenField name="id" value="${operationPersonInstance?.id}" />
						<g:hiddenField name="version"
							value="${operationPersonInstance?.version}" />
						<g:actionSubmit class="btn btn-info" action="edit" value="修改信息" />
						<g:actionSubmit action="deleted" class="btn btn-danger"
							value="删除记录" onclick="return confirm('确认删除员工?');" />
					</g:form></td>
			</tr>
		</g:each>
	</tbody>
	</tbody>
</table>
<g:if test="${operationPersonInstanceTotal }">
	<div class="m-pageing">
		<bs:ajaxPageTag totalCount="${operationPersonInstanceTotal }"
			offset="${params.offset }" max="${params.max }"
			onclick="ajaxGetBoxOfficeRankInfo"
			url="${grailsApplication.config.grails.app.name}/operationPerson/search" />
	</div>
</g:if>
<g:else>
	<hr>
	<h1 class="text-center">没有数据</h1>
</g:else>
<div class="modal fade" id="myModal" tabindex="-1">
	<div class="modal-dialog text-center" role="document">
		<img id="modelImg"
			onerror="this.src='${grailsApplication.config.grails.app.name}/images/people.png'"
			src="">
	</div>
</div>