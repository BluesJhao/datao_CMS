<%@ page import="com.iminer.biz.ioperation.entity.ServerInfo" %>
<script type="text/javascript" src="${ grailsApplication.config.grails.app.name}/js/autoComplete/autoComplete.js"></script>
<script type="text/javascript" src="${grailsApplication.config.grails.app.name}/js/common/visualdatabootstrap.js "></script>
<script type="text/javascript">
			$(document).ready(function(){
				movieInfoAutoComplete("personId","image","objectTypeId");
				addVlue({obj_id:"scode",obj_type:1});
				addVlue({obj_id:"raidId",obj_type:1});
				addVlue({obj_id:"supportId",obj_type:1});
				addVlue({obj_id:"modelId",obj_type:1});
				addVlue({obj_id:"houseId",obj_type:1});
				addVlue({obj_id:"cpuNum",obj_type:1});
				addVlue({obj_id:"memorySize",obj_type:1});
				addVlue({obj_id:"diskSize",obj_type:1});
				addVlue({obj_id:"systemId",obj_type:1});
			    $("form").submit(function(){ 
				    if(!verify_data()){
					   return false;
					}
			    }); 
			   
			})
		</script>
<div class="col-md-6">
	<g:if test="${serverInfoInstance?.pid }">
		<div class="form-group has-feedback">
			<label for="pid" class="col-sm-3 control-label"> <g:message
					code="serverInfo.pid.label" default="实体机编号" />
			</label>
			<div class="col-sm-9">
				<g:textField class="form-control" name="pid"
					value="${serverInfoInstance?.pid}" readonly="readonly" />
			</div>
		</div>
	</g:if>
	<div class="form-group has-feedback">
		<label for="id" class="col-sm-3 control-label"> <g:message
				code="serverInfo.id.label" default="服务器编号" />

		</label>
		<div class="col-sm-9">
			<g:textField class="form-control" name="id"
				value="${serverInfoInstance?.id}" readonly="readonly" />
		</div>
	</div>
	<div class="form-group has-feedback">
		<label for="scode" class="col-sm-3 control-label"> <g:message
				code="serverInfo.scode.label" default="快速服务码" />
		</label>
		<div class="col-sm-9">
			<g:textField class="form-control" id="scode" name="scode"
				value="${serverInfoInstance?.scode}" maxlength="128"
				placeholder="server code" aria-describedby="scodeStatus" />
			<span class="glyphicon form-control-feedback" aria-hidden="true"></span>
			<span id="scodeStatus" class="sr-only"></span>
		</div>
	</div>
	<div class="form-group has-feedback">
		<label for="typeId" class="col-sm-3 control-label"> <g:message
				code="serverInfo.typeId.label" default="服务器类型" />

		</label>
		<div class="col-sm-9">
			<g:select id="typeId" name="typeId"
				value="${fieldValue(bean: serverInfoInstance, field: 'typeId')}"
				class="form-control"
				from="${com.iminer.biz.ioperation.entity.DictionaryCode.findAllByDicIdDictionaryInfo(com.iminer.biz.ioperation.entity.DictionaryInfo.get(106))}"
				optionKey="id" optionValue="dicValue" noSelection="['':'--请选择--']"
				readonly="readonly"/>
		</div>
	</div>
	<div class="form-group has-feedback">
		<label for="raidId" class="col-sm-3 control-label"> <g:message
				code="serverInfo.raidId.label" default="Raid方式"/>

		</label>
		<div class="col-sm-9">
			<g:select name="raidId" id="raidId" class="form-control"
				value="${fieldValue(bean: serverInfoInstance, field: 'raidId')}"
				from="${com.iminer.biz.ioperation.entity.DictionaryCode.findAllByDicIdDictionaryInfo(com.iminer.biz.ioperation.entity.DictionaryInfo.get(108))}"
				optionKey="id" optionValue="dicValue" noSelection="['':'--请选择--']" aria-describedby="raidIdStatus" />
			<span class="glyphicon form-control-feedback" aria-hidden="true"></span>
			<span id="raidIdStatus" class="sr-only"></span>	
		</div>
	</div>
	<div class="form-group has-feedback">
		<label for="supportId" class="col-sm-3 control-label"> <g:message
				code="serverInfo.supportId.label" default="供应商" />
		</label>
		<div class="col-sm-9">
			<g:select name="supportId" id="supportId" class="form-control"
				value="${fieldValue(bean: serverInfoInstance, field: 'supportId')}"
				from="${com.iminer.biz.ioperation.entity.DictionaryCode.findAllByDicIdDictionaryInfo(com.iminer.biz.ioperation.entity.DictionaryInfo.get(118))}"
				optionKey="id" optionValue="dicValue" noSelection="['':'--请选择--']" aria-describedby="supportIdStatus" />
			<span class="glyphicon form-control-feedback" aria-hidden="true"></span>
			<span id="supportIdStatus" class="sr-only"></span>
		</div>
	</div>
	<div class="form-group has-feedback">
		<label for="modelId" class="col-sm-3 control-label"> <g:message
				code="serverInfo.modelId.label" default="服务器型号" />

		</label>
		<div class="col-sm-9">
			<g:select name="modelId" id="modelId" class="form-control"
				value="${fieldValue(bean: serverInfoInstance, field: 'modelId')}"
				from="${com.iminer.biz.ioperation.entity.DictionaryCode.findAllByDicIdDictionaryInfo(com.iminer.biz.ioperation.entity.DictionaryInfo.get(116))}"
				optionKey="id" optionValue="dicValue" noSelection="['':'--请选择--']" aria-describedby="modelIdStatus"  />
			<span class="glyphicon form-control-feedback" aria-hidden="true"></span>
			<span id="modelIdStatus" class="sr-only"></span>
		</div>
	</div>
</div>

<div class="col-md-6">

	<div class="form-group has-feedback">
		<label for="houseId" class="col-sm-3 control-label"> <g:message
				code="serverInfo.houseId.label" default="机房" />

		</label>
		<div class="col-sm-9">
			<g:select name="houseId" id="houseId" class="form-control"
				value="${fieldValue(bean: serverInfoInstance, field: 'houseId')}"
				from="${com.iminer.biz.ioperation.entity.DictionaryCode.findAllByDicIdDictionaryInfo(com.iminer.biz.ioperation.entity.DictionaryInfo.get(2))}"
				optionKey="id" optionValue="dicValue" noSelection="['':'--请选择--']" aria-describedby="houseIdStatus"  />
			<span class="glyphicon form-control-feedback" aria-hidden="true"></span>
			<span id="houseIdStatus" class="sr-only"></span>
		</div>
	</div>
	<div class="form-group">
		<label for="cpuNum" class="col-sm-3 control-label"> <g:message
				code="serverInfo.cpuNum.label" default="CPU个数" />
			
		</label>
		<div class="col-sm-9">
			<g:field class="form-control" min="1" id="cpuNum" name="cpuNum"
				type="number" value="${serverInfoInstance?.cpuNum}" aria-describedby="cpuNumStatus" placeholder="cpu number"/>
			<span id="cpuNumStatus" class="sr-only"></span>
		</div>
	</div>
	<div class="form-group">
		<label for="memorySize" class="col-sm-3 control-label"> <g:message
			code = "serverInfo.memorySize.label" default="内存(G)" />
		</label>
		<div class="col-sm-9">
			<g:field class="form-control" min="1" id="memorySize"
				name="memorySize" type="number" max="2147483647"
				value="${serverInfoInstance?.memorySize}"  aria-describedby="memorySizeStatus" placeholder="memory size"/>
			<span id="memorySizeStatus" class="sr-only"></span>
		</div>
	</div>
	<div class="form-group">
		<label for="diskSize" class="col-sm-3 control-label"> <g:message
				code="serverInfo.diskSize.label" default="磁盘大小(G)" />
		</label>
		<div class="col-sm-9">
			<g:field class="form-control" min="1" id="diskSize" name="diskSize"
				type="number" max="2147483647"
				value="${serverInfoInstance?.diskSize}" aria-describedby="diskSizeStatus" placeholder="disk size"/>
			<span id="diskSizeStatus" class="sr-only"></span>
		</div>
	</div>
	<div class="form-group has-feedback">
		<label for="systemId" class="col-sm-3 control-label"> <g:message
				code="serverInfo.systemId.label" default="操作系统" />

		</label>
		<div class="col-sm-9">
			<g:select name="systemId" id="systemId" class="form-control"
				value="${fieldValue(bean: serverInfoInstance, field: 'systemId')}"
				from="${com.iminer.biz.ioperation.entity.DictionaryCode.findAllByDicIdDictionaryInfo(com.iminer.biz.ioperation.entity.DictionaryInfo.get(112))}"
				optionKey="id" optionValue="dicValue" noSelection="['':'--请选择--']" aria-describedby="systemIdStatus" />
			<span class="glyphicon form-control-feedback" aria-hidden="true"></span>
			<span id="systemIdStatus" class="sr-only"></span>
		</div>
	</div>
	<div class="form-group has-feedback">
		<label for="personId" class="col-sm-3 control-label"> <g:message
				code="serverInfo.personId.label" default="管理人" />

		</label>
		<input type="hidden" id="objectTypeId" value="120"> 
		<input type="hidden" id="personId-objId" name="personId-objId" value="${serverInfoInstance?.personId}">
		<div class="col-sm-9">
<%--			<g:select name="personId" id="personId" class="form-control"--%>
<%--				value="${fieldValue(bean: serverInfoInstance, field: 'personId')}"--%>
<%--				from="${com.iminer.biz.entity.OperationPerson.list()}"--%>
<%--				optionKey="id" optionValue="name" noSelection="['':'--请选择--']" />--%>
			<g:textField name="personId"
			id="personId" maxlength="64" value="${com.iminer.biz.entity.OperationPerson.get(serverInfoInstance?.personId)?.name}" placeholder="manager" class="form-control" />
		</div>
	</div>
</div>

