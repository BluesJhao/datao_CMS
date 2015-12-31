package com.iminer.biz.ioperation.entity

import org.springframework.dao.DataIntegrityViolationException

class DictionaryInfoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 8, 100)
        [dictionaryInfoInstanceList: DictionaryInfo.list(params), dictionaryInfoInstanceTotal: DictionaryInfo.count()]
    }

    def create() {
        [dictionaryInfoInstance: new DictionaryInfo(params)]
    }

    def save() {
		def exits = DictionaryInfo.findByIdentifier(params.identifier)
		if(!exits){
	        def dictionaryInfoInstance = new DictionaryInfo(params)
	        if (!dictionaryInfoInstance.save(flush: true)) {
	            render(view: "list", model: [dictionaryInfoInstance: dictionaryInfoInstance])
	            return
	        }
	
	        flash.message = message(code: 'default.created.message', args: [message(code: 'DictionaryInfo.label', default: 'DictionaryInfo'), dictionaryInfoInstance.id])
	        redirect(action: "list", id: dictionaryInfoInstance.id)
		}else{
			flash.message = "字典编号已存在"
			redirect(action: "list")
			return
		}
	}

    def show(Long id) {
        def dictionaryInfoInstance = DictionaryInfo.get(id)
        if (!dictionaryInfoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'DictionaryInfo.label', default: 'DictionaryInfo'), id])
            redirect(action: "list")
            return
        }

        [dictionaryInfoInstance: dictionaryInfoInstance]
    }

    def edit(Long id) {
        def dictionaryInfoInstance = DictionaryInfo.get(id)
        if (!dictionaryInfoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'DictionaryInfo.label', default: 'DictionaryInfo'), id])
            redirect(action: "list")
            return
        }

        [dictionaryInfoInstance: dictionaryInfoInstance]
    }

    def update(Long id, Long version) {
        def dictionaryInfoInstance = DictionaryInfo.get(Integer.parseInt(params.id))
        if (!dictionaryInfoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'DictionaryInfo.label', default: 'DictionaryInfo'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (dictionaryInfoInstance.version > version) {
                dictionaryInfoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'DictionaryInfo.label', default: 'DictionaryInfo')] as Object[],
                          "Another user has updated this DictionaryInfo while you were editing")
                render(view: "list", model: [dictionaryInfoInstance: dictionaryInfoInstance])
                return
            }
        }

        dictionaryInfoInstance.properties = params

        if (!dictionaryInfoInstance.save(flush: true)) {
            render(view: "list", model: [DictionaryInfoInstance: dictionaryInfoInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'DictionaryInfo.label', default: 'DictionaryInfo'), dictionaryInfoInstance.id])
        redirect(action: "list", id: dictionaryInfoInstance.id)
    }

    def deleted(Long id) {
        def dictionaryInfoInstance = DictionaryInfo.get(id)
        if (!dictionaryInfoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'DictionaryInfo.label', default: 'DictionaryInfo'), id])
            redirect(action: "list")
            return
        }

        try {
            dictionaryInfoInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'DictionaryInfo.label', default: 'DictionaryInfo'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'DictionaryInfo.label', default: 'DictionaryInfo'), id])
            redirect(action: "list", id: id)
        }
    }
	
	def search={
		Integer max->
		params.max = Math.min(max ?: 10, 100)
		
		def select = {
			if(params.name||params.identifier)
			{
				if(params.identifier){
					eq("identifier", params.identifier)
				}
				if(params.name){
					like("name", params.name+'%')
				}
			}
		}
		def results = DictionaryInfo.createCriteria().list(params,select)
		render(view: "list",model:[dictionaryInfoInstanceList: results,dictionaryInfoInstanceTotal: results.totalCount])
		return
	}
}
