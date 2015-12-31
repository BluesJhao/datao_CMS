<%@ page import="com.iminer.biz.entity.job.UserJobDetail"%>
<%@ page import="com.iminer.biz.entity.job.JobUser"%>
<script type="text/javascript"
	src="${grailsApplication.config.grails.app.name}/js/common/visualdatabootstrap.js "></script>
<script type="text/javascript"
	src="${ grailsApplication.config.grails.app.name}/js/autoComplete/autoComplete.js"></script>
<script type="text/javascript"
	src="${ grailsApplication.config.grails.app.name}/js/jobAttach/validFileFormat.js"></script>

<script type="text/javascript">
			$(document).ready(function(){
				movieInfoAutoComplete("personId",'image','objectTypeId');
				addVlue({obj_id:"type",obj_type:1});
				value_date.push({obj_id:"tSelect",obj_type:1,show_id:"personId",obj_name:"主办人"});
				addVlue({obj_id:"jobContent",obj_type:1,obje_message:"事件内容"});
				$("form").submit(function(){ 
					   if(!verify_data()){
						   return false;
						}
					   var list = [];
					   $("#select").children().each(function(){
						   list.push($(this).attr("name"));
						});
					    $("#personId-objId").val(list);
					   var file =  $("input[name='jobAttach']");
					   var vFile = null;
					   for (index in file){
						   vFile =  $(file[index]).val();
						   if(vFile!=""&&vFile!=null){
					    		if(!validFileFormat(vFile,"jobAttach"))
						    		return false;
						    }
						}
				});	
				$("#sub").click(function() {
					var pid = $("#personId-objId").val();
					var pv = $("#personId").val();
					var plist = [];
					$("#select").children().each(function(){
						plist.push($(this).attr("name"));
					});
					if(pid!=null&&pid!=""&&$.inArray(pid,plist)==-1){
						$("#select").append("<span name='"+pid+"' class='btn btn-default' style='margin-right:5px'>"+pv+"<a class='sdel' onclick='sDelete(this)'><span style='margin-top:0;margin-right:0'>&times;</span></a></span>");
						show_normalValue("personId","personId");
						$("#tSelect").val(pid);
					}
					$("#personId").val(null);
				});

				$("#add").click(function() {
					$("#addInput").append("<input type='file' name='jobAttach' class='form-control' style='width:85%'/>");
				});
				}); 
				function sDelete(param){
					$(param).parent().remove();
					if($(".sdel").length < 1){
						$("#tSelect").val(null)
						$("#personId-objId").val(null);
					}
				}
				function aDelete(param){
					if(!confirm('确认删除附件?'))
						return ;
					var id = $(param).attr("id")
					var path = $(param).attr("name")
					$.ajax({
						type : "post",
						url : "${grailsApplication.config.grails.app.name}/UserJobDetail/ajaxDel",
						data : {
							id : id,
							path : path,
						},
						success : function(data) {
							$(param).parent().remove();
						}
					})
				}
				
		</script>
<div class="col-md-6 ">
	<div class="form-group has-feedback">
		<label for="name" class="col-sm-3 control-label"> <g:message
				code="userJobDetail.name.label" default="标题" />
		</label>
		<div class="col-sm-9">
			<g:textField class="form-control" name="name" maxlength="64"
				value="${userJobDetailInstance?.name}" placeholder="title" />
			<br>
		</div>
	</div>
	<div class="form-group has-feedback">
		<label for="type" class="col-sm-3 control-label"><span
			class="text-danger "
			style="height: 20px; line-height: 24px; float: right;">*</span> <g:message
				code="userJobDetail.type.label" default="类型" /> </label>
		<div class="col-sm-9">
			<g:if test="${userJobDetailInstance?.type }">
				<g:select id="type" name="type" class="form-control"
					from="${com.iminer.biz.entity.job.JobCode.findAllByIsAvailable(1)}"
					value="${com.iminer.biz.entity.job.JobCode.get(userJobDetailInstance?.type)?.name}"
					optionKey="id" optionValue="name" aria-describedby="typeStatus" />
				<br>
			</g:if>
			<g:else>
				<g:select id="type" name="type" class="form-control"
					from="${com.iminer.biz.entity.job.JobCode.findAllByIsAvailable(1)}"
					optionKey="id" optionValue="name"
					aria-describedby="organizationStatus" placeholder="type"
					aria-describedby="typeStatus" />
				<br>
			</g:else>
			<span class="glyphicon form-control-feedback" aria-hidden="true"></span>
			<span id="typeStatus" class="sr-only"></span>
		</div>
	</div>
	<div class="form-group has-feedback">
		<label for="personId" class="col-sm-3 control-label"><span
			class="text-danger "
			style="height: 20px; line-height: 24px; float: right;">*</span> <g:message
				code="userJobDetail.operationPerson.label" default="主办人" /> </label> <input
			type="hidden" id="objectTypeId" value="120"> <input
			type="hidden" id="personId-objId" name="personId-objId" />
		<div class="form-inline">
			<div class="col-sm-9">
				<input name="personId" id="personId" maxlength="64"
					placeholder="creater" class="form-control"
					aria-describedby="personIdStatus" style='width: 75%'/> <input type="button"
					name="sub" id="sub" value="添加" class="form-control btn-primary" />
				<span class="glyphicon form-control-feedback" aria-hidden="true"></span>
				<span id="personIdStatus" class="sr-only"></span>
				<g:if test="${userJobDetailInstance?.id !=null }">
					<input type="hidden" name="tSelect" id="tSelect"
						value="${com.iminer.biz.entity.job.JobUser.findByJobId(userJobDetailInstance?.id) }">
					<div id="select" style="margin-top: 10px">
						<g:each
							in="${com.iminer.biz.entity.OperationPerson.findAll("from OperationPerson where id in (select personId from JobUser where jobId = :jobId)",[jobId:userJobDetailInstance?.id]) }"
							var="opi">
							<span name=${opi.id} class='btn btn-default'
								style='margin-right: 5px'> ${opi.name }<a class="sdel"
								onclick="sDelete(this)"><span
									style="margin-top: 0; margin-right: 0">&times;</span></a>
							</span>
						</g:each>
					</div>
				</g:if>
				<g:else>
					<input type="hidden" name="tSelect" id="tSelect">
					<div id="select" style="margin-top: 10px"></div>
				</g:else>
			</div>
		</div>
	</div>
</div>
<div class="col-md-6">
	<div class="form-group has-feedback">
		<label for="jobContent" class="col-sm-3 control-label"><span
			class="text-danger "
			style="height: 20px; line-height: 24px; float: right;">*</span> <g:message
				code="userJobDetail.jobContent.label" default="事件内容" /> </label>
		<div class="col-sm-9">
			<g:textArea class="form-control" name="jobContent"
				value="${userJobDetailInstance?.jobContent}" cols="40" rows="5"
				placeholder="content..." aria-describedby="contentStatus" />
			<br> <span class="glyphicon form-control-feedback"
				aria-hidden="true"></span> <span id="contentStatus" class="sr-only"></span>
		</div>
	</div>
	<div class="form-group has-feedback">
		<label for="jobAttach" class="col-sm-3 control-label"> <g:message
				code="userJobDetail.jobAttach.label" default="上传附件" />
		</label>
		<div class="col-sm-9">
			<div id="addInput">
				<div class="form-inline">
					<input type="file" name="jobAttach" class="form-control"
						aria-describedby="jobAttachStatus" style='width: 85%' />
					<div id="add" class="btn btn-info">
						添加
					</div>
				</div>
			</div><br>
			<span class="glyphicon form-control-feedback" aria-hidden="true"></span>
			<span id="jobAttachStatus" class="sr-only"></span>
		</div>
	</div> 
	<g:if test="${userJobDetailInstance?.id}">
	<div class="col-sm-3"></div>
		<div class="col-sm-9">
			<g:each
				in="${com.iminer.biz.entity.job.Attach.findAllByJobId(userJobDetailInstance.id)}"
				var="is">
				<span name=${is.id} class='btn btn-default'
					style='margin-right: 5px'> ${is.name+"."+is.fileSuffix}
					<a class="adel" onclick="aDelete(this)" id="${is.id}" name="${is.path }">
					<span style="margin-top: 0; margin-right: 0">&times;</span></a>
				</span>
			</g:each>
		</div>
	</g:if>
</div>

