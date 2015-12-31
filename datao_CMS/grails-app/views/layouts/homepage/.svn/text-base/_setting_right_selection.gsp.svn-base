<!--我怎么办-->
<script type="text/javascript">
			$(document).ready(function(){
				$("#sButton").click(function(event){
						var type = $("#type").val()
						var event = $("#event").val()
						cbtn(showingid)
						var requestUrl = "${grailsApplication.config.grails.app.name}/userJobDetail/selection"
						$.ajax({
								type:"post",
								url:requestUrl,
								data:{type:type,event:event},
								success:function(data){
								var content ="";
								$.each(data, function(i,item){
								var temp = "<li ><a  id='ll_"+item.id+"' href='javascript:void(0);' onClick='ajaxRequest("+item.id+",\"ll_"+item.id+"\")' style='text-decoration:none'>"+item.name+"</a></li>";
									content += temp;
								});
								if(content==""){
									content="<div >没有搜索结果</div>"
								}else{
									content="<ul class='list-unstyled'>"+content+"</ul>"
								}
								var options={placement:"left",html:true}
								options.title="<button id='cbtn' type='button' class='close' aria-label='Close' onclick='cbtn(\"obtn1\")'><span aria-hidden='true'>&times;</span></button><h3 id='sec'>查询结果</h3>"
								options.content="<div style='max-height:400px;overflow-y:auto'>"+content+"</div>"
								showPopover("obtn1",options)
							}
					})
						
				});  
			})
			function showPopover(oid,options){
				var aobj=$("#"+oid)
				aobj.popover("destroy")
				aobj.popover(options)
				if(oid!="obtn1"){
					aobj.on('shown.bs.popover', function () {
						var thisid=$(this).attr("id")
						if(showingid!=""&&thisid!=showingid){
							$("#"+showingid).popover('hide');
						}
						showingid=thisid
					});
				}
				
				aobj.popover('show');
			}
			function cbtn(objid){
				$("#"+objid).popover('hide');
			}
			function ajaxRequest(index,clikcid){
				if(showingid==clikcid){
					return 
				}
				var requestUrl = "${grailsApplication.config.grails.app.name}/userJobDetail/ajaxShow";
					$.ajax({
						type:"post",
						url:requestUrl,
						data:{index:index},
						success:function(data){  
						var aobj=$("#"+clikcid)
						//配置信息
						var options={placement:"left",html:true}
						options.title="<button id='cbtn2' type='button' class='close' aria-label='Close' onclick='cbtn(\""+clikcid+"\")'><span aria-hidden='true'>&times;</span></button><h3 id='sec'>详细内容</h3>"
						options.content=data
						showPopover(clikcid,options)
					}
				});
					//$("#obtn2").popover('show');
			}
var showingid="";
</script>

<div class="well top-block" id="eventquery" >
	<div >
		<h3 >规章制度及业务办理</h3>
		<div id="obtn1" ></div>
		<div class="form-inline">
			<div class="form-group " >
				<g:select id="type" name="type"  class="form-control" from="${com.iminer.biz.entity.job.JobCode.findAllByIsAvailable(1)}" value="${com.iminer.biz.entity.job.JobCode.get(userJobDetailInstance?.type)?.name}" optionKey="id" optionValue="name" noSelection="['':'请选择']"/>
			</div>
			<div class="form-group " >
				<input type="email" class="form-control" id="event" placeholder="办理名称" >	
			</div>
			<div class="form-group " >
				<button type="button" id="sButton" class="btn btn-default"  >搜索</button>
			</div>
		</div>
	</div>
</div>

