package com.iminer.biz.system

import com.iminer.biz.user.Person

/**
 * LoginService：登录
 * @author   fangjie fangjie@iminer.com
 * @version  V1.0
 * @date 	 2015-1-16 下午7:23:18
 */
class LoginService {
	
	/**
	 * 根据用户名、密码查找用户
	 * @param userName ：用户名
	 * @param password ： 密码
	 * @return
	 */
	def checkUser(def userName,def password){
		def person = Person.findByUsernameAndPassword(userName, password)
		if(person){
			return person
		}else{
			return false
		}
	}

}
