<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
	<meta name="layout" content="iframeMain" />
	<title>数据分析统计系统</title>
</head>
<body>
	<g:render template="/layouts/homepage/setting_header"/>
	<div class="row">
        <div class="box col-md-12">
            <div class="box-inner">
                <div data-original-title="" class="box-header well">
                    <h2><i class="glyphicon glyphicon-calendar"></i> 代办工作</h2>

                    <div class="box-icon">
                        <a class="btn btn-setting btn-round btn-default" href="#"><i class="glyphicon glyphicon-cog"></i></a>
                        <a class="btn btn-minimize btn-round btn-default" href="#"><i class="glyphicon glyphicon-chevron-up"></i></a>
                        <a class="btn btn-close btn-round btn-default" href="#"><i class="glyphicon glyphicon-remove"></i></a>
                    </div>
                </div>
                <div class="box-content">
                    <div id="calendar" class="fc fc-ltr"></div>
                    <div class="clearfix"></div>
                </div>
                
            </div>
        </div>
    </div>
    <div class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" id="myModal">
  <div class="modal-dialog modal-sm">

	     <div class="progress">
	  <div class="progress-bar  progress-bar-info progress-bar-striped active" role="progressbar" aria-valuenow="45" aria-valuemin="0" aria-valuemax="100" style="width:100%">
	   <span class="sr-only">35% Complete (success)</span>
	  </div>
	</div>

  </div>
</div>
    <script>
    $(function(){
    	   var calendar = $('#calendar').fullCalendar({ 
    		   				header: {left: 'prev,next today',center: 'title',right: 'month,agendaWeek,agendaDay'},
        	   				monthNames: ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"],
    		                monthNamesShort: ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"],
    		                dayNames: ["周日", "周一", "周二", "周三", "周四", "周五", "周六"],
    		                dayNamesShort: ["周日", "周一", "周二", "周三", "周四", "周五", "周六"],
    		                today: ["今天"],
    		                firstDay: 1,
    		                buttonText: {today: '本月',month: '月',week: '周',day: '日', prev: '上一月',next: '下一月'},
    		                viewDisplay:function(view){getEventList(view)},
    		                loading: function(bool) {
    	                        if (bool) $('#myModal').modal('show');  
    	                        else $('#myModal').modal('hide');  
    	                    }


           });
    	 // $('#myModal').modal('show')
       })
 	function getEventList(params){
     	console.log(params)
     }
    </script>
</body>
</html>