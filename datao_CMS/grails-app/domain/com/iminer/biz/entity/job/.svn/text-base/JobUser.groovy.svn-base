package com.iminer.biz.entity.job
/**
 * The OperationJobUser entity.
 *
 * @author    
 *
 *
 */
class JobUser implements Serializable{
    static mapping = {
         table 'operation_job_user'
         // version is set to false, because this isn't available by default for legacy databases
         version false
         id generator:'identity', column:'job_id'
         id generator:'identity', column:'person_id'
         id composite:['jobId','personId'], generator:'assigned'
    }
    Integer jobId
    Integer personId
    Integer jobLeve

    static constraints = {
        jobId(max: 2147483647)
        personId(max: 2147483647,blank:false)
        jobLeve(nullable: true, max: 2147483647)
    }
    String toString() {
        return "${jobId}" 
    }
}
