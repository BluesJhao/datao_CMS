<%@ page import="com.iminer.biz.ioperation.entity.ServerInfo" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="iframeMain">
		<g:set var="entityName" value="${message(code: 'serverInfo.label', default: 'ServerInfo')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="show-serverInfo" class="content scaffold-show">
			<h1 class="text-center">服务器信息</h1>
			<g:if test="${flash.message}">
				<div class="alert alert-warning" role="status">${flash.message}</div>
			</g:if>
			<div class="panel panel-info" style="padding-top:20px">
				<g:form class="form-horizontal container">
				
					<g:if test="${serverInfoInstance?.pid}">
					<div class="col-md-6 ">
						<label for="pid" class="col-sm-3 text-right">
							<g:message code="serverInfo.pid.label" default="实体机编号" />
						</label>
						<div class="col-sm-9 text-center" >
							<g:fieldValue bean="${serverInfoInstance}" field="pid"/>
						</div>	
						
					 </div>
					</g:if>
					
					<g:if test="${serverInfoInstance?.id}">
					<div class="col-md-6 ">
						<label for="id" class="col-sm-3 text-right">
							<g:message code="serverInfo.id.label" default="虚拟机编号" />
						</label>
						<div class="col-sm-9 text-center" >
							<g:fieldValue bean="${serverInfoInstance}" field="id"/>
						</div>	
						
					 </div>
					</g:if>
				
					<g:if test="${serverInfoInstance?.scode}">
					<div class="col-md-6 ">
						<label for="scode" class="col-sm-3 text-right">
							<g:message code="serverInfo.scode.label" default="快速服务码" />
						</label>
						<div class="col-sm-9 text-center" >
							<g:fieldValue bean="${serverInfoInstance}" field="scode"/>
						</div>	
						
					 </div>
					</g:if>
				
					<g:if test="${serverInfoInstance?.typeId}">
					<div class="col-md-6 ">
						<label for="typeId" class="col-sm-3 text-right">
							<g:message code="serverInfo.typeId.label" default="服务器类型" />
						</label>
						<div class="col-sm-9 text-center" >
							${com.iminer.biz.ioperation.entity.DictionaryCode.get(serverInfoInstance?.typeId)?.dicValue }

						</div>	
						
					 </div>
					</g:if>
				
					<g:if test="${serverInfoInstance?.raidId}">
					<div class="col-md-6 ">
						<label for="raidId" class="col-sm-3 text-right">
							<g:message code="serverInfo.raidId.label" default="RAID方式" />
						</label>
						<div class="col-sm-9 text-center" >
							${com.iminer.biz.ioperation.entity.DictionaryCode.get(serverInfoInstance?.raidId)?.dicValue }
						</div>	
						
					 </div>
					</g:if>
				
					<g:if test="${serverInfoInstance?.supportId}">
					<div class="col-md-6 ">
						<label for="supportId" class="col-sm-3 text-right">
							<g:message code="serverInfo.supportId.label" default="供应商" />
						</label>
						<div class="col-sm-9 text-center" >
							${com.iminer.biz.ioperation.entity.DictionaryCode.get(serverInfoInstance?.supportId)?.dicValue }
						</div>	
						
					 </div>
					</g:if>
				
					<g:if test="${serverInfoInstance?.modelId}">
					<div class="col-md-6 ">
						<label for="modelId" class="col-sm-3 text-right">
							<g:message code="serverInfo.modelId.label" default="服务器型号" />
						</label>
						<div class="col-sm-9 text-center" >
							${com.iminer.biz.ioperation.entity.DictionaryCode.get(serverInfoInstance?.modelId)?.dicValue }
						</div>	
						
					 </div>
					</g:if>
				
					<g:if test="${serverInfoInstance?.houseId}">
					<div class="col-md-6 ">
						<label for="houseId" class="col-sm-3 text-right">
							<g:message code="serverInfo.houseId.label" default="机房" />
						</label>
						<div class="col-sm-9 text-center" >
							${com.iminer.biz.ioperation.entity.DictionaryCode.get(serverInfoInstance?.houseId)?.dicValue }
						</div>	
						
					 </div>
					</g:if>
				
					<g:if test="${serverInfoInstance?.cpuNum}">
					<div class="col-md-6 ">
						<label for="cpuNum" class="col-sm-3 text-right">
							<g:message code="serverInfo.cpuNum.label" default="Cpu个数" />
						</label>
						<div class="col-sm-9 text-center" >
							<g:fieldValue bean="${serverInfoInstance}" field="cpuNum"/>
						</div>	
						
					 </div>
					</g:if>
				
					<g:if test="${serverInfoInstance?.memorySize}">
					<div class="col-md-6 ">
						<label for="memorySize" class="col-sm-3 text-right">
							<g:message code="serverInfo.memorySize.label" default="内存大小(G)" />
						</label>
						<div class="col-sm-9 text-center" >
							<g:fieldValue bean="${serverInfoInstance}" field="memorySize"/>
						</div>	
						
					 </div>
					</g:if>
				
					<g:if test="${serverInfoInstance?.diskSize}">
					<div class="col-md-6 ">
						<label for="diskSize" class="col-sm-3 text-right">
							<g:message code="serverInfo.diskSize.label" default="磁盘大小(G)" />
						</label>
						<div class="col-sm-9 text-center" >
							<g:fieldValue bean="${serverInfoInstance}" field="diskSize"/>
						</div>	
						
					 </div>
					</g:if>
				
					<g:if test="${serverInfoInstance?.systemId}">
					<div class="col-md-6 ">
						<label for="systemId" class="col-sm-3 text-right">
							<g:message code="serverInfo.systemId.label" default="操作系统" />
						</label>
						<div class="col-sm-9 text-center" >
							${com.iminer.biz.ioperation.entity.DictionaryCode.get(serverInfoInstance?.systemId)?.dicValue }
							<g:fieldValue bean="${serverInfoInstance}" field="systemId"/>
						</div>	
						
					 </div>
					</g:if>
				
					<g:if test="${serverInfoInstance?.onlineTime}">
					<div class="col-md-6 ">
						<label for="onlineTime" class="col-sm-3 text-right">
							<g:message code="serverInfo.onlineTime.label" default="操作时间" />
						</label>
						<div class="col-sm-9 text-center" >
							<g:formatDate format="yyyy-MM-dd" date="${serverInfoInstance?.onlineTime}"/>
						</div>	
						
					 </div>
					</g:if>
				
					<g:if test="${serverInfoInstance?.personId}">
					<div class="col-md-6 ">
						<label for="personId" class="col-sm-3 text-right">
							<g:message code="serverInfo.personId.label" default="管理人" />
						</label>
						<div class="col-sm-9 text-center" >
							${com.iminer.biz.entity.OperationPerson.get(serverInfoInstance?.personId)?.name }
						</div>	
						
					 </div>
					</g:if>
				
				<div class="col-sm-offset-5 col-sm-7">
					<hr>
					<g:hiddenField name="id" value="${serverInfoInstance?.id}" />
					<g:link class="edit btn btn-info" action="edit" id="${serverInfoInstance?.id}">编辑</g:link>
					<g:actionSubmit class="delete btn btn-danger" action="deleted" value="删除" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</div>
			</g:form>
			</div>
			
		</div>
	</body>
</html>
