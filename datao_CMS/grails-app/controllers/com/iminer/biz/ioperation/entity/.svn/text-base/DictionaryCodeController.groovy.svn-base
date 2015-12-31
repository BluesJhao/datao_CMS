package com.iminer.biz.ioperation.entity

import org.springframework.dao.DataIntegrityViolationException

import com.iminer.biz.system.IndexController;

class DictionaryCodeController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(controller: "DictionaryInfo",action: "list", params: params)
    }

    def save() {
		params.dicIdDictionaryInfo = DictionaryInfo.get(Integer.parseInt(params.dicIdDictionaryInfo))
        def dictionaryCodeInstance = new DictionaryCode(params)
        if (!dictionaryCodeInstance.save(flush: true)) {
			dictionaryCodeInstance.errors.each{ println(it) }
            render(controller: "DictionaryInfo",view: "list", model: [dictionaryCodeInstance: dictionaryCodeInstance])
            return
        }
        flash.message = message(code: 'default.created.message', args: [message(code: 'DictionaryCode.label', default: 'DictionaryCode'), dictionaryCodeInstance.id])
        redirect(controller:"DictionaryInfo",action: "list", id: dictionaryCodeInstance.id)
    }

    def deleted(Long id) {
        def dictionaryCodeInstance = DictionaryCode.get(id)
        if (!dictionaryCodeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'DictionaryCode.label', default: 'DictionaryCode'), id])
            redirect(controller:"DictionaryInfo",action: "list")
            return
        }

        try {
            dictionaryCodeInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'DictionaryCode.label', default: 'DictionaryCode'), id])
            redirect(controller:"DictionaryInfo",action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'DictionaryCode.label', default: 'DictionaryCode'), id])
            redirect(controller:"DictionaryInfo",action: "list", id: id)
        }
    }
}
