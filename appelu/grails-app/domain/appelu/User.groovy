package appelu


import grails.rest.*
import org.springframework.*

@Resource(readOnly = false, formats = ['json', 'xml'])
class User {
    static hasMany = [tokens: Token, reserves: Reserve]
    static hasOne = [business: Business]

    transient springSecurityService

    String name
    String pass
    String role
    boolean enable
    String phone

    static constraints = {
        name unique: true, nullable: false, blank: false
        pass blank: false, nullable: false
        phone blank: false, nullable: false
    }

    def beforeInsert() {
        encodePassword()
    }

    def beforeUpdate() {
        if (isDirty('password')) {
            encodePassword()
        }
    }

    protected void encodePassword() {
        pass = springSecurityService?.passwordEncoder ? springSecurityService.encodePassword(pass) : pass
    }

}