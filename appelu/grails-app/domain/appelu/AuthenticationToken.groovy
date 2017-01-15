package appelu


import grails.rest.*

@Resource(readOnly = false, formats = ['json', 'xml'])
class AuthenticationToken {

    String tokenValue
    String username

    static mapping = {
        version false
    }

}