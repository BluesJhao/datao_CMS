package com.iminer.biz.ioperation.entity;
/**
 * The ServerInfo entity.
 *
 * @author    
 *
 *
 */
class ServerInfo {
    static mapping = {
         table 'ioperation_server_info'
         // version is set to false, because this isn't available by default for legacy databases
         version false
		 id generator:'assigned', column:'id'
    }
    String id
    String pid
    String scode
    Integer typeId
    Integer raidId
    Integer supportId
    Integer modelId
    Integer houseId
    Byte cpuNum
    Integer memorySize
    Integer diskSize
    Integer systemId
    Date onlineTime
    Integer personId

    static constraints = {
        id(size: 1..128, blank: false)
        pid(size: 0..128,nullable: true)
        scode(size: 0..128)
        typeId(nullable: true, max: 2147483647)
        raidId(nullable: true, max: 2147483647)
        supportId(nullable: true, max: 2147483647)
        modelId(nullable: true, max: 2147483647)
        houseId(nullable: true, max: 2147483647)
        cpuNum(nullable: true)
        memorySize(nullable: true, max: 2147483647)
        diskSize(nullable: true, max: 2147483647)
        systemId(nullable: true, max: 2147483647)
        onlineTime(nullable: true)
        personId(nullable: true, max: 2147483647)
    }
    String toString() {
        return "${id}" 
    }
}
