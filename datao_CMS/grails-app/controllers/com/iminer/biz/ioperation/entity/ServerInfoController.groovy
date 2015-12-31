package com.iminer.biz.ioperation.entity

import java.text.SimpleDateFormat
import org.springframework.dao.DataIntegrityViolationException

import com.iminer.biz.organization.util.ServerInfoTools;

class ServerInfoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [serverInfoInstanceList: ServerInfo.list(params), serverInfoInstanceTotal: ServerInfo.count()]
    }

    def create() {
		String id = ServerInfoTools.getOId()
		if(params.pid){
			params.pid = params.id
			id = "VI" + id
		}else{
			id = "PH" + id
		}
		params.id = id
		ServerInfo si = new ServerInfo(params)
		if(id.indexOf("PH")!=-1)
			si.setTypeId(112)
		else
			si.setTypeId(114)
		si.setId(id)
        [serverInfoInstance: si]
    }

    def save() {
		def op = com.iminer.biz.entity.OperationPerson.get(params."personId-objId")
		params.personId = op?.id
		params.onlineTime = new Date();
		
        def serverInfoInstance = new ServerInfo(params)
		serverInfoInstance.setId(params.id)
        if (!serverInfoInstance.save(flush: true)) {
            render(view: "create", model: [serverInfoInstance: serverInfoInstance])
            return
        }
		print serverInfoInstance.typeId
        flash.message = message(code: 'default.created.message', args: [message(code: 'serverInfo.label', default: 'ServerInfo'), serverInfoInstance.id])
        redirect(action: "show", id: serverInfoInstance.id)
    }

    def show(Long id) {
        def serverInfoInstance = ServerInfo.findById(params.id)
        if (!serverInfoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'serverInfo.label', default: 'ServerInfo'), params.id])
            redirect(action: "list")
            return
        }

        [serverInfoInstance: serverInfoInstance]
    }

    def edit(Long id) {
        def serverInfoInstance = ServerInfo.findById(params.id)
        if (!serverInfoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'serverInfo.label', default: 'ServerInfo'), params.id])
            redirect(action: "list")
            return
        }

        [serverInfoInstance: serverInfoInstance]
    }

    def update(Long id, Long version) {
        def serverInfoInstance = ServerInfo.findById(params.id)
        if (!serverInfoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'serverInfo.label', default: 'ServerInfo'), params.id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (serverInfoInstance.version > version) {
                serverInfoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'serverInfo.label', default: 'ServerInfo')] as Object[],
                          "Another user has updated this ServerInfo while you were editing")
                render(view: "edit", model: [serverInfoInstance: serverInfoInstance])
                return
            }
        }
		def op = com.iminer.biz.entity.OperationPerson.get(params."personId-objId")
		params.personId = op?.id
		params.onlineTime = new Date();
        serverInfoInstance.properties = params

        if (!serverInfoInstance.save(flush: true)) {
            render(view: "edit", model: [serverInfoInstance: serverInfoInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'serverInfo.label', default: 'ServerInfo'), serverInfoInstance.id])
        redirect(action: "show", id: serverInfoInstance.id)
    }

    def deleted(Long id) {
        def serverInfoInstance = ServerInfo.findById(params.id)
        if (!serverInfoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'serverInfo.label', default: 'ServerInfo'), params.id])
            redirect(action: "list")
            return
        }

        try {
            serverInfoInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'serverInfo.label', default: 'ServerInfo'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'serverInfo.label', default: 'ServerInfo'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
	def search = {
		Integer max->
		params.max = Math.min(max ?: 10, 100)
		print params
		def select = {
			if(params.houseId||params.id||params.modelId||params.type)
			{
				if(params.houseId){
					eq("houseId", Integer.parseInt(params.houseId))
				}
				if(params.id){
					eq("id", params.id)
				}
				if(params.modelId){
					eq("modelId", Integer.parseInt(params.modelId))
				}
				if(params.type){
//					eq("xxx", params.type)
				}
			}
		}
		def results = ServerInfo.createCriteria().list(params,select)
		render(view: "list",model:[serverInfoInstanceList: results,serverInfoInstanceTotal: results.totalCount])
		return
	}
}
