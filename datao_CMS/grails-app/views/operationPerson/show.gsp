<%@ page import="com.iminer.biz.entity.OperationPerson"%>
<%@ page import="com.iminer.biz.entity.PrivilegeOrganization"%>

<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="iframeMain" />
</head>
<body>
	<g:form class="form-horizontal container">
		<div class="form-group">
			<div style="margin-top: 8px; padding-left: 480px">
				<img class="media-object" alt="" style="width: 64px; hight: 64px;"
					onerror="this.src='${grailsApplication.config.grails.app.name}/images/people.png'"
					src="${grailsApplication.config.grails.app.name}/operationPerson/getPersonImage?id=${operationPersonInstance?.id}">
			</div>
		</div>
		<div class="col-sm-6">

			<g:if test="${operationPersonInstance?.name}">
				<div class="form-group">
					<label for="name" class="col-sm-4 control-label">员工姓名</label>
					<div class="col-sm-8 " style="margin-top: 8px; padding-left: 80px">
						<g:fieldValue bean="${operationPersonInstance}" field="name"
							class="form-control" />
					</div>
				</div>
			</g:if>
			<g:if test="${operationPersonInstance?.nickName}">
				<div class="form-group">
					<label for="name" class="col-sm-4 control-label">昵称</label>
					<div class="col-sm-8 " style="margin-top: 8px; padding-left: 80px">
						<g:fieldValue bean="${operationPersonInstance}" field="nickName"
							class="form-control" />
					</div>
				</div>
			</g:if>
			<g:if test="${operationPersonInstance?.idNumber}">
				<div class="form-group">
					<label for="idNumber" class="col-sm-4 control-label">身份证号</label>
					<div class="col-sm-8 " style="margin-top: 8px; padding-left: 80px">
						<g:fieldValue bean="${operationPersonInstance}" field="idNumber"
							class="form-control" />
					</div>
				</div>
			</g:if>
			<g:if test="${operationPersonInstance?.employeeId}">
				<div class="form-group">
					<label for="employeeId" class="col-sm-4 control-label">编号</label>
					<div class="col-sm-8 " style="margin-top: 8px; padding-left: 80px">
						<g:fieldValue bean="${operationPersonInstance}" field="employeeId"
							class="form-control" />
					</div>
				</div>
			</g:if>
			<g:if
				test="${operationPersonInstance?.organizationId?.showFname==true}">
				<div class="form-group">
					<label for="organizationId" class="col-sm-4 control-label">所属部门</label>
					<div class="col-sm-8 " style="margin-top: 8px; padding-left: 80px">
						${operationPersonInstance?.organizationId?.fName}
					</div>
				</div>
			</g:if>
			<g:elseif
				test="${operationPersonInstance?.organizationId?.showFname==false}">
				<div class="form-group">
					<label for="organizationId" class="col-sm-4 control-label">所属部门</label>
					<div class="col-sm-8 " style="margin-top: 8px; padding-left: 80px">
						${operationPersonInstance?.organizationId?.name}
					</div>
				</div>
			</g:elseif>
			<g:if test="${operationPersonInstance?.birthday}">
				<div class="form-group">
					<label for="birthday" class="col-sm-4 control-label">公历生日</label>
					<div class="col-sm-8 " style="margin-top: 8px; padding-left: 80px">
						${operationPersonInstance?.birthday?.format('MM月dd日')}
					</div>
				</div>
			</g:if>
			<g:if test="${operationPersonInstance?.lunarBirthday}">
				<div class="form-group">
					<label for="lunarBirthday" class="col-sm-4 control-label">农历生日</label>
					<div class="col-sm-8 " style="margin-top: 8px; padding-left: 80px">
						${operationPersonInstance?.lunarBirthday?.format('MM月dd日')}
					</div>
				</div>
			</g:if>
			<g:if test="${operationPersonInstance?.gender}">
				<div class="form-group">
					<label for="gender" class="col-sm-4 control-label">性别</label>
					<div class="col-sm-8 " style="margin-top: 8px; padding-left: 80px">
						${operationPersonInstance.gender==1?'男':'女' }
					</div>
				</div>
			</g:if>
			<g:if test="${operationPersonInstance?.constellation}">
				<div class="form-group">
					<label for="constellation" class="col-sm-4 control-label">星座</label>
					<div class="col-sm-8 " style="margin-top: 8px; padding-left: 80px">
						${com.iminer.biz.Category.findById(operationPersonInstance.constellation)?.name}
					</div>
				</div>
			</g:if>
			<g:if test="${operationPersonInstance?.qq}">
				<div class="form-group">
					<label for="qq" class="col-sm-4 control-label">QQ</label>
					<div class="col-sm-8 " style="margin-top: 8px; padding-left: 80px">
						<g:fieldValue bean="${operationPersonInstance}" field="qq"
							class="form-control" />
					</div>
				</div>
			</g:if>
			<g:if test="${operationPersonInstance?.nameSpell}">
				<div class="form-group">
					<label for="nameSpell" class="col-sm-4 control-label">姓名拼音</label>
					<div class="col-sm-8 " style="margin-top: 8px; padding-left: 80px">
						<g:fieldValue bean="${operationPersonInstance}" field="nameSpell"
							class="form-control" />
					</div>
				</div>
			</g:if>
		</div>
		<div class="col-sm-6">
			<g:if test="${operationPersonInstance?.email}">
				<div class="form-group">
					<label for="email" class="col-sm-4 control-label">Email</label>
					<div class="col-sm-8 " style="margin-top: 8px; padding-left: 80px">
						<g:fieldValue bean="${operationPersonInstance}" field="email"
							class="form-control" />
					</div>
				</div>
			</g:if>
			<g:if test="${operationPersonInstance?.mealId}">
				<div class="form-group">
					<label for="mealId" class="col-sm-4 control-label">餐卡号</label>
					<div class="col-sm-8 " style="margin-top: 8px; padding-left: 80px">
						<g:fieldValue bean="${operationPersonInstance}" field="mealId"
							class="form-control" />
					</div>
				</div>
			</g:if>
			<g:if test="${operationPersonInstance?.lockId}">
				<div class="form-group">
					<label for="lockId" class="col-sm-4 control-label">门禁卡号</label>
					<div class="col-sm-8 " style="margin-top: 8px; padding-left: 80px">
						<g:fieldValue bean="${operationPersonInstance}" field="lockId"
							class="form-control" />
					</div>
				</div>
			</g:if>
			<g:if test="${operationPersonInstance?.employedDate}">
				<div class="form-group">
					<label for="employedDate" class="col-sm-4 control-label">入职时间</label>
					<div class="col-sm-8 " style="margin-top: 8px; padding-left: 80px">
						${operationPersonInstance?.employedDate?.format('yyyy-MM-dd')}
					</div>
				</div>
			</g:if>
			<g:if test="${operationPersonInstance?.departureDate}">
				<div class="form-group">
					<label for="departureDate" class="col-sm-4 control-label">离职时间</label>
					<div class="col-sm-8 " style="margin-top: 8px; padding-left: 80px">
						${operationPersonInstance?.departureDate?.format('yyyy-MM-dd')}
					</div>
				</div>
			</g:if>
			<g:if test="${operationPersonInstance?.ana}">
				<div class="form-group">
					<label for="ana" class="col-sm-4 control-label">员工语录</label>
					<div class="col-sm-8 " style="margin-top: 8px; padding-left: 80px">
						<g:fieldValue bean="${operationPersonInstance}" field="ana"
							class="form-control" />
					</div>
				</div>
			</g:if>
			<g:if test="${operationPersonInstance?.commonDuties}">
				<div class="form-group">
					<label for="commonDuties" class="col-sm-4 control-label">常用职务</label>
					<div class="col-sm-8 " style="margin-top: 8px; padding-left: 80px">
						<g:fieldValue bean="${operationPersonInstance}"
							field="commonDuties" class="form-control" />
					</div>
				</div>
			</g:if>
			<g:if test="${operationPersonInstance?.extensionNumber}">
				<div class="form-group">
					<label for="extensionNumber" class="col-sm-4 control-label">分机号</label>
					<div class="col-sm-8 " style="margin-top: 8px; padding-left: 80px">
						<g:fieldValue bean="${operationPersonInstance}"
							field="extensionNumber" class="form-control" />
					</div>
				</div>
			</g:if>
			<g:if test="${operationPersonInstance?.tutorId}">
				<div class="form-group">
					<label for="extensionNumber" class="col-sm-4 control-label">导师</label>
					<div class="col-sm-8 " style="margin-top: 8px; padding-left: 80px">
						${(com.iminer.biz.entity.OperationPerson.get(operationPersonInstance.tutorId))?.name}
					</div>
				</div>
			</g:if>
		</div>
		<hr>
		<br>
		<div class="col-sm-offset-4 col-sm-8">
			<g:hiddenField name="id" value="${operationPersonInstance?.id}" />
			<g:hiddenField name="version"
				value="${operationPersonInstance?.version}" />
			<g:actionSubmit class="btn btn-info" action="edit" value="修改信息"
				style="height:45px" />
			<g:actionSubmit class="btn btn-danger" action="deleted" value="删除员工"
				style="height:45px" onclick="return confirm('确定删除员工 ?');" />
		</div>
	</g:form>
	<hr>
</body>
</html>
