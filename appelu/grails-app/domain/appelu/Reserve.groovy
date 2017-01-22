package appelu


import grails.rest.*

@Resource(readOnly = false, formats = ['json', 'xml'])
class Reserve {
    static belongsTo = [user: User,service: Service]

    boolean enable
    String comment
    Date startTime
    Date endTime


}