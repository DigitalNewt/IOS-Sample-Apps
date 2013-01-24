package com.testapp
import grails.plugins.springsecurity.Secured

@Secured(['ROLE_ADMIN'])
class SecureController {
    def index = {
        render 'Secure access only'
    }
}