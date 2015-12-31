package com.iminer.biz.entity

import grails.converters.JSON
import java.text.SimpleDateFormat

import org.springframework.dao.DataIntegrityViolationException

import com.iminer.biz.conf.OperationConfig;
import com.iminer.biz.entity.job.UserJobDetail;
import com.iminer.biz.system.PinYinService
import com.iminer.rd.tools.DateTools;

class OperationPersonController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
		
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
	params.max = Math.min(max ?: 10, 100)
		def select = {
			if(params.name||params.department)
			{
					if(params.name){
						like("name", params.name+'%')
					}
					if(params.department){
						def po = PrivilegeOrganization.findAllByIdOrPidLike(params.department,params.department+"%")
							'in'("organizationId",po)
					}
			
			}
			isNull("departureDate")
			order("employeeId", "desc")
		}
		def list = OperationPerson.createCriteria().list(params,select)
        [operationPersonInstanceList: list, operationPersonInstanceTotal: list?.totalCount]
    }
	
	def birthdayList = {
		SimpleDateFormat format = new SimpleDateFormat("MM")
		def oop = OperationPerson.findAll()
		def relist = []
		def mon = new Date().getMonth()+1;
		if(mon<10)
			mon = "0" +mon
		else
			mon += ""
		oop.each {item ->
			if((item?.birthday!=null)){
				if(item&&format.format(item?.birthday)==mon)
					relist += item
			}
		}
		def userJobDetailSpec = UserJobDetail.findAllByType(1)
		userJobDetailSpec as JSON
		def elist = [:]
		elist.put("relist", relist)
		elist.put("userJobDetailSpec", userJobDetailSpec)
		render elist as JSON
	}
	
	def listOrganization(){
//		params.max = params.max ?: 10
//		def po=PrivilegeOrganization.get(params.id)
		def po = PrivilegeOrganization.findAllByIdOrPidLike(params.id,params.id+"%",[sort:'id',order:"asc"])
		def rlist=OperationPerson.findAllByOrganizationIdInListAndDepartureDateIsNull(po,params)
//		def plist=[];
		def pMap=[:]
		rlist.each {poer->
				def o=pMap.get(poer.organizationId.id.toString())
				if(o==null){
					o=[]	
				}
				if(poer.id==poer.organizationId?.leaderIdOperationPerson?.id){
					o.add(0,poer)
				}else{
					o.add(poer)
				}
				pMap.put(poer.organizationId.id.toString(), o)
		}
//		pMap.each {key,value->
//			plist.add(value)
//		}
		
		
		
		[pmap:pMap,po:po]
	}

    def create() {
        [operationPersonInstance: new OperationPerson(params)]
    }

    def save() {
		
		def po = PrivilegeOrganization.get(params.organizationId)
		params.organizationId = po
//		DateTools dt=new DateTools();
		params.tutorId = params."tutorId-objId"
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd")
		if(params.birthday)
			params.birthday = format.parse(params.birthday)
		if(params.lunarBirthday)
			params.lunarBirthday = format.parse(params.lunarBirthday)
		if(params.employedDate)
			params.employedDate = format.parse(params.employedDate)
		if(params.departureDate)
			params.departureDate = format.parse(params.departureDate)
        def operationPersonInstance = new OperationPerson(params)
		
        if (!operationPersonInstance.save(flush: true)) {
            render(view: "create", model: [operationPersonInstance: operationPersonInstance])
            return
        }
		def file = request.getFile("imgPath1")
		if(file){
			String message = upload(file,operationPersonInstance?.id)
			if(message){
				operationPersonInstance.setImgPath(message)
				operationPersonInstance.save(flush:true)
			}
		}

        flash.message = message(code: 'default.created.message', args: [message(code: 'operationPerson.label', default: 'OperationPerson'), operationPersonInstance.id])
        redirect(action: "show", id: operationPersonInstance.id)
    }

    def show(Long id) {
        def operationPersonInstance = OperationPerson.get(id)
        if (!operationPersonInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'operationPerson.label', default: 'OperationPerson'), id])
            redirect(action: "list")
            return
        }

        [operationPersonInstance: operationPersonInstance]
    }

    def edit(Long id) {
        def operationPersonInstance = OperationPerson.get(id)
        if (!operationPersonInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'operationPerson.label', default: 'OperationPerson'), id])
            redirect(action: "list")
            return
        }
				
		[operationPersonInstance: operationPersonInstance]
    }

    def update(Long id, Long version) {
		def po = PrivilegeOrganization.get(params.organizationId)
		params.organizationId = po
        def operationPersonInstance = OperationPerson.get(params.id)
        if (!operationPersonInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'operationPerson.label', default: 'OperationPerson'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (operationPersonInstance.version > version) {
                operationPersonInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'operationPerson.label', default: 'OperationPerson')] as Object[],
                          "Another user has updated this OperationPerson while you were editing")
                render(view: "edit", model: [operationPersonInstance: operationPersonInstance])
                return
            }
        }
	    SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd")
		if(params.birthday)
			params.birthday = format.parse(params.birthday)
		if(params.lunarBirthday)
			params.lunarBirthday = format.parse(params.lunarBirthday)
		if(params.employedDate)
			params.employedDate = format.parse(params.employedDate)
		if(params.departureDate)
			params.departureDate = format.parse(params.departureDate)
		params.tutorId = params."tutorId-objId"
        operationPersonInstance.properties = params
		operationPersonInstance.setGender(Integer.parseInt(params.gender))

		def file = request.getFile("imgPath1")
		if(file){
			String message = upload(file,operationPersonInstance?.id)
			if(message){
				println "------------${message}---------"
				operationPersonInstance.imgPath=message
//				operationPersonInstance.save(flush:true)
			}
		}
        if (!operationPersonInstance.save(flush: true)) {
			println operationPersonInstance.errors
            render(view: "edit", model: [operationPersonInstance: operationPersonInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'operationPerson.label', default: 'OperationPerson'), operationPersonInstance.id])
        redirect(action: "show", id: operationPersonInstance.id)
    }

    def deleted(Long id) {
        def operationPersonInstance = OperationPerson.get(id)
        if (!operationPersonInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'operationPerson.label', default: 'OperationPerson'), id])
            redirect(action: "list")
            return
        }

        try {
			operationPersonInstance.delete(flush: true)
			def po = PrivilegeOrganization.findByLeaderIdOperationPerson(operationPersonInstance)
			if(po){
				po.setLeaderIdOperationPerson(null)
				po.save(flush: true)
			}
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'operationPerson.label', default: 'OperationPerson'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'operationPerson.label', default: 'OperationPerson'), id])
            redirect(action: "show", id: id)
        }
    }
	def search = {
		Integer max->
		params.max = Math.min(max ?: 10, 100)
		def select = {
			if(params.name||params.department)
			{
					if(params.name){
						like("name", params.name+'%')
					}
					if(params.department){
						def po = PrivilegeOrganization.findAllByIdOrPidLike(params.department,params.department+"%")
							'in'("organizationId",po)
					}
			
			}
			isNull("departureDate")
			order("employeeId", "desc")
		}
		def results = OperationPerson.createCriteria().list(params,select)
		render view:"_table",model:[operationPersonInstanceList: results,operationPersonInstanceTotal: results.totalCount]

	}
	
	def ajaxChangeName = {
		if(params.name){
			def py = new PinYinService()
			def spellName = py.HanyuToPinyin(params.name)
			if(spellName)
				render spellName[0] as JSON
		}
	}
	def showperson(){
		def operationPersonInstance = OperationPerson.get(params.id)
		[operationPersonInstance: operationPersonInstance]
	}
	
	
	
	/**
	 * 涓婁紶鍥剧墖
	 * @param file
	 * @param artistId
	 * @return
	 */
	def upload(def file,def personId){
		def message = ''
		if(file.originalFilename){
			//寰楀埌璺緞
			def rootPath = OperationConfig.getImagePath();
			def userDir = new File(rootPath, File.separator+"upload"+File.separator+"person")
			userDir.mkdirs()
			Date date = new Date()
			SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHHmmssSS")
			SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
			def sourceName = file.originalFilename
			def saveFileName = format.format(date)+sourceName.substring(sourceName.lastIndexOf("."), sourceName.length())
			//涓婁紶鏂囦欢鍒版湰鍦�			file.transferTo(new File(userDir,saveFileName))
			message=userDir.path+File.separator+saveFileName
		}
		return message
	}

	def getPersonImage(){
		String perfectName = "";
		if(params?.id){
			def o=OperationPerson.get(params?.id as int);
			if(o.imgPath){
				
				File file=new File(o.imgPath)
				if(file.exists()){
					perfectName = o.imgPath;
					FileInputStream is = new FileInputStream(perfectName);
					int i = is.available(); // 寰楀埌鏂囦欢澶у皬
					byte[] data = new byte[i];
					is.read(data); // 璇绘暟鎹�					is.close();
					response.setContentType("image/*"); // 璁剧疆杩斿洖鐨勬枃浠剁被鍨�					
					OutputStream toClient = response.getOutputStream(); // 寰楀埌鍚戝鎴风杈撳嚭浜岃繘鍒舵暟鎹殑瀵硅薄
					toClient.write(data); // 杈撳嚭鏁版嵁
					toClient.close();
				}
			}
		}

	}
	
	
	
}
