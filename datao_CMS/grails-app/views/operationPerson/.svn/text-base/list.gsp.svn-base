
<%@ page import="com.iminer.biz.entity.OperationPerson" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="iframeMain" />
		<script type="text/javascript">

			function ajaxGetBoxOfficeRankInfo(requestUrl){
					//获取相关查询条件
					var name = $("#name").val()
					var department = $("#department").val()
					$.ajax({
						type:"post",
						url:requestUrl,
						data:{name:name,department:department},
						success:function(data){
							$("#message").empty().append(data)
						}
					})
									
				}
			function getImgPath(params){

				if(params.indexOf("/people.png")==-1){
					$("#modelImg").attr("src",params)
					$('#myModal').modal('show')

					$('#modelImg').on('shown.bs.modal', function (e) {
							  // do something...
						 $(this).css({
							            "top": function () {
							                return ($("#myModal").height() - $(this).children().eq(0).height()-40) / 2 + "px";
							            }
			              });
					})
				}
			}
			
		</script>
	</head>
	
	<body>
		
        <g:formRemote  name ="search"  url ="[controller:'OperationPerson',action:'search']"  update ="[success:'message',failure:'error']" >
	        <div class="box-inner">
	            <div data-original-title="" class="box-header well">
	           		 <ul class="nav pull-right">
	                      <g:link action="create"><h2><i class="glyphicon glyphicon-plus"></i>新增员工</h2></g:link>
	                 </ul>
	                 <h2><i class="glyphicon glyphicon-th"></i>条件查询</h2>
	            </div>
		        <div class="box-content">
		        	<ul class="nav nav-list" >
			        	<li >
			                 <div class="form-inline" style="margin-bottom:10px;margin-top:10px">
			                      <div class="form-group" >
			                                    
			                           <div class="input-group">
			                                 <div class="input-group-addon">员工姓名</div>
			                                 <input type="text" name="name" id="name" class="form-control span3"  placeholder="name">
			                           </div>
			                                    
			                      </div>
			                                  
			                      <div class="form-group">
			                           <div class="input-group">
			                                <div class="input-group-addon">所属部门</div>
			                                <g:select name="department" id="department" class="form-control span3"  placeholder="department" from="${com.iminer.biz.entity.PrivilegeOrganization.findAllByPidLikeAndIsShowAndIsAvailableAndShowFname(com.iminer.biz.conf.OperationConfig.HIDE_IMINER_ID+'%', 1, 1,0)}" optionKey="id" optionValue="name" noSelection="['':'请选择']"/>
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
		<hr>
		<div id="message"><g:render template="table"></g:render>  </div>
		<div id="error"></div>
       
	</body>
</html>
