package com.iminer.biz.ioperation.entity;
/**
 * The DictionaryCode entity.
 *
 * @author    
 *
 *
 */
class DictionaryCode {
    static mapping = {
         table 'ioperation_dictionary_code'
         // version is set to false, because this isn't available by default for legacy databases
         version false
         id generator:'identity', column:'id'
         dicIdDictionaryInfo column:'dic_id'
    }
    Integer id
    String dicValue
    // Relation
    DictionaryInfo dicIdDictionaryInfo

    static constraints = {
        id(max: 2147483647)
        dicValue(size: 0..255)
        dicIdDictionaryInfo()
    }
    String toString() {
        return "${id}" 
    }
}
