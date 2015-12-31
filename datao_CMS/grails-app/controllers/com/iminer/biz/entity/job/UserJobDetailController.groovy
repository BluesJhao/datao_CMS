package com.iminer.biz.entity.job

import org.springframework.dao.DataIntegrityViolationException
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.iminer.biz.entity.OperationPerson
import grails.converters.JSON
import java.text.SimpleDateFormat


class UserJobDetailController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [userJobDetailInstanceList: UserJobDetail.list(params), userJobDetailInstanceTotal: UserJobDetail.count()]
		
    }

    def create() {
        [userJobDetailInstance: new UserJobDetail(params)]
    }

    def save() {
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		def file = multipartRequest.getFiles("jobAttach")
        def userJobDetailInstance = new UserJobDetail(params)
		userJobDetailInstance.setIsAvailable(true)
        if (!userJobDetailInstance.save(flush: true)) {
            render(view: "create", model: [userJobDetailInstance: userJobDetailInstance])
            return
        }
		def ju = null
		def list = params."personId-objId"
		
		for(String i : list.split(",")){
			ju = new JobUser(jobId:userJobDetailInstance.id,personId:Integer.parseInt(i))
			ju.save(flush: true)
		}
		for(def i: upload(file)){
				Attach ath = new Attach(jobId:userJobDetailInstance.id,name:i.name,fileSuffix:i.suffix,path:i.path) 
				ath.save(flush: true)
		}
        flash.message = message(code: 'default.created.message', args: [message(code: 'userJobDetail.label', default: 'UserJobDetail'), userJobDetailInstance.id])
        redirect(action: "show", id: userJobDetailInstance.id)
    }

    def show(Long id) {
        def userJobDetailInstance = UserJobDetail.get(id)
        if (!userJobDetailInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'userJobDetail.label', default: 'UserJobDetail'), id])
            redirect(action: "list")
            return
        }

        [userJobDetailInstance: userJobDetailInstance]
    }
	def ajaxShow(){
		params.index = Integer.parseInt(params.index);
		def userJobDetailInstance = UserJobDetail.get(params.index)
		def allPerson = com.iminer.biz.entity.OperationPerson.findAll("from OperationPerson where id in (select personId from JobUser where jobId = :jobId)",[jobId:params.index])
		def allAttach = Attach.findAllByJobId(params.index)
		def li = [:]
		li.put("userJobDetail", userJobDetailInstance)
		li.put("allPerson", allPerson)
		li.put("allAttach", allAttach)
		render("view":"ajaxshow",model:[info: li])
	}
    def edit(Long id) {
        def userJobDetailInstance = UserJobDetail.get(id)
        if (!userJobDetailInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'userJobDetail.label', default: 'UserJobDetail'), id])
            redirect(action: "list")
            return
        }

        [userJobDetailInstance: userJobDetailInstance]
    }

    def update(Long id, Long version) {
        def userJobDetailInstance = UserJobDetail.get(id)
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		def file = multipartRequest.getFiles("jobAttach")
        if (!userJobDetailInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'userJobDetail.label', default: 'UserJobDetail'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (userJobDetailInstance.version > version) {
                userJobDetailInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'userJobDetail.label', default: 'UserJobDetail')] as Object[],
                          "Another user has updated this UserJobDetail while you were editing")
                render(view: "edit", model: [userJobDetailInstance: userJobDetailInstance])
                return
            }
        }

        userJobDetailInstance.properties = params
		userJobDetailInstance.setIsAvailable(true)
		
        if (!userJobDetailInstance.save(flush: true)) {
            render(view: "edit", model: [userJobDetailInstance: userJobDetailInstance])
            return
        }
		List load = upload(file)
			for(def i: load){
					Attach ath = new Attach() 
					ath.setJobId(userJobDetailInstance.id)
					ath.setName(i.name)
					ath.setFileSuffix(i.suffix)
					ath.setPath(i.path)
					ath.save(flush: true)
		}	
		def ju = null
		def plist = (params."personId-objId").split(",")//2[4,29]  [4,29,67] [14,22,68]
		def jUser = JobUser.findAll("from JobUser where jobId = :jobId",[jobId:userJobDetailInstance.id])//3[4,29,50]
		jUser.each{ jobUser->
			jobUser.delete(flush: true)
		}
		plist.each {number->
			ju = new JobUser(jobId:userJobDetailInstance.id,personId:Integer.parseInt(number))
			ju.save(flush: true)
		}
        flash.message = message(code: 'default.updated.message', args: [message(code: 'userJobDetail.label', default: 'UserJobDetail'), userJobDetailInstance.id])
        redirect(action: "show", id: userJobDetailInstance.id)
    }

    def deleted(Long id) {
        def userJobDetailInstance = UserJobDetail.get(id)
        if (!userJobDetailInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'userJobDetail.label', default: 'UserJobDetail'), id])
            redirect(action: "list")
            return
        }

        try {
            userJobDetailInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'userJobDetail.label', default: 'UserJobDetail'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'userJobDetail.label', default: 'UserJobDetail'), id])
            redirect(action: "show", id: id)
        }
    }
	
	def ajaxDel(){
		def id = Integer.parseInt(params.id)
		def path = params.path
		File file = new File(path)
		if(file.exists())
			file.delete()
		def attach = Attach.findByIdAndPath(id,path)
		if(attach)
		   attach.delete(flash:true)
		render null
	}
	
	def upload = { lFile ->
		def temp1 = [:]
		def temp2 = []
		for(int i=0;i<lFile.size;i++){
			if(lFile[i].size!=0){
				def userDir = new File("D:\\workSpace\\datao_CMS\\web-app\\upload")
				if(!userDir.exists())
					userDir.mkdirs()
				def sourceName = System.currentTimeMillis()+""
				lFile[i].transferTo(new File(userDir,sourceName))
				def sName = lFile[i].originalFilename
				def index = sName.lastIndexOf(".")
				def name = sName.substring(0,index)
				def suffix = sName.substring(index+1)
				temp1.put("name", name)
				temp1.put("suffix", suffix)
				temp1.put("path", userDir.path+File.separator+sourceName)
				temp2 += temp1
				temp1 = [:]
			}	
		}
		return temp2
	}
	
	def download = {
		Attach ah = Attach.findById(params.id)
		def path = ah.name+"."+ah.fileSuffix
		response.setCharacterEncoding("UTF-8");
		response.setHeader("Content-disposition", "attachment; filename=" +  new String(path.getBytes(), "ISO8859-1")) 
		def filepath = new File(ah.path)
		def out = response.outputStream 
		FileInputStream inputStream = new FileInputStream(filepath) 
		byte[] buffer = new byte[1024]
		int i = -1 
		while ((i = inputStream.read(buffer)) != -1) { 
		out.write(buffer, 0, i) 
		} 
		out.flush() 
		out.close() 
		inputStream.close()
	}

	def preview = {
			Attach ah = Attach.findById(params.id)
			def ctm = (ah.path).substring((ah.path).lastIndexOf('\\')+1)
			response.contentType = "application/msword"//不能读html
			redirect(url:"/upload/${ctm}")
	}
	
	def selection = {
		def select = {
			if(params.type||params.event)
			{
				if(params.type){
					eq("type", Integer.parseInt(params.type))
				}
				if(params.event){
					like("name", "%"+params.event+"%")
				}
			}
			eq("isAvailable",true)
		}
		def results = UserJobDetail.createCriteria().list(params,select)
		render results as JSON
	}
	def search = {
		Integer max->
		params.max = Math.min(max ?: 5, 100)
		if("on".equals(params.isAvailable))
			params.isAvailable = true
		def select = {
			if(params.type||params.name)
			{
				if(params.type){
					eq("type", Integer.parseInt(params.type))
				}
				if(params.name){
					def op = com.iminer.biz.entity.OperationPerson.findAllByNameLike(params.name+"%")
					if(op){
						def jlist = []
						op.each {job->
							def ju = JobUser.findAllByPersonId(job.id)
							if(ju)
								jlist = jlist+ju.jobId
						}
						"in"("id",jlist)
					if(!op)
						eq("id",null)
					}else{
						eq("id",null)
					}
				}
			}
			eq("isAvailable",new Boolean(params.isAvailable))
		}
		def results = UserJobDetail.createCriteria().list(params,select)
		render(view: "list",model:[userJobDetailInstanceList: results,userJobDetailInstanceTotal: results.totalCount])
		return

	}
}
