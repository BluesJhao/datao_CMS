package com.iminer.biz.sys;
/**
 * The OperationSysConfig entity.
 *
 * @author    
 *
 *
 */
class OperationSysConfig {
    static mapping = {
//		datasource 'operation'
         table 'operation_sys_config'
         // version is set to false, because this isn't available by default for legacy databases
         version false
         id generator:'identity', column:'id'
    }
    Integer id
    String remark
    String checkValue
    String checkValue1
    String checkValue2

    static constraints = {
        id(max: 2147483647)
        remark(size: 0..64)
        checkValue(size: 0..64,nullable:true)
        checkValue1(size: 0..64,nullable:true)
        checkValue2(size: 0..64,nullable:true)
    }
    String toString() {
        return "${id}" 
    }
}
