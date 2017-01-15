package appelu


import grails.rest.*

@Resource(uri = '/businesses', readOnly = false, formats = ['json', 'xml'])
class Business {
	String name
	Long userId
	boolean status

	static constraints = {
		name blank: false, unique: true
		userId blank: false
	}


}