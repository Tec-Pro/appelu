package appelu


import grails.rest.*

@Resource(readOnly = false, formats = ['json', 'xml'])
class Business {
    static belongsTo = [user: User]
    static hasMany = [customerServiceDay: CustomerServiceDay, services: Service]

    String name
    boolean enable


    static constraints = {
        user nullable: false
        name unique: true, blank: false, nullable: false
    }

}