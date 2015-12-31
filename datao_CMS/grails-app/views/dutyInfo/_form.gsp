<%@ page import="com.iminer.biz.entity.DutyInfo" %>
		<script type="text/javascript" src="${grailsApplication.config.grails.app.name}/js/common/visualdatabootstrap.js "></script>
		<script type="text/javascript">
			$(document).ready(function(){
				addVlue({obj_id:"name",obj_type:1,check_Max_size:255,check_Min_size:0});
				addVlue({obj_id:"enName",obj_type:1,check_Max_size:255,check_Min_size:0});
				
			    $("form").submit(function(){ 
				   if(!verify_data()){
					   return false;
					}   
			    });  
			}); 
		
		</script>

	  <div class="form-group has-feedback">
	    <label for="name" class="col-sm-2 control-label" style="margin-left: -7px">职务名称</label><span class="text-danger " style="height:40px; line-height:44px; float: left;">*</span>
	    <div class="col-sm-10" style="width:528px;">
	      	<g:textField name="name" id="name" maxlength="64" value="${dutyInfoInstance?.name}" placeholder="name" class="form-control" aria-describedby="nameStatus" />
			<span class="glyphicon form-control-feedback" aria-hidden="true"></span>
			<span id="nameStatus" class="sr-only"></span>
	    </div>
	  </div>
	  <div class="form-group has-feedback">
	    <label for="enName" class="col-sm-2 control-label" style="margin-left: -7px">英文名称</label><span class="text-danger " style="height:40px; line-height:44px; float: left;">*</span>
	    <div class="col-sm-10"  style="width:528px">
	      	<g:textField name="enName" id="enName" maxlength="64" value="${dutyInfoInstance?.enName}" placeholder="enName" class="form-control" aria-describedby="enNameStatus"/>
			<span class="glyphicon form-control-feedback" aria-hidden="true"></span>
			<span id="enNameStatus" class="sr-only"></span>
	    </div>
	  </div>
	  

  
  



	