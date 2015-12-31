package com.iminer.biz

class Category {

	Integer id
	Integer pid
	String name				//分类名称
	Integer displayorder	//权重
	String image			//图
	String navigation		//是否为导航
	String description		//描述
	Integer languagesId
	static constraints = {
		id(max: 2147483647)
		pid(max: 2147483647)
		name(size: 1..50, blank: false)
		displayorder()
		image(size: 1..255, blank: true)
		navigation(blank: true)
		description(blank: true)
		version(max: 9223372036854775807L)
		languagesId(nullable: true, max: 2147483647)
	}
	
	static mapping = {
		datasource 'entdomain'
		table 'basic_ent_category'
		id column:'cid'

	}

	
	static namedQueries = {
		
		//按pid查找对象
		findCategoryByPid{
			pid ->
			
			eq('pid',pid)
		}
		
		//按pid查找对象
		getCodeByPidAndName{
			pid ->
			not{
				like('name',"%(已停用)%")
			}
			eq('pid',pid)
		}
		
		//按照id查找对象
		findMovieByCategoryId{
			id ->
			
			idEq(id)
		}
	}
}
