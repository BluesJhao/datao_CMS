package com.iminer.biz.entity

import java.awt.print.Printable;

import org.springframework.dao.DataIntegrityViolationException

import com.iminer.biz.conf.OperationConfig;
import com.iminer.biz.organization.util.*

class PrivilegeOrganizationController {

	static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

	def index() {
		redirect(action: "list", params: params)
	}

	def list(Integer max) {
		params.max = Math.min(max ?: 5, 100)
		def count = PrivilegeOrganization.findAllByIsAvailableAndIsShow(true,true).size()
		def list = PrivilegeOrganization.findAllByIsAvailableAndIsShow(true,true,params)
		params.isAvailable = true
		[privilegeOrganizationInstanceList:list, privilegeOrganizationInstanceTotal: count]
	}

	def create() {
		if(params.id){
			params.pid = params.id
		}else{
			params.pid= OperationConfig.HIDE_IMINER_ID;
		}
		params.fName = (PrivilegeOrganization.findById(params.pid))?.name
		[privilegeOrganizationInstance: new PrivilegeOrganization(params)]
	}

	def save() {
		def id = OrganizationTools.getCid(params.pid)
		OperationPerson dd = OperationPerson.get(params."leaderIdOperationPerson-objId")
		params.leaderIdOperationPerson=dd
		def privilegeOrganizationInstance = new PrivilegeOrganization(params);
		privilegeOrganizationInstance.setId(id)
		privilegeOrganizationInstance.setIsAvailable(true)
		privilegeOrganizationInstance.setIsShow(true)
		if(!privilegeOrganizationInstance.pid)
			privilegeOrganizationInstance.pid = OperationConfig.HIDE_IMINER_ID;
		if (!privilegeOrganizationInstance.save(flush: true)) {
			render(view: "create", model: [privilegeOrganizationInstance: privilegeOrganizationInstance])
			return
		}

		flash.message = message(code: 'default.created.message', args: [message(code: 'privilegeOrganization.label', default: 'PrivilegeOrganization'), privilegeOrganizationInstance.id])
		redirect(action: "show", id: privilegeOrganizationInstance.id)
	}

	def show() {
		def privilegeOrganizationInstance = PrivilegeOrganization.get(params.id)
		if (!privilegeOrganizationInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'privilegeOrganization.label', default: 'PrivilegeOrganization'), params.id])
			redirect(action: "list")
			return
		}

		[privilegeOrganizationInstance: privilegeOrganizationInstance]
	}

	def edit() {
		def privilegeOrganizationInstance = PrivilegeOrganization.get(params.id)
		if (!privilegeOrganizationInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'privilegeOrganization.label', default: 'PrivilegeOrganization'), params.id])
			redirect(action: "list")
			return
		}

		[privilegeOrganizationInstance: privilegeOrganizationInstance,name:privilegeOrganizationInstance.name]
	}

	def update(Long version) {
		def privilegeOrganizationInstance = PrivilegeOrganization.get(params.id)
		if (!privilegeOrganizationInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'privilegeOrganization.label', default: 'PrivilegeOrganization'), id])
			redirect(action: "list")
			return
		}

		if (version != null) {
			if (privilegeOrganizationInstance.version > version) {
				privilegeOrganizationInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
						  [message(code: 'privilegeOrganization.label', default: 'PrivilegeOrganization')] as Object[],
						  "Another user has updated this PrivilegeOrganization while you were editing")
				render(view: "edit", model: [privilegeOrganizationInstance: privilegeOrganizationInstance])
				return
			}
		}
		OperationPerson dd = OperationPerson.get(params."leaderIdOperationPerson-objId")
		params.leaderIdOperationPerson=dd
		privilegeOrganizationInstance.properties = params

		if (!privilegeOrganizationInstance.save(flush: true)) {
			render(view: "edit", model: [privilegeOrganizationInstance: privilegeOrganizationInstance])
			return
		}

		flash.message = message(code: 'default.updated.message', args: [message(code: 'privilegeOrganization.label', default: 'PrivilegeOrganization'), privilegeOrganizationInstance.id])
		redirect(action: "show", id: privilegeOrganizationInstance.id)
	}

	def deleted() {
		//delete关键字
		
		def privilegeOrganizationInstance = PrivilegeOrganization.get(params.id)
		if (!privilegeOrganizationInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'privilegeOrganization.label', default: 'PrivilegeOrganization'), params.id])
			redirect(action: "list")
			return
		}
		try {
			if(privilegeOrganizationInstance.isAvailable==false){
				privilegeOrganizationInstance.setIsAvailable(true)
				flash.message = "PrivilegeOrganization "+params.id+"  restored"//message(code: '部门恢复成功', args: [message(code: 'privilegeOrganization.label', default: '恢复成功'), params.id])
			}else{
				privilegeOrganizationInstance.setIsAvailable(false)
				flash.message = message(code: 'default.deleted.message', args: [message(code: 'privilegeOrganization.label', default: 'PrivilegeOrganization'), params.id])
			}
			privilegeOrganizationInstance.save(flush: true)
			redirect(action: "list")
		}
		catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'privilegeOrganization.label', default: 'PrivilegeOrganization'), params.id])
			redirect(action: "show", id: params.id)
		}
	}
	def search = {
		Integer max->
		params.max = Math.min(max ?: 5, 100)
		if("on".equals(params.isShow))
			params.isShow = true
		def select = {
			if(params.pname||params.name)
			{
				if(params.pname){
					def po = PrivilegeOrganization.findByName(params.pname)
						eq("pid", po?.id)
				}		
				
				if(params.name){
						eq("name", params.name)
					}
				
					
			}
			eq("isAvailable",new Boolean(params.isShow))
			eq("isShow", true)
		}
		def results = PrivilegeOrganization.createCriteria().list(params,select)
		render view:"_table",model:[privilegeOrganizationInstanceList: results,privilegeOrganizationInstanceTotal: results.totalCount]

	}
	def ajaxChange = {
		if(params.name){
			def po =PrivilegeOrganization.findByName(params.name)
			if(po)
				render "部门名称已存在"
			else
				render	false
		}else{
			render false
		}
	}
}
