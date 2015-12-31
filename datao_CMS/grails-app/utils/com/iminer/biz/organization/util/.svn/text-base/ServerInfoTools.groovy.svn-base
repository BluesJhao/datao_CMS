package com.iminer.biz.organization.util

import com.iminer.biz.ioperation.entity.ServerInfo
import com.iminer.biz.sys.OperationSysConfig

class ServerInfoTools {
	def static synchronized getOId(){
		OperationSysConfig o = OperationSysConfig.get(4);
		def myId=o.checkValue
		if(myId==null||myId==""){
			myId="000001"
		}else{
			def numberId=Integer.parseInt(myId, 16);
			numberId++;
			myId=Integer.toHexString(numberId)
			if(myId>="ffffff"){
				throw new Exception("服务器id值大于 ffffff无法继续操作请和管理员联系");
			}
			switch (myId.length()) {
			case 1:
				myId="00000"+myId
				break;
			case 2:
				myId="0000"+myId
				break;
			case 3:
				myId="000"+myId
				break;
			case 4:
				myId="00"+myId
				break;
			case 5:
				myId="0"+myId
				break;
			default:
				break;
			}
		}
		o.checkValue = myId;
		if(!o.save(flush:true)){
			throw new Exception("服务器id保存异常！");
		}
		return o.checkValue
			 
	}
	
}
