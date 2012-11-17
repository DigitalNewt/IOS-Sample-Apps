package com.example
import org.bson.types.ObjectId

class User {
    ObjectId id
    def springSecurityService
    String username
    String password
    String email
    boolean enabled
    boolean accountExpired
    boolean accountLocked
    boolean passwordExpired
    Set authorities

    static transients = ["springSecurityService"]
    static embedded = ['authorities']
    static constraints = {
        username blank: false, unique: true,size: 2..32,matches: "[a-zA-Z0-9_]+"
        email blank: false, unique:true,email:true
        password blank: false,size:6..64
    }

    static mapping = {
        password column: '`password`'
    }

    def beforeInsert() {
        encodePassword()
    }

    def beforeUpdate() {
        if (isDirty('password')) {
            encodePassword()
        }
    }

    protected void encodePassword() {
        password = springSecurityService.encodePassword(password)
    }
}
