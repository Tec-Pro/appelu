package appelu


import grails.rest.*

@Resource(readOnly = false, formats = ['json', 'xml'])
class Service {
	String name
	Long duration 
	int status
	Long businessID 

}