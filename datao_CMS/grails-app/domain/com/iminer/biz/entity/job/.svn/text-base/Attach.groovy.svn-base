package com.iminer.biz.entity.job

import java.io.Serializable;

class Attach implements Serializable{
	
	static mapping = {
		table 'operation_job_attach'
		// version is set to false, because this isn't available by default for legacy databases
		version false
		id generator:'identity', column:'id'
   }
   Integer id
   Integer jobId
   String name
   String fileSuffix
   String path

   static constraints = {
	   id(max: 2147483647)
	   jobId(max: 2147483647)
	   name(size: 0..255,nullable:true)
	   fileSuffix(size: 0..255,nullable:true)
	   path(size: 0..255)
   }
   String toString() {
	   return "${id}"
   }
}
