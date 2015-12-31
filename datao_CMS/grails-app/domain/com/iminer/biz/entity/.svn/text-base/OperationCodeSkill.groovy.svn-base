package com.iminer.biz.entity;
/**
 * The OperationCodeSkill entity.
 *
 * @author ldr   
 *
 *
 */
class OperationCodeSkill {
    static mapping = {
         table 'operation_code_skill'
         // version is set to false, because this isn't available by default for legacy databases
         version false
         id generator:'identity', column:'id'
    }
    Integer id
    String name
    Integer pid
    Integer type
    Integer isAvailable

    static constraints = {
        id(max: 2147483647)
        name(size: 0..64)
        pid(nullable: true, max: 2147483647)
        type(nullable: true, max: 2147483647)
        isAvailable(nullable: true, max: 2147483647)
    }
    String toString() {
        return "${id}" 
    }
}
