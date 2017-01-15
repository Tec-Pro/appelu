package appelu


import grails.rest.*

@Resource(readOnly = false, formats = ['json', 'xml'])
class Business {
	String name
	Long userId
	boolean status

}