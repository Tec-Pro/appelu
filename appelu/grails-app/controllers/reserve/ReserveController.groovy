package reserve

import appelu.Reserve
import grails.rest.*
import grails.converters.*

class ReserveController extends RestfulController {
    static responseFormats = ['json', 'xml']
    ReserveController() {
       super(Reserve)
    }
}
