package appelu


import grails.rest.*

@Resource(readOnly = false, formats = ['json', 'xml'])
class CustomerServiceDay {
	Long businessId
	int day
	Date openingTime
	Date openingTime2
	Date closingTime 
	Date closingTime2

}