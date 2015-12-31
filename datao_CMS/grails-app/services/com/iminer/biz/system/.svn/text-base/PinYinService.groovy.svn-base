package com.iminer.biz.system

import groovy.sql.Sql
import net.sourceforge.pinyin4j.PinyinHelper
import net.sourceforge.pinyin4j.format.HanyuPinyinCaseType
import net.sourceforge.pinyin4j.format.HanyuPinyinOutputFormat
import net.sourceforge.pinyin4j.format.HanyuPinyinToneType

class PinYinService {

	def dataSource
    def caculatePinYin(def name,def type) {
			Sql dbCommon =new Sql(dataSource)
			def pin=HanyuToPinyin(name)
			def fullAlphas = []
			def initialAlphas = []
			def i = 0
			
			pin[0]?.each{
				
				def fullAlpha = it?.replace("'", "\\'")
				if(!fullAlphas.contains(fullAlpha)){
					fullAlphas.add(fullAlpha)
				}
			}
			
			
			pin[1]?.each{
				
				def initialAlpha = it?.replace("'", "\\'")
				if(!initialAlphas.contains(initialAlpha)){
					initialAlphas.add(initialAlpha)
				}
				
			}
			
			def map = [:]
			map.put("fullAlphas", fullAlphas)
			map.put("initialAlphas", initialAlphas)
			return map
			
    }
	/**
	 * 汉字转拼音的方法
	 * @param name 汉字
	 * @return 拼音
	 */
	 def  HanyuToPinyin(String name){
		 char[] nameChar = name.toCharArray();
		 def pinyinName=[]
		 def firstname=[]
		 HanyuPinyinOutputFormat defaultFormat =new HanyuPinyinOutputFormat();
		 defaultFormat.setCaseType(HanyuPinyinCaseType.LOWERCASE);
		 defaultFormat.setToneType(HanyuPinyinToneType.WITHOUT_TONE);
		 for (int i = 0; i < nameChar.length; i++) {
			 def thislist=[]
			 def thisflist=[]
//			 println "@@@"
//			 println nameChar[i]
//			 if (nameChar[i] > 128) {
//				 println "@@@+++++++++++"
//				 try {
					 def pinyin=PinyinHelper.toHanyuPinyinStringArray(nameChar[i], defaultFormat)
					 def x="";
					 def flag = true//是否是中文   pinyin是否有值
					 if(!pinyin){
					 	pinyin = [nameChar[i]]
						 flag = false
					 }
					 
					 if(pinyin){
						 pinyin.each {thismy->
							 def my 
//							 println "fffffffffffffff"+flag
							 if(flag){
								 my=thismy.replace('U:','V')
								 if(x.indexOf(my)==-1){
									 x+=","+my
									 if(pinyinName){
										 pinyinName.each {tx->
											 thislist.add(tx+my)
										}
										 firstname.each {tx->
											 thisflist.add(tx+my.substring(0,1))
										}
									 }else{
										thislist.add(my)
										thisflist.add(my.substring(0,1))
									 }
		
		
								 }
							 }else{
//							 println "############else="+thismy
							 	my = thismy
								 if(pinyinName){
//									 thislist.addAll(pinyinName)
//									 thislist.add(my)
//									 thisflist.addAll(firstname)
//									 thisflist.add(my)
									 
									 pinyinName.each {tx->
										 thislist.add(tx.toString()+my.toString())
									}
									 firstname.each {tx->
										 thisflist.add(tx.toString()+my.toString())
									}
									 
								 }else{
									thislist.add(my.toString())
									thisflist.add(my.toString())
								 }
//								 println "thislist==="+thislist
//								 println "thisflist==="+thisflist
								 
							 }
							 
						 }
						 
						 if(thislist){
							 pinyinName=thislist;
							 firstname=thisflist;
						 }
					 }
	

//					 pinyinName += PinyinHelper.toHanyuPinyinStringArray(nameChar[i], defaultFormat)[0];
//				 } catch (Exception e) {
//					 println e
//				 }

//			 }
		 }
//		 if(!pinyinName){
//			 pinyinName.add(name)
//			 firstname.add(name)
//		 }
		 return [pinyinName,firstname];
	 }
	 
	 /**
	  * 汉字转拼音的方法
	  * @param name 汉字
	  * @return 拼音
	  */
	  def  Hanyu2FirstPinyin(String name){
		  char[] nameChar = name.toCharArray();
		  def pinyinName=""
		  HanyuPinyinOutputFormat defaultFormat =new HanyuPinyinOutputFormat();
		  defaultFormat.setCaseType(HanyuPinyinCaseType.LOWERCASE);
		  defaultFormat.setToneType(HanyuPinyinToneType.WITHOUT_TONE);
		  for (int i = 0; i < nameChar.length; i++) {
			  if (nameChar[i] > 128) {
				  try {
					  pinyinName += PinyinHelper.toHanyuPinyinStringArray(nameChar[i], defaultFormat)[0];
				  } catch (Exception e) {
					  e.printStackTrace();
				  }
			  }
		  }
		  return pinyinName;
	  }
	  
	  
	  
	  
	  
	  
	  
	  
	  
 def checkuser(){
	
		 Sql dbCommon =new Sql(dataSource)
		 String sql="select id,name,index_alpha from basic_artist_info  where filter=1 "
//			String insertSql="insert into basic_artist_info (id,full_alpha,initial_alpha) values"
		 
		 def dbmp=[:]
		 dbCommon.rows(sql).each {
		 	int xm=(it.id.toString().hashCode()& 0x7FFFFFFF) %200
			 def x=dbmp.get(xm)
		 	if(x==null){
				 x=[];
				 x.add(it.id)
			 }else{
			 	x.add(it.id)
			 }
		 	dbmp.put(xm, x)
		 }
		 dbmp.each {key,value->
			 println key
			 println value
		 }
 
 }
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
}
