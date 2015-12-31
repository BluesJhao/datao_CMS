package com.iminer.biz.user

class Person {
    static mapping = {
		datasource 'entdomain'
         table 'privilege_person'
         version false
         id generator:'identity', column:'id'
    }
    Long id
    String username
    String password
    Date dateCreated
    Boolean enabled
    Boolean accountExpired
    Boolean accountConfirmed
    Boolean accountLocked
    Boolean passwordExpired
	Long chooseObjectId;
	String moduleType

	static transients = ['chooseObjectId','moduleType']

    static constraints = {
        id(max: 9223372036854775807L)
        username(size: 1..255, blank: false)
        password(size: 1..255, blank: false)
        dateCreated(nullable:false)
        enabled()
        accountExpired()
        accountConfirmed()
        accountLocked()
        passwordExpired()
    }

   
	
	static namedQueries = {
		getUserByName{name->
			eq('username', name)
			
		}
		queryAccountInfoByCondition{
			params ->
			if(params.accountName){
			
				organization{
			
					like('company','%'+params?.accountName+'%')
				}
			}
			if(params.accountEmail){
				organization{
					eq('email',params?.accountEmail)
				}
			}
				
			isNotNull('organization')
		}
		
		
	}
    String toString() {
    	return "${id}" 
    }
}
