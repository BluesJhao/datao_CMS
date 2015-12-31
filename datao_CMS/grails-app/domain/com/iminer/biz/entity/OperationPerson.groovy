package com.iminer.biz.entity
/**
 * The OperationPerson entity.
 *
 * @author    
 *
 *
 */
class OperationPerson {
    static mapping = {
         table 'operation_person'
         // version is set to false, because this isn't available by default for legacy databases
         version false
         id generator:'identity', column:'id'
		 organizationId column:'organization_id'
    }
    Integer id
    String name
    String idNumber
	String employeeId
    Date birthday
    Integer gender
    Integer constellation
    String qq
    String email
    String nameSpell
    String mealId
    String lockId
    Date employedDate
    Date departureDate
    Integer workType
    Integer workLevel
    String ana
    String summarize
    String commonDuties
    Date createTime
    Integer createUser
	PrivilegeOrganization organizationId
	String imgPath
	String extensionNumber
	Integer tutorId
	String nickName
	Date lunarBirthday
    static constraints = {
        id(max: 2147483647)
        name(size: 0..32)
        idNumber(nullable: true,size: 0..18)
        employeeId(size: 0..10,nullable: true)
        birthday(nullable: true)
        gender(nullable: true, max: 2147483647)
        constellation(nullable: true, max: 2147483647)
        qq(nullable: true,size: 0..20)
        email(size: 0..50)
        nameSpell(nullable: true,size: 0..128)
        mealId(nullable: true,size: 0..64)
        lockId(nullable: true,size: 0..64)
        employedDate(nullable: true)
        departureDate(nullable: true)
        workType(nullable: true, max: 2147483647)
        workLevel(nullable: true, max: 2147483647)
        ana(nullable: true,size: 0..512)
        summarize(nullable: true,size: 0..512)
        commonDuties(nullable: true, size: 0..20)
        createTime(nullable: true)
        createUser(nullable: true, max: 2147483647)
		imgPath(nullable: true)
		extensionNumber(nullable: true,size:0..20)
		tutorId(nullable: true)
		nickName(nullable:true)
		lunarBirthday(nullable:true)
    }
    String toString() {
        return "${id}" 
    }
}
