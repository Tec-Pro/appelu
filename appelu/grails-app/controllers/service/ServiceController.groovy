package service

import appelu.Service
import grails.rest.*
import grails.converters.*

class ServiceController extends RestfulController {
    static responseFormats = ['json', 'xml']
    ServiceController() {
        super(Service)
    }
}
