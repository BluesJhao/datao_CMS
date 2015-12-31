<div class="box-inner">

<g:each in="${po}" status="j" var="data">
	<g:if test="${pmap.get(data.id.toString())!=null}">
	<div class="box-content" style="position:relative;">
		<g:if test="${j!=0}">
				<span class="notification green" style="left:0px;">${data.name}</span>
		</g:if>
	    <ul class="thumbnails gallery dashboard-list">
		<g:each in="${pmap.get(data.id.toString())}" status="i" var="it">
          <li style="width:224px">
              <img  alt="" style="width:64px;hight:64px;float:left;" onerror="this.src='${grailsApplication.config.grails.app.name}/images/people.png'" src="${grailsApplication.config.grails.app.name}/operationPerson/getPersonImage?id=${it?.id}">
              <strong>姓名:</strong>${it?.name}<br>
              <strong>生日:</strong>${it?.birthday?.format('MM.dd')}<br>
              <strong>职务:</strong>${it?.commonDuties}<br> 
              <strong>分机号:</strong>${it?.extensionNumber} 
          </li>
      	</g:each>
    	</ul>
    	</div>
	</g:if>
  </g:each>

</div>