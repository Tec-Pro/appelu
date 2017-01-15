package appelu


import grails.rest.*

@Resource(uri = '/reserves', readOnly = false, formats = ['json', 'xml'])
class Reserve {
	Long userId 
	Long serviceId
	int status
	String comment 
	Date startTime
	Date endTime

	static constraints = {
		userId blank: false
		serviceId blank: false
		startTime blank: false
		endTime blank: false
	}

}