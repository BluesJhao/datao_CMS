package com.iminer.biz.system;

import org.json.simple.JSONValue

import com.iminer.biz.sys.OperationSysConfig



class HomePageController {

    def organizationImg() {
		//处理当前的业务操作
		

//		redirect(action:'organizationImg')
		
	}
	def index(){
		//生成组织机构想团图像
		def opsc=OperationSysConfig.get(2)
		def json=JSONValue.parse(opsc.getCheckValue2());
		[treedata:json,idindex:opsc.getCheckValue1()]
	}
	def organizationImgConfig(){
		OperationSysConfig opsc=OperationSysConfig.get(2)
		[treedata:opsc.getCheckValue2(),idindex:opsc.getCheckValue1()] 
	}
}
