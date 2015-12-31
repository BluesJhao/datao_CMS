package com.iminer.biz.entity.job
/**
 * The OperationUserJobDetail entity.
 *
 * @author    
 *
 *
 */
class UserJobDetail {
    static mapping = {
         table 'operation_user_job_detail'
         // version is set to false, because this isn't available by default for legacy databases
         version false
         id generator:'identity', column:'id'
    }
    Integer id
    String name
    String jobContent
    Integer type
    Boolean isAvailable

    static constraints = {
        id(max: 2147483647)
        name(size: 0..64)
        jobContent()
        type(nullable: true, max: 2147483647)
        isAvailable(nullable: true)
    }
    String toString() {
        return "${id}" 
    }
}
