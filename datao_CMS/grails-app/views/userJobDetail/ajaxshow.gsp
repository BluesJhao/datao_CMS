<div  >
<h4>概述:</h4>
<div style="max-height:200px; overflow-y: auto;" >${info.userJobDetail.jobContent}</div>
<g:if test="${info?.allAttach}">
	<h4 style='margin-top:20px'>附件:</h4>
	<g:each var="it" in="${info.allAttach}" status="i">
	<div>${it.name}[ <a href="${grailsApplication.config.grails.app.name}/userJobDetail/preview/${it.id}"  target='_blank'>预览</a>&nbsp;&nbsp;&nbsp;&nbsp;<a style='text-decoration:none' href="${grailsApplication.config.grails.app.name}/userJobDetail/download/${it.id}"  >下载</a>]</div>
	</g:each>
</g:if>
<h4 style='margin-top:20px'>主办人:</h4>
<g:each var="it" in="${info.allPerson}" status="i">
<div style='margin-left:55px;margin-top:10px'>${it.name}（${it.extensionNumber}）</div>
</g:each>
</div>