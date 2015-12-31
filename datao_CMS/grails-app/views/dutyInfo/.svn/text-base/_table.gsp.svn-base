

<g:if test="${flash.message}">
			<div class="alert alert-warning" role="alert">${flash.message}</div>
			</g:if>
			<table class="table table-bordered">
				<thead>
					<tr class="alert alert-info" role="alert">
						<th>${message(code: 'dutyInfo.name.label', default: '职务名称')}</th>
						<th>${message(code: 'dutyInfo.enName.label', default: '英文名称')}</th>
						<th>${message(code: 'dutyInfo.createTime.label', default: '创建时间')}</th>
						<th>${message(code: 'dutyInfo.createUser.label', default: '创建人')}</th>
						
						<th class="text-center">操作</th>
					</tr>
				</thead>
				<tbody>
				<g:each in="${dutyInfoInstanceList}" status="i" var="dutyInfoInstance">
					<tr>
					
						<td><g:link action="show" id="${dutyInfoInstance?.id}">${fieldValue(bean: dutyInfoInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: dutyInfoInstance, field: "enName")}</td>
					
						<td>${dutyInfoInstance?.createTime?.format('yyyy-MM-dd')}</td>
					
						<td>${dutyInfoInstance?.createUser?.name}</td>
						<td class="text-center">
							<g:form>
		                        
								<g:hiddenField name="id" value="${dutyInfoInstance?.id}" />
								<g:hiddenField name="version" value="${dutyInfoInstance?.version}" />
						      	<g:actionSubmit class="btn btn-info" action="edit" value="更新职务" />
						      	<g:actionSubmit action="delete" class="btn btn-danger" value="删除职务" onclick="return confirm('确定删除职务?');" />
						      	
	                      	</g:form>
                      </td>
					</tr>
				</g:each>
				</tbody>
			</table>
			<g:if test="${dutyInfoInstanceTotal }">
				<div class="m-pageing">
					<bs:ajaxPageTag totalCount="${dutyInfoInstanceTotal }" offset="${params.offset }" max="${params.max }" 
						onclick="ajaxGetBoxOfficeRankInfo" url="${grailsApplication.config.grails.app.name}/dutyInfo/search"/>
				</div>
			</g:if>	
			<g:else>
				<hr>
				<h1 class="text-center">没有数据</h1>
			</g:else>	
