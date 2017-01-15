package appelu


import grails.rest.*

@Resource(readOnly = false, formats = ['json', 'xml'])
class User {
	String name
	String pass
	String phone
	int status
	int role


}