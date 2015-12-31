<%@ page import="com.iminer.biz.ioperation.entity.DictionaryInfo" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="iframeMain">
		<g:set var="entityName" value="${message(code: 'dictionaryInfo.label', default: 'dictionaryInfo')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
		<script type="text/javascript" src="${grailsApplication.config.grails.app.name}/js/common/visualdatabootstrap.js "></script>
		<script type="text/javascript">
			$(document).ready(function(){
				$("#createDic").click(function(){
					value_date = [];
					value_date.push({obj_id:"identr",obj_type:1,obj_name:"字典编号"});
					value_date.push({obj_id:"dname",obj_type:1,obj_name:"字典名称"});
					$("#identr").val("");
					$("#dname").val("");
					$("#commt").val("");
					$("#identStatus").text("")
					$("#dnameStatus").text("")
					$("#identStatus").parents("div .form-group").removeClass("has-warning").removeClass("has-error").removeClass("has-success")
					$("#dnameStatus").parents("div .form-group").removeClass("has-warning").removeClass("has-error").removeClass("has-success")
					$('#Modal11').modal('show');
				});
				$(".createVal").click(function(){
					value_date = [];
					value_date.push({obj_id:"dicValue",obj_type:1,obj_name:"字典值"});
					createValue($(this));
				});
				$(".btnUp").click(function(){
					value_date = [];
					value_date.push({obj_id:"identr1",obj_type:1,obj_name:"字典编号"});
					value_date.push({obj_id:"dname1",obj_type:1,obj_name:"字典名称"});
					showOrEditorDic($(this));
				});
				$("#uform").submit(function(){ 
					if(!verify_data()){
						return false;
					}
			    }); 
				$("#dValue").submit(function(){ 
					if(!verify_data()){
						return false;
					}
			    }); 
				$("#uform1").submit(function(){ 
					if(!verify_data()){
						return false;
					}
			    }); 
				$("#flashMsg").delay(4000).slideUp(300);
			});
			function createValue(params){
				var id = params.attr("ids");
				var ident = params.attr("name")
				$("#dicIdDictionaryInfo").val(id);
				$("#identifier1").val(ident);
				$('#Modal12').modal('show');
			}
			function showOrEditorDic(params){
				$("#identr1").val(params.attr("identifier"));
				$("#dname1").val(params.attr("name"));
				$("#commt1").val(params.attr("comment"));
				$("#hin1").val(params.attr('ids'));
				$('#Modal13').modal('show');
			}
		</script>
	</head>
	<body>
			<g:if test="${flash.message}">
			<div class="alert alert-warning" role="alert" id="flashMsg">${flash.message}</div>
			</g:if>
			<g:form  name ="search"  url ="[controller:'dictionaryInfo',action:'search']">
		        <div class="box-inner">
		            <div data-original-title="" class="box-header well">
		           		 <ul class="nav pull-right">
		                      <div id="createDic"><i class="glyphicon glyphicon-plus"></i>新增字典</div>
		                 </ul>
		                 <div><i class="glyphicon glyphicon-th"></i>条件查询</div>
		            </div>
			        <div class="box-content">
			        	<ul class="nav nav-list" >
				        	<li >
				                 <div class="form-inline">
				                      <div class="form-group" >
				                                    
				                           <div class="input-group">
				                                 <div class="input-group-addon">字典名称</div>
				                                 <input type="text" name="name" id="name" class="form-control span3"  placeholder="name" maxlength="128">
				                           </div>
				                      </div>
				                      <div class="form-group">
				                           <div class="input-group">
				                                <div class="input-group-addon">字典编号</div>
				                                <input type="text" name="identifier" id="identifier" class="form-control span3"  placeholder="identifier" maxlength="128">
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
						<g:sortableColumn property="identifier" title="${message(code: 'dictionaryInfo.identifier.label', default: '字典编号')}" />
						<g:sortableColumn property="name" title="${message(code: 'dictionaryInfo.name.label', default: '字典名称')}" />
					<th>字典值</th>
					<th class="text-center">操作</th>
					</tr>
				</thead>
				<tbody>
				<g:each in="${dictionaryInfoInstanceList}" status="i" var="dictionaryInfoInstance">
					<tr>
						<td><span onclick="showOrEditorDic(this)" id="${dictionaryInfoInstance.id }" comment="${dictionaryInfoInstance.comment }" name="${dictionaryInfoInstance.name }" identifier="${dictionaryInfoInstance.identifier }">${fieldValue(bean: dictionaryInfoInstance, field: "identifier")}</span></td>
						<td>${fieldValue(bean: dictionaryInfoInstance, field: "name")}</td>
						<td>
							<div class="dropdown" >
							  <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true" style="width:350px">
							    ${com.iminer.biz.ioperation.entity.DictionaryCode.findByDicIdDictionaryInfo(dictionaryInfoInstance)?.dicValue}
							    <span class="caret" style="margin-right:20px;float:right"></span>
							  </button>
							  <ul class="dropdown-menu" aria-labelledby="dropdownMenu1" style="width:350px">
								  <g:each in="${com.iminer.biz.ioperation.entity.DictionaryCode.findAllByDicIdDictionaryInfo(dictionaryInfoInstance)}" var="ts">
										<li class="text-center"><span >${ts.dicValue}<g:link controller="dictionaryCode" action="deleted" id="${ts?.id}"><span style="margin-right:1px;float:right;" class="glyphicon glyphicon-minus-sign alert-danger"></span></g:link></span></li>
								  </g:each>
							    <li class="createVal text-center" ids="${dictionaryInfoInstance.id}" name="${dictionaryInfoInstance.identifier}"><i class="glyphicon glyphicon-plus-sign alert-success"></i><span class="alert-success">新增字典值</span></li>
							  </ul>
							</div>
						</td>
						<td class="text-center">
						  <div class="form-inline">
							<button  class="btnUp btn btn-info" ids="${dictionaryInfoInstance.id }" comment="${dictionaryInfoInstance.comment }" name="${dictionaryInfoInstance.name }" identifier="${dictionaryInfoInstance.identifier }">修改字典</button>
						    <g:link action="deleted" id="${dictionaryInfoInstance.id}" class="btn btn-danger" onclick="return confirm('确认删除字典信息?');">删除字典</g:link>
	                      </div>
                     	</td>
					</tr>
				</g:each>
				</tbody>
			</table>
		    <g:if test="${dictionaryInfoInstanceTotal }">
				<div class="m-pageing">
					<bs:normalPageTag totalCount="${dictionaryInfoInstanceTotal }" offset="${params.offset }" max="${params.max }" />
				</div>
			</g:if>
			<g:else>
				<hr><br>
				<h1 class="text-center">Ohch~没有数据!</h1>
			</g:else>	
			
		<div id="Modal11" class="modal fade">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h1 id="udic" class="text-center text-primary">新增字典</h1>
		      </div>
		      <div class="modal-body">
		        <form id="uform" action="${grailsApplication.config.grails.app.name}/dictionaryInfo/save" method="post" class="form col-md-12 center-block">
		          <div class="fg form-group has-feedback">
			        <input type="text" id ="identr" class="form-control" name="identifier" placeholder="字典编号" aria-describedby="identStatus"  maxlength="128">
		         	<span id="identStatus" class="sr-only"></span>
		          </div>
		          <div class="fg form-group has-feedback">
		            <input type="text" id="dname" class="form-control" name="name" placeholder="字典名称" aria-describedby="dnameStatus"  maxlength="128">
		          	<span id="dnameStatus" class="sr-only"></span>
		          </div>
		          <div class="form-group">
		            <input type="text" id="commt" class="form-control" name="comment" placeholder="说明" maxlength="255">
		          </div>
		          <input id="hin" name='id' type='hidden' value="">
		          <div class="form-group">
		            <button type="submit" id="updt" class="btn btn-primary btn-block">新增</button>
		          </div>
		        </form>
		      </div>
		      <div class="modal-footer">
		      </div>
		    </div>
		  </div>
		</div>
		<div id="Modal12" class="modal fade">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h1 class="text-center text-primary">新增字典值</h1>
		      </div>
		      <div class="modal-body">
		        <form id="dValue" action="${grailsApplication.config.grails.app.name}/dictionaryCode/save" method="post" class="form col-md-12 center-block">
		          <div class="form-group has-feedback">
		          	<input type="hidden" id="dicIdDictionaryInfo" name="dicIdDictionaryInfo">
		            <input type="text" class="form-control" id="identifier1" name="identifier" placeholder="字典编号" readonly aria-describedby="ident1Status"  maxlength="128">
		          	<span id="ident1Status" class="sr-only"></span>
		          </div>
		          <div class="form-group has-feedback">
		            <input type="text" id="dicValue" class="form-control" name="dicValue" placeholder="字典值" aria-describedby="valueStatus"  maxlength="255">
		          	<span id="valueStatus" class="sr-only"></span>
		          </div>
		          <div class="form-group">
		            <button type="submit" class="btn btn-primary btn-block">新增</button>
		          </div>
		        </form>
		      </div>
		      <div class="modal-footer">
		        
		      </div>
		    </div>
		  </div>
		</div>
		<div id="Modal13" class="modal fade">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h1 id="udic" class="text-center text-primary">修改字典</h1>
		      </div>
		      <div class="modal-body">
		        <form id="uform1" action="${grailsApplication.config.grails.app.name}/dictionaryInfo/update" method="post" class="form col-md-12 center-block">
		          <div class="form-group has-feedback">
			        <input type="text" id ="identr1" class="form-control" name="identifier" placeholder="字典编号" aria-describedby="identStatus1"  maxlength="128">
		         	<span id="identStatus1" class="sr-only"></span>
		          </div>
		          <div class="form-group has-feedback">
		            <input type="text" id="dname1" class="form-control" name="name" placeholder="字典名称" aria-describedby="dnameStatus1" maxlength="128">
		          	<span id="dnameStatus1" class="sr-only"></span>
		          </div>
		          <div class="form-group">
		            <input type="text" id="commt1" class="form-control" name="comment" placeholder="说明" maxlength="255">
		          </div>
		          <input id="hin1" name='id' type='hidden' value="">
		          <div class="form-group">
		            <button type="submit" id="updt1" class="btn btn-primary btn-block">更新</button>
		          </div>
		        </form>
		      </div>
		      <div class="modal-footer">
		      </div>
		    </div>
		  </div>
		</div>
	</body>
</html>
