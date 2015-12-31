package com.iminer.biz.entity

import grails.converters.JSON
import java.text.SimpleDateFormat
import org.springframework.dao.DataIntegrityViolationException

class DutyInfoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
		def dutlist=DutyInfo.list(params)
        [dutyInfoInstanceList: dutlist, dutyInfoInstanceTotal: dutlist?.totalCount]
    }

    def create() {
        [dutyInfoInstance: new DutyInfo(params)]
    }

    def save() {
        def dutyInfoInstance = new DutyInfo(params)
        if (!dutyInfoInstance.save(flush: true)) {
            render(view: "create", model: [dutyInfoInstance: dutyInfoInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'dutyInfo.label', default: 'DutyInfo'), dutyInfoInstance.id])
        redirect(action: "show", id: dutyInfoInstance.id)
    }

    def show(Long id) {
        def dutyInfoInstance = DutyInfo.get(id)
        if (!dutyInfoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'dutyInfo.label', default: 'DutyInfo'), id])
            redirect(action: "list")
            return
        }
		
        [dutyInfoInstance: dutyInfoInstance]
    }

    def edit(Long id) {
        def dutyInfoInstance = DutyInfo.get(id)
        if (!dutyInfoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'dutyInfo.label', default: 'DutyInfo'), id])
            redirect(action: "list")
            return
        }
		def create_Time =null
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		if(dutyInfoInstance.createTime)
			create_Time = format.format(dutyInfoInstance.createTime).split("-")
        [dutyInfoInstance: dutyInfoInstance,create_Time:create_Time]
    }

    def update(Long id, Long version) {
        def dutyInfoInstance = DutyInfo.get(id)
        if (!dutyInfoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'dutyInfo.label', default: 'DutyInfo'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (dutyInfoInstance.version > version) {
                dutyInfoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'dutyInfo.label', default: 'DutyInfo')] as Object[],
                          "Another user has updated this DutyInfo while you were editing")
                render(view: "edit", model: [dutyInfoInstance: dutyInfoInstance])
                return
            }
        }

        dutyInfoInstance.properties = params

        if (!dutyInfoInstance.save(flush: true)) {
            render(view: "edit", model: [dutyInfoInstance: dutyInfoInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'dutyInfo.label', default: 'DutyInfo'), dutyInfoInstance.id])
        redirect(action: "show", id: dutyInfoInstance.id)
    }

    def delete(Long id) {
        def dutyInfoInstance = DutyInfo.get(id)
        if (!dutyInfoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'dutyInfo.label', default: 'DutyInfo'), id])
            redirect(action: "list")
            return
        }

        try {
            dutyInfoInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'dutyInfo.label', default: 'DutyInfo'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'dutyInfo.label', default: 'DutyInfo'), id])
            redirect(action: "show", id: id)
        }
    }
	def search = {
		Integer max->
		params.max = Math.min(max ?: 10, 100)
		def select = {
			if(params.name)
			eq("name", params.name)
		}
		def results = DutyInfo.createCriteria().list(params,select)
			
		render view:"_table",model:[dutyInfoInstanceList: results,dutyInfoInstanceTotal: results.totalCount]

	}
}
