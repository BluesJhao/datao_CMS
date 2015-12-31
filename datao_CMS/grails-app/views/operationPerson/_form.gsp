<%@ page import="com.iminer.biz.entity.OperationPerson" %>
<script type="text/javascript" src="${grailsApplication.config.grails.app.name}/js/common/visualdatabootstrap.js "></script>
<script type="text/javascript" src="${grailsApplication.config.grails.app.name}/js/common/change.js "></script>
<script type="text/javascript" src="${grailsApplication.config.grails.app.name}/js/common/solarLunar.js "></script>
<script type="text/javascript" src="${grailsApplication.config.grails.app.name}/js/autoComplete/autoComplete.js"></script>
						
		<script type="text/javascript">
			$(document).ready(function(){
				movieInfoAutoComplete("tutorId","image","objectTypeId");
				addVlue({obj_id:"VImgPath",obj_type:1});
				addVlue({obj_id:"name",obj_type:1,check_Max_size:32,check_Min_size:0});
				addVlue({obj_id:"idNumber",obj_type:32});
				addVlue({obj_id:"employeeId",obj_type:1,check_Max_size:10,check_Min_size:0});
				addVlue({obj_id:"organizationId",obj_type:1});
				value_date.push({obj_id:"birthday",obj_type:1,obj_name:"生日"});
				addVlue({obj_id:"qq",obj_type:128});
				addVlue({obj_id:"email",obj_type:3});
				value_date.push({obj_id:"employedDate",obj_type:1,obj_name:"入职日期"});
				addVlue({obj_id:"commonDuties",obj_type:1,check_Max_size:20,check_Min_size:0,isblur:false});
				addVlue({obj_id:"extensionNumber",obj_type:128,isblur:true});
			    $("form").submit(function(){ 
			    	var img = $("#imgPath1").val();
			    	if(img!=""&&img!=null){
			    		$("#VImgPath").val(img);
			    		if(!validImg("VImgPath"))
				    		return false;
				    }if(!verify_data()){
					   return false;
					}if(!validDate("birthday")||!validDate("lunarBirthday")||!validDate("employedDate")||!validDate("departureDate")){
				   		return false;
				   	}
					
			    }); 
			})
		</script>
<hr>
<div class="row-fluid">
  <div class="col-md-12">
    <div class="form-group has-feedback" style="margin-left: 40px">
		<div class="media col-sm-1" style="margin-left: -7px">
		  <div class="media-left media-middle" >
		     <img class="media-object" alt="" style="width:64px;hight:64px;" onerror="this.src='${grailsApplication.config.grails.app.name}/images/people.png'" src="${grailsApplication.config.grails.app.name}/operationPerson/getPersonImage?id=${operationPersonInstance?.id}">
		  </div>
		</div>
	    <label for="VImgPath" class="control-label" style="display:none" >照片</label><span class="text-danger " style="height:40px; line-height:44px; float: left;">*</span>
	    <div class="col-sm-11" >
	    	<g:hiddenField id="VImgPath" name="VImgPath" value="${operationPersonInstance?.imgPath}"  aria-describedby="fileStatus"/>
	    	<input type="file" name="imgPath1" id="imgPath1" placeholder="imgPath" value="${operationPersonInstance?.imgPath}" class="form-control" />
			<span class="glyphicon form-control-feedback" aria-hidden="true"></span>
			<span id="fileStatus" class="sr-only"></span>

	    </div>
	 </div>
  </div>
  <div class="col-md-6">
  	
	 <div class="form-group has-feedback">
	    <label for="name" class="col-sm-3 control-label" style="margin-left: -7px">员工姓名</label><span class="text-danger " style="height:40px; line-height:44px; float: left;">*</span>
	    <div class="col-sm-9" >
			<g:textField name="name" maxlength="20" value="${operationPersonInstance?.name}" placeholder="Name" class="form-control" aria-describedby="nameStatus" onChange="changeName(this.value)"/>
			<span class="glyphicon form-control-feedback" aria-hidden="true"></span>
			<span id="nameStatus" class="sr-only"></span>

	    </div>
	 </div>
	 
	 <div class="form-group has-feedback">
	  	<label for="nickName" class="col-sm-3 control-label">昵称</label>
	    <div class="col-sm-9" >
			<g:textField name="nickName" maxlength="20" value="${operationPersonInstance?.nickName}" placeholder="Nick Name" class="form-control" aria-describedby="nickNameStatus"/>
	 		<span class="glyphicon form-control-feedback" aria-hidden="true"></span>
			<span id="nickNameStatus" class="sr-only"></span>	  
	    </div>
	 </div>
	  
	 <div class="form-group has-feedback">
	  	<label for="idNumber" class="col-sm-3 control-label">员工身份证</label>
	    <div class="col-sm-9" >
			<g:textField name="idNumber" maxlength="20" value="${operationPersonInstance?.idNumber}" placeholder="Id Number" class="form-control" aria-describedby="idNumberStatus"/>
	 		<span class="glyphicon form-control-feedback" aria-hidden="true"></span>
			<span id="idNumberStatus" class="sr-only"></span>	  
	    </div>
	 </div>
	 
	 <div class="form-group has-feedback">
	  	<label for="employeeId" class="col-sm-3 control-label" style="margin-left: -7px">员工编号</label><span class="text-danger " style="height:40px; line-height:44px; float: left;">*</span>
	    <div class="col-sm-9" >
			<g:textField name="employeeId" maxlength="20" value="${operationPersonInstance?.employeeId}" placeholder="Employee Id" class="form-control" aria-describedby="employeeStatus"/>
			<span class="glyphicon form-control-feedback" aria-hidden="true"></span>
			<span id="employeeStatus" class="sr-only"></span>
	    </div>
	 </div>

	 <div class="form-group has-feedback">
	  	<label for="organizationId" class="col-sm-3 control-label" style="margin-left: -7px">所属部门</label><span class="text-danger " style="height:40px; line-height:44px; float: left;">*</span>
	    <div class="col-sm-9" >
				<g:select id="organizationId" name="organizationId" class="form-control" from="${com.iminer.biz.entity.PrivilegeOrganization.findAllByPidLikeAndIsShowAndIsAvailable(com.iminer.biz.conf.OperationConfig.HIDE_IMINER_ID+'%', 1, 1)}" value="${operationPersonInstance?.organizationId?.id}" optionKey="id" optionValue="name" aria-describedby="organizationStatus"/>
	    		<span class="glyphicon form-control-feedback" aria-hidden="true"></span>
				<span id="organizationStatus" class="sr-only"></span>
	    </div>
	 </div>

	<div class="form-group has-feedback">
	  	<label for="birthday" class="col-sm-3 control-label" style="margin-left: -7px">公历生日</label><span class="text-danger " style="height:40px; line-height:44px; float: left;">*</span>
	  	
	  	<div class="col-sm-9 form-inline" >
	  			<g:textField name="birthday" id="birthday" maxlength="64" value="${operationPersonInstance?.birthday?.format('yyyy-MM-dd')}" placeholder="Birthday"  class="form-control" style="width:398px" aria-describedby="birthdayStatus" onChange="change1();CalConv(0);"/>
				<span class="glyphicon form-control-feedback" aria-hidden="true"></span>
				<span id="birthdayStatus" class="sr-only"></span>
		</div>
	 </div>
	 
	 <div class="form-group has-feedback">
	  	<label for="lunarBirthday" class="col-sm-3 control-label">农历生日</label>
	  	
	  	<div class="col-sm-9 form-inline" >
	  			<g:textField name="lunarBirthday" id="lunarBirthday" maxlength="64" value="${operationPersonInstance?.lunarBirthday?.format('yyyy-MM-dd')}" placeholder="lunarBirthday"  class="form-control" style="width:398px" aria-describedby="lunarBirthdayStatus" onChange="CalConv(1);"/>
				<span class="glyphicon form-control-feedback" aria-hidden="true"></span>
				<span id="lunarBirthdayStatus" class="sr-only"></span>
		</div>
	 </div>

	<div class="form-group has-feedback">
	  	<label for="gender" class="col-sm-3 control-label" style="margin-left: -7px">性别</label><span class="text-danger " style="height:40px; line-height:44px; float: left;">*</span>
	    <div class="col-sm-9" >
	    	<select name="gender" class="form-control">
	    		<g:if test="${operationPersonInstance?.gender==2}">
		    		<option value="2" selected="selected">女</option>
		    		<option value="1">男</option>
	    		</g:if>
	    		<g:else>
	    			<option value="1" selected="selected">男</option>
		    		<option value="2">女</option>
	    		</g:else>
	    		
	    	</select>
			
		</div>
	 </div>
	 
	 <div class="form-group">
	  	<label for="constellation" class="col-sm-3 control-label">星座</label>
	    <div class="col-sm-9" >
	    	<select name="constellation" id="constellation" class="form-control">
				<g:if test="${operationPersonInstance?.constellation }">
					<option value="${operationPersonInstance.constellation}" selected="selected">${(com.iminer.biz.Category.findById(operationPersonInstance.constellation))?.name}</option>
				</g:if>
				<g:each in="${com.iminer.biz.Category.findAllByPid(804)}" var="ts">
					<option value="${ts.id}">${ts.name}</option>
				</g:each>
			</select>
	    </div>
	 </div>
	 
	 <div class="form-group has-feedback">
	  	<label for="qq" class="col-sm-3 control-label">QQ</label>
	    <div class="col-sm-9" >
	    	<g:textField name="qq" maxlength="20" value="${operationPersonInstance?.qq}" placeholder="QQ" class="form-control" aria-describedby="qqStatus"/>
	    	<span class="glyphicon form-control-feedback" aria-hidden="true"></span>
			<span id="qqStatus" class="sr-only"></span>	
	    </div>
	 </div>
	 
	
  </div>
  <div class="col-md-6">
  	
  	 <div class="form-group has-feedback">
	  	<label for="email" class="col-sm-3 control-label" style="margin-left: -7px">Email</label><span class="text-danger " style="height:40px; line-height:44px; float: left;">*</span>
	    <div class="col-sm-9">
			<g:textField name="email" maxlength="50" value="${operationPersonInstance?.email}" placeholder="Email" class="form-control" aria-describedby="emailStatus"/>
			<span class="glyphicon form-control-feedback" aria-hidden="true"></span>
			<span id="emailStatus" class="sr-only"></span>	   
	    </div>
	 </div>
	 
  	<div class="form-group">
	  	<label for="nameSpell" class="col-sm-3 control-label">姓名拼写</label>
	    <div class="col-sm-9" >
	    	<select id="nameSpell" name="nameSpell" class="form-control">
		    	<g:if test="${operationPersonInstance?.nameSpell}">
		    		<option value="${operationPersonInstance?.nameSpell}">${operationPersonInstance?.nameSpell}</option>
		    	</g:if>
				<option></option>
				
			</select>
	    </div>
	 </div>
  	
	 <div class="form-group">
	  	<label for="mealId" class="col-sm-3 control-label">餐卡编号</label>
	    <div class="col-sm-9">
			<g:textField name="mealId" maxlength="64" value="${operationPersonInstance?.mealId}" placeholder="Meal Id" class="form-control"/>
	    </div>
	 </div>
	 
	 <div class="form-group">
	  	<label for="lockId" class="col-sm-3 control-label">门禁卡编号</label>
	    <div class="col-sm-9" >
			<g:textField name="lockId" maxlength="64" value="${operationPersonInstance?.lockId}" placeholder="Lock Id" class="form-control"/>
			<span class="glyphicon form-control-feedback"></span>
	    </div>
	 </div>
  	
  	<div class="form-group has-feedback">
	  	<label for="employedDate" class="col-sm-3 control-label" style="margin-left: -7px">入职日期</label><span class="text-danger " style="height:40px; line-height:44px; float: left;">*</span>
	  	<div class="col-sm-9 form-inline" >
				<g:textField name="employedDate" id="employedDate" maxlength="64" value="${operationPersonInstance?.employedDate?.format('yyyy-MM-dd')}" placeholder="employedDate"  class="form-control" style="width:398px" aria-describedby="employedDateStatus"/>					
				<span class="glyphicon form-control-feedback" aria-hidden="true"></span>
				<span id="employedDateStatus" class="sr-only"></span>	  
		</div>
	 </div>
	  	
  	<div class="form-group has-feedback">
	  	<label for="departureDate" class="col-sm-3 control-label">离职日期</label>
	  	<div class="col-sm-9 form-inline" >
	  			<g:textField name="departureDate" id="departureDate" maxlength="64" value="${operationPersonInstance?.departureDate?.format('yyyy-MM-dd')}" placeholder="departureDate"  class="form-control" style="width:398px" aria-describedby="departureDateStatus"/>
				<span class="glyphicon form-control-feedback" aria-hidden="true"></span>
				<span id="departureDateStatus" class="sr-only"></span>
		</div>
	</div>
  	
  	<div class="form-group">
	  	<label for="ana" class="col-sm-3 control-label">语录</label>
	    <div class="col-sm-9" >
			<g:textField class ="form-control" name="ana" maxlength="512" value="${operationPersonInstance?.ana}" placeholder="Ana" />
	    </div>
	</div>
  	
  	<div class="form-group has-feedback">
	  	<label for="commonDuties" class="col-sm-3 control-label" style="margin-left: -7px">常用职务</label><span class="text-danger " style="height:40px; line-height:44px; float: left;">*</span>
	    <div class="col-sm-9">
	    	<g:textField class ="form-control" name="commonDuties" id="commonDuties" maxlength="20" value="${operationPersonInstance?.commonDuties}" placeholder="Summarize" aria-describedby="commonDutiesDateStatus"/>
	    	<span class="glyphicon form-control-feedback" aria-hidden="true"></span>
			<span id="commonDutiesDateStatus" class="sr-only"></span>
	    </div>
	</div>
  	
  	<div class="form-group has-feedback">
	  	<label for="extensionNumber" class="col-sm-3 control-label">分机号</label>
	    <div class="col-sm-9" >
			<g:textField name="extensionNumber" maxlength="20" value="${operationPersonInstance?.extensionNumber}" placeholder="Extension Number" class="form-control" aria-describedby="extensionNumberDateStatus"/>
	    	<span class="glyphicon form-control-feedback" aria-hidden="true"></span>
			<span id="extensionNumberDateStatus" class="sr-only"></span>
	    </div>
	 </div>
	
	<div class="form-group">
	  	<label for="tutorId" class="col-sm-3 control-label">导师</label>
	  	<input type="hidden" id="objectTypeId" value="120">
	    <input type="hidden" id="tutorId-objId" name="tutorId-objId">
	    <div class="col-sm-9" >
	    	
	    	<g:textField name="tutorId" id="tutorId" maxlength="64" value="${(com.iminer.biz.entity.OperationPerson.get(operationPersonInstance.tutorId))?.name}" placeholder="leader" class="form-control" />
	    </div>
	</div>
  </div>
</div>

