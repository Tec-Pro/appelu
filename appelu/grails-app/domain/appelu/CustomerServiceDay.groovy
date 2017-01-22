package appelu


import grails.rest.*

import java.time.DayOfWeek

@Resource(readOnly = false, formats = ['json', 'xml'])
class CustomerServiceDay {
    static belongsTo = [business: Business]

    DayOfWeek day
    Date openingTime
    Date openingTime2
    Date closingTime
    Date closingTime2


}