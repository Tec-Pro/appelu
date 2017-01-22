package appelu


import grails.rest.*
import groovy.time.TimeCategory

@Resource(readOnly = false, formats = ['json', 'xml'])
class Token {
    static belongsTo = [user: User]

    String token
    Date expiration



    def generator = { String alphabet, int n ->
        new Random().with {
            (1..n).collect { alphabet[ nextInt( alphabet.length() ) ] }.join()
        }
    }

    def beforeValidate() {
        tokenGenerator();
    }

    private void tokenGenerator(){
        def generator = { String alphabet, int n ->
            new Random().with {
                (1..n).collect { alphabet[ nextInt( alphabet.length() ) ] }.join()
            }
        }
        token =  generator( (('A'..'Z')+('0'..'9')).join(), 15 )
        while (Token.findByToken(token)){
            token =  generator( (('A'..'Z')+('0'..'9')).join(), 15 )
        }
        use(TimeCategory) {
            expiration = 1.month.from.now
        }
    }


}