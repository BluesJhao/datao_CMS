<%@ page import="com.iminer.biz.entity.PrivilegeOrganization"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="iframeMain" />
<script type="text/javascript">
	function ajaxGetBoxOfficeRankInfo(requestUrl) {
		//获取相关查询条件
		var name = $("#name").val()
		var pname = $("#pname").val()
		var isShow = $("#isShow").is(':checked')
		$.ajax({
			type : "post",
			url : requestUrl,
			data : {
				name : name,
				pname : pname,
				isShow : isShow
			},
			success : function(data) {
				$("#message").empty().append(data)
			}
		})
	}
</script>
</head>
<body>
	<g:render template="/layouts/person/setting_header"></g:render>
	<g:formRemote name="search"
		url="[controller:'PrivilegeOrganization',action:'search']"
		update="[success:'message',failure:'error']">
		<div class="box-inner">
			<div data-original-title="" class="box-header well">
				<ul class="nav pull-right">
					<g:link action="create">
						<h2>
							<i class="glyphicon glyphicon-plus"></i>新增部门
						</h2>
					</g:link>
				</ul>
				<h2>
					<i class="glyphicon glyphicon-th"></i>条件查询
				</h2>
			</div>
			<div class="box-content">
				<ul class="nav nav-list">
					<li>
						<div class="form-inline"
							style="margin-bottom: 10px; margin-top: 10px">
							<div class="form-group">
								<div class="input-group">
									<div class="input-group-addon">部门名称</div>
									<input type="text" name="name" id="name"
										class="form-control span3" placeholder="name">
								</div>
							</div>
							<div class="form-group">
								<div class="input-group">
									<div class="input-group-addon">上级部门名称</div>
									<input type="text" name="pname" id="pname"
										class="form-control span3" placeholder="pname">
								</div>
							</div>
							<div class="form-group col">
								<div class="input-group">
									<div class="input-group-addon">是否可用</div>
									<div style="width: 96px; vertical-align:">
										<input type="checkBox" id="isShow" class="iphone-toggle"
											data-no-uniform="true" name="isShow"
											value="${params.isAvailable}" checked="checked" />
									</div>
								</div>
							</div>

							<button class="btn btn-success" style="width: 200px">
								<i class="glyphicon glyphicon-search"></i>查询
							</button>
						</div>
					</li>
				</ul>
			</div>
		</div>
		<br>
	</g:formRemote>
	<div id="message">
		<g:render template="table"></g:render>
	</div>
	<div id="error"></div>
</body>
</html>
