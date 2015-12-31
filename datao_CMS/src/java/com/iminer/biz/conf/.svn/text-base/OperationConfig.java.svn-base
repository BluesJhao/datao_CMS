package com.iminer.biz.conf;

import grails.util.GrailsUtil;

public class OperationConfig {
	public static final String HIDE_IMINER_ID="01";
	public static String getImagePath(){
		System.out.println(GrailsUtil.getEnvironment());
		if(GrailsUtil.getEnvironment().equals("development")){
			return "d:\\img\\";
		}else{
			return "/home/dev/datao_CMS/opicture";
		}
	}
}
