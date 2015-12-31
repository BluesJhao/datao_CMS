<%@ page import="com.iminer.biz.ioperation.entity.ServerInfo" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="iframeMain">
		<g:set var="entityName" value="${message(code: 'serverInfo.label', default: 'ServerInfo')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
		<script type="text/javascript" src="${ grailsApplication.config.grails.app.name}/js/autoComplete/autoComplete.js"></script>
		<script type="text/javascript">
			$(document).ready(function(){
				movieInfoAutoComplete("id","normal","objectTypeId");
			});
		</script>
	</head>
	<body>
			<g:if test="${flash.message}">
			<div class="alert alert-warning" role="alert">${flash.message}</div>
			</g:if>
			<g:form  name ="search"  url ="[controller:'serverInfo',action:'search']">
		        <div class="box-inner">
		            <div data-original-title="" class="box-header well">
		           		 <ul class="nav pull-right">
		                      <g:link action="create"><div><i class="glyphicon glyphicon-plus"></i>新增物理机</div></g:link>
		                 </ul>
		                 <div><i class="glyphicon glyphicon-th"></i>条件查询</div>
		            </div>
			        <div class="box-content">
			        	<ul class="nav nav-list" >
				        	<li >
				                 <div class="form-inline">
				                      <div class="form-group" >
				                                    
				                           <div class="input-group">
				                                 <div class="input-group-addon">机房</div>
				                                 <g:select name="houseId" id="houseId" class="form-control span3"  placeholder="house" from="${com.iminer.biz.ioperation.entity.DictionaryCode.findAllByDicIdDictionaryInfo(com.iminer.biz.ioperation.entity.DictionaryInfo.get(2))}" optionKey="id" optionValue="dicValue" noSelection="['':'--请选择--']"/>
				                           </div>
				                                    
				                      </div>
				                      <div class="form-group">
				                           <div class="input-group">
				                                <div class="input-group-addon">服务器编号</div>
				                                <input type="hidden" id="objectTypeId" value="121"> 
												<input type="hidden" id="id-objId" name="id-objId">
				                                <input name="id" id="id" class="form-control span3"  placeholder="server ID"/>
				                           </div>
				                      </div>
				                      <div class="form-group">
				                           <div class="input-group">
				                                <div class="input-group-addon">服务器型号</div>
				                                
				                                <g:select name="modelId" id="modelId" class="form-control span3"  placeholder="server model" from="${com.iminer.biz.ioperation.entity.DictionaryCode.findAllByDicIdDictionaryInfo(com.iminer.biz.ioperation.entity.DictionaryInfo.get(116))}" optionKey="id" optionValue="dicValue" noSelection="['':'--请选择--']"/>
				                           </div>
				                      </div>
				                      <div class="form-group">
				                           <div class="input-group" style="margin-left:20px">
				                                <input type="radio" name="type" >内网<br>
				                                <input type="radio" name="type" >外网
				                           </div>
				                      </div>
									  <button class="btn btn-success" style="width:200px;margin-left:20px"><i class="glyphicon glyphicon-search"></i>查询</button>
				                 </div>
				            </li>    
				            <li>
				                 <div id="errorMessage" class="alert-warning text-center" style="display:none;margin-top:0;margin-bottom:0;height:30px;padding-top:5px;width:276px"></div>
				            </li>
				        </ul>
			        </div>
		    	</div>
			</g:form>  
			<hr>
			<table class="table table-bordered">
				<thead>
					<tr class="alert alert-info">
					
						<g:sortableColumn property="id" title="${message(code: 'serverInfo.id.label', default: '服务器编号')}" />
					
						<g:sortableColumn property="houseId" title="${message(code: 'serverInfo.houseId.label', default: '机房')}" />
					
						<g:sortableColumn property="cpuNum" title="${message(code: 'serverInfo.cpuNum.label', default: 'CPU个数')}" />
					
						<g:sortableColumn property="memorySize" title="${message(code: 'serverInfo.memorySize.label', default: '内存大小')}" />
					
						<g:sortableColumn property="diskSize" title="${message(code: 'serverInfo.DiskSize.label', default: '硬盘大小')}" />
					
						<g:sortableColumn property="modelId" title="型号" />
						
						<g:sortableColumn property="supportId" title="供应商" />
					
					<th class="text-center">操作</th>
					</tr>
				</thead>
				<tbody>
				<g:each in="${serverInfoInstanceList}" status="i" var="serverInfoInstance">
					<tr>
						<td><g:link action="show" id="${serverInfoInstance.id}">${fieldValue(bean: serverInfoInstance, field: "id")}</g:link></td>
					
						<td>${com.iminer.biz.ioperation.entity.DictionaryCode.get(serverInfoInstance?.houseId)?.dicValue}</td>
					
						<td>${fieldValue(bean: serverInfoInstance, field: "cpuNum")}个</td>
						
						<td>${fieldValue(bean: serverInfoInstance, field: "memorySize")}G</td>
					
						<td>${fieldValue(bean: serverInfoInstance, field: "diskSize")}G</td>
					
						<td>${com.iminer.biz.ioperation.entity.DictionaryCode.get(serverInfoInstance?.modelId)?.dicValue}</td>
						
						<td>${com.iminer.biz.ioperation.entity.DictionaryCode.get(serverInfoInstance?.supportId)?.dicValue}</td>
					
					<td class="text-center">
							<g:form>
								<g:hiddenField name="id" value="${serverInfoInstance.id}" />
								<g:hiddenField name="version" value="${serverInfoInstance.version}" />
						      	<g:actionSubmit class="btn btn-info" action="edit" value="修改" />
						      	<g:actionSubmit action="deleted" class="btn btn-danger" value="下架"  onclick="return confirm('确认删除员工?');" />
	                      	</g:form>
                      </td>
					</tr>
				</g:each>
				</tbody>
			</table>
			
		<div class="pagination">
				<g:paginate total="${serverInfoInstanceTotal}" />
		</div>
	</body>
</html>
