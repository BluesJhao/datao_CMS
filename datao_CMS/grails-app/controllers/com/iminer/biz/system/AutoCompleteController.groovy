package com.iminer.biz.system

import com.iminer.biz.entity.OperationPerson;

import grails.converters.JSON

class AutoCompleteController {

    def index() { 
	}
	
	def autoComplete = {
		
		def acs = new AutoCompleteService();
		render acs.autoCompleteService(params.autoKey, params.objectType)
		 
	}
}
