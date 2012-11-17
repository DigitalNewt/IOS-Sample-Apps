package projecttracker

class TaskController {
    def beforeInterceptor = [action:this.&auth]

    def scaffold=true

    def auth() {
        if(!session.user) {
            redirect(controller:"EndUser", action:"login")
            return false
        }
    }
    def index = {
        redirect (action: list)
    }
}
