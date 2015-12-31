package com.iminer.biz.entity
/**
 * The PrivilegeOrganization entity.
 *
 * @author    
 *
 *
 */
class PrivilegeOrganization {
    static mapping = {
         table 'privilege_organization'
         // version is set to false, because this isn't available by default for legacy databases
         version false
         id generator:'assigned', column:'id'
         leaderIdOperationPerson column:'leader_id'
    }
    String id
    String affiliationId
    String name
    String pid
    String cids
    Integer type
    String comment
    Boolean isAvailable
    Integer orderIndex
	Boolean isShow
	Boolean showFname
	String fName
    // Relation
    OperationPerson leaderIdOperationPerson

    static constraints = {
        id(size: 1..255, blank: false)
        affiliationId(nullable:true,size: 0..20)
        name(size: 0..64)
        pid(nullable: true,size:0..255)
        cids(nullable: true,size:0..255)
        type(nullable: true, max: 2147483647)
        comment(nullable:true,size: 0..256)
        isAvailable(nullable: true)
        orderIndex(nullable: true, max: 2147483647)
		isShow(nullable: true)
        leaderIdOperationPerson(nullable:true)
		showFname(nullable: true)
		fName(nullable: true)
    }
    String toString() {
        return "${id}" 
    }
}
