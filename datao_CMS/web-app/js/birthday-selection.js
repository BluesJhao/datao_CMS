$(document).ready(function(){
				var requestUrl = "${grailsApplication.config.grails.app.name}/operationPerson/birthdayList"
				$.ajax({
					type:"post",
					url:requestUrl,
					success:function(data){
						console.log(data)
						$.each(data, function(i,item){
							$(".ol").append("<li>"+item.name+" ("+(new Date(item.birthday).getMonth()+1) +" 月 "+new Date(item.birthday).getDate()+"日 )</li>");
							
						})
					}
				})
			})