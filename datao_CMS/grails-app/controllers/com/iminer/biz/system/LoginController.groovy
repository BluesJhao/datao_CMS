package com.iminer.biz.system

/**
 * LoginController：登录相关
 * @author   fangjie fangjie@iminer.com
 * @version  V1.0
 * @date 	 2015-1-16 下午7:00:05
 */
class LoginController {

	def loginService
	
	/**
	 * login:登录
	 * @return
	 */
	def index(){
		def userName = params.userName
		def pasword = params.password
		def user
		if(userName && pasword){
			user = loginService.checkUser(userName, pasword)
		}
		
		if(user){
			session.user = user
			redirect(uri:"/index/index")
		}else{
			flash.message = "用户名或密码错误！"
			redirect(uri:"/")
			
		}
	}
	
	/**
	 * 退出
	 * @return
	 */
	def loginOut(){
		session.user = ""
		redirect(uri:"/")
	}
}
