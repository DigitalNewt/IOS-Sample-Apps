import com.example.Role
import com.example.User
class BootStrap {

    def init = { servletContext ->
        def userRole = new Role(authority:"ROLE_USER").save(flush:true)
        def user = new User()
        user.username = "example"
        user.password = "password"
        user.email = "example@email.com"
        user.enabled = true
        user.accountExpired = false
        user.accountLocked = false
        user.passwordExpired = false
        user.authorities = [userRole]
        user.save(flush:true)

    }
    def destroy = { }
}
