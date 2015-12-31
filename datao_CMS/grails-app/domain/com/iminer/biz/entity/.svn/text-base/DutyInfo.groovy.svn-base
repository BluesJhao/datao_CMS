package com.iminer.biz.entity
/**
 * The OperationDutyInfo entity.
 *
 * @author    
 *
 *
 */
class DutyInfo {
    static mapping = {
         table 'operation_duty_info'
         // version is set to false, because this isn't available by default for legacy databases
         version false
         // In case a sequence is needed, changed the identity generator for the following code:
//       id generator:'sequence', column:'id', params:[sequence:'operation_duty_info_sequence']
         id generator:'identity', column:'id'
    }
    Integer id
    String name
    String enName
    Date createTime
    Integer createUser

    static constraints = {
        id(max: 2147483647)
        name(size: 0..64)
        enName(size: 0..64)
        createTime(nullable: true)
        createUser(nullable: true, max: 2147483647)
    }
    String toString() {
        return "${id}" 
    }
}
