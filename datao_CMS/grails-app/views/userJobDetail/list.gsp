
<%@ page import="com.iminer.biz.entity.job.UserJobDetail" %>
<%@ page import="com.iminer.biz.entity.job.JobUser" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="iframeMain">
		<g:set var="entityName" value="${message(code: 'userJobDetail.label', default: 'UserJobDetail')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
			<g:render template="/layouts/person/setting_header"></g:render>
			<g:if test="${flash.message}">
			<div class="alert alert-warning" role="alert">${flash.message}</div>
			</g:if>
			
			<g:form  name ="search"  url ="[controller:'userJobDetail',action:'search']" >
		        <div class="box-inner">
		            <div data-original-title="" class="box-header well">
		           		 <ul class="nav pull-right">
		                      <g:link action="create"><div><i class="glyphicon glyphicon-plus"></i>创建工作</div></g:link>
		                 </ul>
		                 <div><i class="glyphicon glyphicon-th"></i>条件查询</div>
		            </div>
			        <div class="box-content">
			        	<ul class="nav nav-list" >
				        	<li >
				                 <div class="form-inline" style="margin-bottom:10px;margin-top:10px ">
				                      <div class="form-group" >
				                                    
				                           <div class="input-group">
				                                 <div class="input-group-addon">类型</div>
				                                 <g:select id="type" name="type" class="form-control" from="${com.iminer.biz.entity.job.JobCode.findAllByIsAvailable(1)}" optionKey="id" optionValue="name" noSelection="['':'请选择']" style="width:179px"/>
				                           </div>
				                      </div>
				                                  
				                      <div class="form-group">
				                           <div class="input-group">
				                                <div class="input-group-addon">办理人</div>
				                                <input type="text" name="name" id="name" class="form-control span3"  placeholder="name">
				                           </div>
				                      </div>
				                      <div class="form-group col">
				                           <div class="input-group" >
				                                <div class="input-group-addon">是否可用</div>
				                                <div style="width: 96px;vertical-align: "><input type="checkBox" id="isAvailable"   class="iphone-toggle" data-no-uniform="true" name="isAvailable" value="on" checked="checked"/></div>
		                                      	
				                           </div>
			                      	  </div>
									  <button class="btn btn-success" style="width:200px"><i class="glyphicon glyphicon-search"></i>查询</button>
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
						<th>事件标题</th>
						<th>类型</th>
						<th>主办人</th>
						<th class="text-center">操作</th>
					</tr>
				</thead>
				<tbody>
				<g:each in="${userJobDetailInstanceList}" status="i" var="userJobDetailInstance">
					<tr>
						<td>
							<g:link action="show" id="${userJobDetailInstance?.id}">
								${fieldValue(bean: userJobDetailInstance, field: "name")}
							</g:link>
						<td>
							<g:if test="${userJobDetailInstance?.type }">
								${com.iminer.biz.entity.job.JobCode.get(userJobDetailInstance?.type)?.name}
							</g:if>
						</td>
						<td>
							<g:if test="${userJobDetailInstance!=null }">
								<g:each in="${com.iminer.biz.entity.OperationPerson.findAll("from OperationPerson where id in (select personId from JobUser where jobId = :jobId)",[jobId:userJobDetailInstance?.id]) }" var="opi">
										<span style="margin-right:10px">${com.iminer.biz.entity.OperationPerson.get(opi.id).name}</span>
								</g:each>
							</g:if>
						</td>
						<td class="text-center">
							<g:form>
								<g:hiddenField name="id" value="${userJobDetailInstance.id}" />
								<g:hiddenField name="version" value="${userJobDetailInstance.version}" />
						      	<g:actionSubmit class="btn btn-info" action="edit" value="修改" />
						      	<g:actionSubmit action="deleted" class="btn btn-danger" value="停用"  onclick="return confirm('确认停用该事件?');" />
	                      	</g:form>
                      </td>
					</tr>
				</g:each>
				</tbody>
			</table>
			<g:if test="${userJobDetailInstanceTotal }">
				<div class="m-pageing">
					<bs:normalPageTag totalCount="${userJobDetailInstanceTotal }" offset="${params.offset }" max="${params.max }" />
				</div>
			</g:if>
			<g:else>
				<hr>
				<h1 class="text-center">没有数据</h1>
			</g:else>	
	</body>
</html>
