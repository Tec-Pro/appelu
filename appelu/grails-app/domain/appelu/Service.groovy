package appelu


import grails.rest.*

@Resource(readOnly = false, formats = ['json', 'xml'])
class Service {
    static hasMany = [reserves: Reserve]
    static belongsTo = [business: Business]


    String name
    int duration
    boolean enable



}