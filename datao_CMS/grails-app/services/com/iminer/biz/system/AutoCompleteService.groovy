package com.iminer.biz.system

import org.codehaus.groovy.grails.commons.GrailsApplication;

import grails.converters.JSON

import com.iminer.biz.entity.OperationPerson
import com.iminer.biz.ioperation.entity.ServerInfo

class AutoCompleteService {

    def serviceMethod() {

    }
	def autoCompleteService = {autoKey ,objectType->
		
		if(objectType=="120"){
		def select = {
						or{
							like("name", autoKey+'%')
							like("nameSpell", autoKey+'%')
						}
			maxResults(10)
		}
		def operationAll = OperationPerson.createCriteria().list(select)
		def completePerson = []
		def imgPath1 = ""
		for(OperationPerson op:operationAll){
			
			if(op.imgPath.indexOf("people.png")!=-1)
				imgPath1 = org.codehaus.groovy.grails.web.context.ServletContextHolder.servletContext.getContextPath()+"/images/people.png"
			else
				imgPath1 = org.codehaus.groovy.grails.web.context.ServletContextHolder.servletContext.getContextPath()+"/operationPerson/getPersonImage?id="+op.id
			completePerson += [id: op.id,name:op.name,image:imgPath1]
		}
		return completePerson as JSON
		}
		
		if(objectType=="121"){
			def select = {
							or{
								like("id", autoKey+'%')
							}
				maxResults(10)
			}
			def ServerAll = ServerInfo.createCriteria().list(select)
			def completeServer = []
			for(ServerInfo op:ServerAll){
				
				completeServer += [id: op.id,name: op.id]
			}
			return completeServer as JSON
			}
	}
}
