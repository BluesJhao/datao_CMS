package com.iminer.biz.organization.util

import com.iminer.biz.entity.PrivilegeOrganization;
import com.iminer.biz.sys.OperationSysConfig;

import groovy.sql.Sql

class OrganizationTools {
	def static synchronized getOId(){
		OperationSysConfig o=OperationSysConfig.get(1);
		def myId=o.checkValue
		if(myId==null||myId==""){
			myId="01"
		}else{
			def numberId=Integer.parseInt(myId, 16);
			numberId++;
			myId=Integer.toHexString(numberId)
			if(myId>="ff"){
				throw new Exception("机构id值大于 fff无法继续操作请和管理员联系");
			}
			switch (myId.length()) {
			case 1:
				myId="0"+myId
			break;

			default:
				break;
			}
		}
		o.checkValue=myId;
		if(!o.save(flush:true)){
			throw new Exception("机构id保存异常！");
		}
		return myId
			 
	}
	def static synchronized getCid(String fatherId){
		
		PrivilegeOrganization o=PrivilegeOrganization.findById(fatherId)
		def myId=o.cids
		if(myId==null||myId==""){
			myId="01"
		}else{
			def numberId=Integer.parseInt(myId, 16);
			numberId++;
			myId=Integer.toHexString(numberId)
			if(myId>="ff"){
				throw new Exception("机构id值大于 fff无法继续操作请和管理员联系");
			}
			switch (myId.length()) {
			case 1:
				myId="0"+myId
			break;
			default:
				break;
			}
		}
		o.cids=myId;
		if(!o.save(flush:true)){
			println o.errors
			throw new Exception("机构id保存异常！");
		}
		return fatherId+myId
		
		
	}
}
