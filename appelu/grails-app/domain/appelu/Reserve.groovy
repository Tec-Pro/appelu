package appelu


import grails.rest.*

@Resource(readOnly = false, formats = ['json', 'xml'])
class Reserve {
	Long userId 
	Long serviceId
	int status
	String comment 
	Date StartTime
	Date EndTime

}