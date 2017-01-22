package appelu


import grails.rest.*
import grails.converters.*

class ReserveController extends RestfulController {
    static responseFormats = ['json', 'xml']
    ReserveController() {
        super(Reserve)
    }
}
