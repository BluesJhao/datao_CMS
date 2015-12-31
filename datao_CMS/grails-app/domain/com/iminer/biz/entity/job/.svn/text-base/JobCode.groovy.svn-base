package com.iminer.biz.entity.job
/**
 * The OperationJobCode entity.
 *
 * @author    
 *
 *
 */
class JobCode {
    static mapping = {
         table 'operation_job_code'
         // version is set to false, because this isn't available by default for legacy databases
         version false
         id generator:'identity', column:'id'
    }
    Integer id
    String name
    Integer pid
    Integer isAvailable
    Integer sortIndex

    static constraints = {
        id(max: 2147483647)
        name(size: 0..64)
        pid(nullable: true, max: 2147483647)
        isAvailable(nullable: true, max: 2147483647)
        sortIndex(nullable: true, max: 2147483647)
    }
    String toString() {
        return "${id}" 
    }
}
