<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
<meta name="layout" content="iframeMain" />
<title>数据分析统计系统</title>
	<script>
		//登录验证
		function loginValidate(){
			if($("#userName").val() == ""){
				$("#errorMessage").empty().append("用户名不能为空！").show()
				return false
			}
			$("#errorMessage").hide()
			if($("#password").val() == ""){
				$("#errorMessage").empty().append("密码不能为空！").show()
				return false
			}
			$("#errorMessage").hide()
			return true
		}
	</script>
</head>
<body>
	<div class="ch-container">
		<div class="row">
			<div class="col-md-12 center login-header">
				<h2>数据分析统计系统</h2>
			</div>
		</div>
		<div class="row">
			<div class="well col-md-5 center login-box">
				<div id="errorMessage" class="alert alert-info" style="<g:if test="${!flash?.message }">display:none</g:if>">
					<g:if test="${flash?.message}">
						${flash?.message }
					</g:if>
				</div>
				<form class="form-horizontal" action="${grailsApplication.config.grails.app.name}/login/index" method="post" onsubmit="return loginValidate()">
					<fieldset>
						<div class="input-group input-group-lg">
							<span class="input-group-addon">
								<i class="glyphicon glyphicon-user red"></i>
							</span>
							<input type="text" id="userName" name="userName" value="${params.userName }" class="form-control" placeholder="用户名">
						</div>
						<div class="clearfix"></div>
						<br>
						<div class="input-group input-group-lg">
							<span class="input-group-addon">
								<i class="glyphicon glyphicon-lock red"></i>
							</span>
							<input type="password" id="password" name="password" class="form-control" placeholder="密码">
						</div>
						<div class="clearfix"></div>

						<p class="center col-md-5">
							<button type="submit" class="btn btn-primary">登录</button>
						</p>
					</fieldset>
				</form>
			</div>
			<!--/span-->
		</div>
		<!--/row-->
	</div>
	<!--/fluid-row-->
</body>
</html>