package projecttracker

class ProjectController {

    def beforeInterceptor = [action:this.&auth]

    def scaffold=true

    def auth() {
        if(!session.user) {
            redirect(controller:"User", action:"login")
            return false
        }
    }

}