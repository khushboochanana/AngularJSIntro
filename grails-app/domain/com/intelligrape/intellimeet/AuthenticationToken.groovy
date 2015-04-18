package com.intelligrape.intellimeet

class AuthenticationToken {
    String tokenValue
    String username

    static mapping = {
        version false
    }
    static constraints = {
        username blank: false
        tokenValue blank: false
    }

}
