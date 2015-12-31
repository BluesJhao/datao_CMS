<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
	<meta name="layout" content="iframeMain" />
	<script src="${grailsApplication.config.grails.app.name}/js/echarts-all.js" type="text/javascript" charset="utf-8"></script>
	<title>数据分析统计系统</title>
</head>
<body>
<script>
var valueData=eval("${treedata}");
var idindex=new Number("${idindex}");
var options;
$(function(){
	$("#tMenu").hide();
	//$("#chartsInfo")
	var nodesize=[90,45]
	options = {
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
		            rootLocation: {x: 'center',y: 50}, // 根节点位置  {x: 100, y: 'center'}
		            nodePadding: 30,
		            layerpadding:50,
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
		                      color:'blue'
		                      },
		                      formatter: "{value}"
		                      
		                    },
		                    lineStyle: {
		                        color: '#48b',
		                        shadowColor: '#000',
		                        shadowBlur: 3,
		                        shadowOffsetX: 3,
		                        shadowOffsetY: 5,
		                        type: 'broken' // 'curve'|'broken'|'solid'|'dotted'|'dashed'
		                    }
		                },
		                emphasis: {
		                    label: {
		                        show: true
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
		console.log(params.data);
		$("#tMenu").show();
		var offset=$("#tMenu").offset();
		var value=params.value.children
		offset.top=params.event.offsetY;
		offset.left=params.event.offsetX+10;
		$("#tMenu").offset(offset);
		$("#m_p").unbind("click");
		$("#m_o").unbind("click");
		$("#m_d").unbind("click");
		$("#m_a").unbind("click");
		$("#m_p").click(function(){

		})
		$("#m_o").click(function(){

		})
		$("#m_d").click(params,function(value){
			

		//	var fjson=JSON.stringify(lineChart.getOption().series[0].data);
		//	console.log(fjson)
		//	var cv=JSON.stringify(params.value);
		//	console.log(cv)
			//fjson=fjson.replace(","+cv);
			//valueData=JSON.parse(fjson.replace(","+cv));
			//params.data.pop()
			console.log(params)
			//options.data=valueData;
			//lineChart.setOption(options);
			lineChart.refresh()
			
		})
		$("#m_a").click(value,function(value){
			idindex+=1
			value.data.push({name:'新节点'+idindex,children:[],id:idindex})
			lineChart.refresh()
		})
	});

})
var lineChart;
function addChild(){
	
}
function deleteChild(){
	
}
function findChild(id){
	
}

</script>
<div id="tMenu" class="bs-example" style="position: absolute;z-index: 1;">
    <div aria-label="Small button group" role="group" class="btn-group-vertical btn-group-sm">
      <button class="btn btn-default" id="m_p" type="button">关联人员</button>
      <button class="btn btn-default" id="m_o" type="button">关联机构</button>
      <button class="btn btn-default" id="m_d" type="button">删除该节点</button>
      <button class="btn btn-default" id="m_a" type="button">新增子节点</button>
    </div>
  </div>
	<div id="chartsInfo" style="height:1000px;width:100%"></div>
 </body>
</html>