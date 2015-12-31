<%@ page import="com.iminer.biz.entity.DutyInfo" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="iframeMain" />
		<script type="text/javascript" src="${grailsApplication.config.grails.app.name}/js/common/visualdatabootstrap.js "></script>
		<script type="text/javascript">

			function ajaxGetBoxOfficeRankInfo(requestUrl){
					//获取相关查询条件
					var name = $("#name").val()
					$.ajax({
						type:"post",
						url:requestUrl,
						data:{name:name},
						success:function(data){
							$("#message").empty().append(data)
						}
					})
									
			}
			
		</script>
		
	</head>
	<body onload="">
		<g:render template="/layouts/person/setting_header"></g:render>

        <g:formRemote  name ="search"  url ="[controller:'dutyInfo',action:'search']"  update ="[success:'message',failure:'error']" >
        	<div class="box-inner">
	            <div data-original-title="" class="box-header well">
	           		 <ul class="nav pull-right">
	                      <g:link action="create"><h2><i class="glyphicon glyphicon-plus"></i>新增职务</h2></g:link>
	                 </ul>
	                 <h2><i class="glyphicon glyphicon-th"></i>条件查询</h2>
	            </div>
		        <div class="box-content">
		        	<ul class="nav nav-list" >
			        	<li >
			                 <div class="form-inline" style="margin-bottom:10px;margin-top:10px">
			                                  
			                      <div class="form-group">
			                           <div class="input-group">
			                                <div class="input-group-addon">职务名称</div>
                                      		<input id="name" type="text" name="name" class="form-control span3" placeholder="Name">
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
        
		</g:formRemote>  
		<br>
		<div id="message">
			<g:render template="table"/>
		</div>
		<div id="error"></div>
		
			
	</body>
</html>
