<%@ page import="com.iminer.biz.entity.PrivilegeOrganization"%>
<%@ page import="com.iminer.biz.entity.OperationPerson"%>
<script type="text/javascript"
	src="${grailsApplication.config.grails.app.name}/js/common/visualdatabootstrap.js "></script>
<script type="text/javascript"
	src="${grailsApplication.config.grails.app.name}/js/common/change.js "></script>
<script type="text/javascript"
	src="${ grailsApplication.config.grails.app.name}/js/autoComplete/autoComplete.js"></script>

<script type="text/javascript">
	$(document).ready(
			function() {
				movieInfoAutoComplete("leaderIdOperationPerson", 'image',
						'objectTypeId');
				value_date.push({
					obj_id : "name",
					obj_type : 1,
					check_Max_size : 64,
					check_Min_size : 0,
					obj_name : "部门名称"
				});
				value_date.push({
					obj_id : "comment",
					obj_type : 1,
					check_Max_size : 256,
					check_Min_size : 0,
					obj_name : "备注信息"
				});
				$("form").submit(function() {
					if ($("#test").val() != "" && $("#test").val() != null) {
						ajaxChange2('name')
						return false
					}
					if (!verify_data()) {
						return false;
					}
				});
			});
</script>
<g:if test="${privilegeOrganizationInstance?.pid}">
	<div class="form-group has-feedback">
		<label for=pid class="col-sm-2 control-label">上级部门</label>
		<div class="col-sm-6">
			<g:hiddenField name="pid"
				value="${privilegeOrganizationInstance.pid}" />
			<input name="fName" type="text"
				value="${privilegeOrganizationInstance?.fName}" class="form-control"
				readonly="readonly" />
		</div>
	</div>
</g:if>
<div class="form-group has-feedback">
	<label for="name" class="col-sm-2 control-label"
		style="margin-left: -7px">部门名称</label><span class="text-danger "
		style="height: 40px; line-height: 44px; float: left;">*</span>
	<div class="col-sm-6">
		<g:hiddenField name="test" id="test" />
		<g:hiddenField name="tName" id="tName" value="${name }" />
		<g:textField name="name" maxlength="64"
			value="${privilegeOrganizationInstance?.name}" placeholder="name"
			class="form-control" aria-describedby="nameStatus"
			onblur="ajaxChange2('name')" />
		<span class="glyphicon form-control-feedback" aria-hidden="true"></span>
		<span id="nameStatus" class="sr-only"></span>
	</div>
</div>
<input name="type" value=2 type="hidden">
<div class="form-group has-feedback">
	<label for="comment" class="col-sm-2 control-label"
		style="margin-left: -7px">部门备注</label><span class="text-danger "
		style="height: 40px; line-height: 44px; float: left;">*</span>
	<div class="col-sm-6">
		<g:textField name="comment" maxlength="256"
			value="${privilegeOrganizationInstance?.comment}"
			placeholder="comment" class="form-control"
			aria-describedby="commentStatus" />
		<span class="glyphicon form-control-feedback" aria-hidden="true"></span>
		<span id="commentStatus" class="sr-only"></span>
	</div>
</div>
<div class="form-group ">
	<label for="showFname" class="col-sm-2 control-label">上级部门<br>名称显示
	</label>
	<div class="col-sm-6" style="margin-top: 10px">
		<%--				<input type="checkBox" id="showFname"   class="iphone-toggle" data-no-uniform="true" name="showFname" value="${privilegeOrganizationInstance.showFname}" checked="checked"/>--%>
		<g:checkBox name="showFname" class="iphone-toggle"
			value="${privilegeOrganizationInstance?.showFname}" />
	</div>
</div>
<div class="form-group">
	<label for="orderIndex" class="col-sm-2 control-label">排序</label>
	<div class="col-sm-6">
		<g:field name="orderIndex" min="1" type="number" max="2147483647"
			value="${privilegeOrganizationInstance.orderIndex}"
			class="form-control" />
	</div>
</div>
<div class="form-group has-feedback">
	<label for="leaderIdOperationPerson" class="col-sm-2 control-label">负责人</label>
	<input type="hidden" id="objectTypeId" value="120"> <input
		type="hidden" id="leaderIdOperationPerson-objId"
		name="leaderIdOperationPerson-objId" value="${privilegeOrganizationInstance?.leaderIdOperationPerson }">
	<div class="col-sm-6">
		<g:textField name="leaderIdOperationPerson"
			id="leaderIdOperationPerson" maxlength="64"
			value="${privilegeOrganizationInstance?.leaderIdOperationPerson?.name}"
			placeholder="leader" class="form-control" />
		<%--			<select name="leaderIdOperationPerson" class="form-control">--%>
		<%--				<option value="">请选择</option>--%>
		<%--				<g:if test="${privilegeOrganizationInstance.leaderIdOperationPerson }">--%>
		<%--					<option value="${privilegeOrganizationInstance.leaderIdOperationPerson.id}" selected="selected">${privilegeOrganizationInstance.leaderIdOperationPerson.name}</option>--%>
		<%--				</g:if>--%>
		<%--				<g:each in="${com.iminer.biz.entity.OperationPerson.list()}" var="ts">--%>
		<%--					<option value="${ts.id}">${ts.name}</option>--%>
		<%--				</g:each>--%>
		<%--			</select> --%>
	</div>
</div>

