package com.iminer.biz.ioperation.entity;
/**
 * The IoperationDictionaryInfo entity.
 *
 * @author    
 *
 *
 */
class DictionaryInfo {
    static mapping = {
         table 'ioperation_dictionary_info'
         // version is set to false, because this isn't available by default for legacy databases
         version false
         id generator:'identity', column:'id'
    }
    Integer id
    String identifier
    String name
    String comment

    static constraints = {
        id(max: 2147483647)
        identifier(size: 0..128)
        name(size: 0..128)
        comment(size: 0..255)
    }
    String toString() {
        return "${id}" 
    }
}
