<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
<meta name="layout" content="iframeMain" />
<script
	src="${grailsApplication.config.grails.app.name}/js/echarts-all.js"
	type="text/javascript" charset="utf-8"></script>
<title>数据分析统计系统</title>
</head>
<body>
	<script>

$(function(){
	//$("#chartsInfo")


	
	var nodesize=[90,45]
	var bmnodesize=[35,100]
	var valueData=eval(${treedata.toString()})
	var options = {
		    title : {
		        text: '艾漫数据',
		        subtext: ''
		    },
		    toolbox: {
		        show : false,
		        feature : {
		            mark : {show: true},
		            dataView : {show: true, readOnly: false},
		            restore : {show: true},
		            saveAsImage : {show: true}
		        }
		    },
		    calculable : false,

		    series : [
		        {
		            name:'组织机构',
		            type:'tree',
		            orient: 'vertical',  // vertical horizontal
		            rootLocation: {x: 'center',y: 40}, // 根节点位置  {x: 100, y: 'center'}
		            nodePadding: 0,
		            layerpadding:60,
		            roam:true,
		            symbolSize:nodesize,
		          	symbol:'rectangle',
		          	clickable:true,
		            itemStyle: {
		                normal: {
		                    label: {
		                      show: true,
		                      position:'inside',
		                      textStyle:{
		                      //fontStyle:'oblique',
		                      fontSize:13,
		                      fontWeight:'bold',
		                      color:'#F0FFF0'
		                      },
		                      formatter:function(value){console.log(value)}
		                      
		                    },
		                    lineStyle: {
		                        color: '#ccc',
		                        shadowColor: '#000',
		                        shadowBlur: 3,
		                        shadowOffsetX: 0,
		                        shadowOffsetY: 0,
		                        type: 'broken' // 'curve'|'broken'|'solid'|'dotted'|'dashed'
		                    },
							color:'#2894FF'
		                },
		                emphasis: {
		                	color:'#2894FF',
		                    barBorderWidth: 0,
		                    barBorderColor:'#2894FF',
		                    borderColor:'#2894FF',
		                    borderWidth:0,
		                    label: {
		                        show: false
		                    }
		                }
		            },
		            
		            data: valueData
		        }
		        ]
		};
	lineChart = echarts.init($("#chartsInfo").get(0));
	lineChart.setOption(options);
	lineChart.on(echarts.config.EVENT.CLICK,function(params){
		var type=params.data.type
		var cid=params.data.cid
		var url="${ grailsApplication.config.grails.app.name}/operationPerson/listOrganization";
		if(!cid){
			return;
		}
		if(type==1){
			//人员信息
			var url="${ grailsApplication.config.grails.app.name}/operationPerson/showperson";
		}else if(type==2){
			//部门信息
			var url="${ grailsApplication.config.grails.app.name}/operationPerson/listOrganization";
		}else{
			return;
		}
		$("#showcontent").empty()
		$.ajax({
			
			type:"post",
			url:url,
				//toDeleteArtist",
			data:{id:cid},
			success:function(data){
				if(data){
					$("#showcontent").empty().append(data)
					$('#myModal').modal('show')
					$('#myModal').on('shown.bs.modal', function (e) {
							  // do something...
						 $(this).children().eq(0).css({
							            "top": function () {
								                return ($(this).height() - $(this).children().eq(0).height()-40) / 2 + "px";
							            }
			              });
					})
				}
			}
		})

	});

})
var lineChart;

$(document).ready(function(){
	var requestUrl = "${grailsApplication.config.grails.app.name}/operationPerson/birthdayList"
	$.ajax({
		type:"post",
		url:requestUrl,
		success:function(data){
			$.each(data["relist"], function(i,item){
				$("#ol1").append("<li><span>"+item.name+"<span> <span >("+(new Date(item.birthday).getMonth()+1) +" 月 "+new Date(item.birthday).getDate()+"日 )</span></li>");
				
			})
			$.each(data["userJobDetailSpec"], function(i,item){
				$("#ol2").append("<li id='gg_"+item.id+"' ><span ><a href='javascript:void(0);' onclick='showgsgd("+item.id+")' >"+item.name+"</a><span></li>");
				
			})
		}
	})
})
function showgsgd(oid){
	cbtn("obtn1")
	ajaxRequest(oid,"gg_"+oid);
}
</script>
	<g:if test="${session?.user}">
		<g:render template="/layouts/homepage/setting_header" />
	</g:if>
	<div class="col-sm-12">
		<div id="chartsInfo" class="col-sm-9"	style="height: 1000px;"></div>
		<div class="col-sm-3" style="margin-top: 0;">
		<!-- 公告开始 -->
		<div  class="well top-block">
			<h3  class="text-center">公司公告</h3>
			<ol id="ol2" class="text-left"></ol>
		</div>
		<div class="well top-block">
		    <h3  class="text-center">本月寿星</h3>
			<ol id="ol1" class="text-left"></ol>
		</div>
			<g:render template="/layouts/homepage/setting_right_selection" />
		</div>
	</div>
	<div id="myModal" class="modal fade bs-example-modal-lg" tabindex="-1"	role="dialog" aria-labelledby="myLargeModalLabel">
		<div class="modal-dialog modal-lg" id="top_id">
			<div class="modal-content" id="showcontent"></div>
		</div>

	</div>
</body>
</html>