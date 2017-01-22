package appelu


import grails.rest.*
import grails.converters.*
import appelu.User

class UserController extends RestfulController {
    static responseFormats = ['json', 'xml']
    UserController() {
        super(User)

        def post = {
            String name = request['name']
            String pass = request['pass']
            new User(name: name, age: 40, lastVisit: new Date())
            p.save()
        }


    }
}
