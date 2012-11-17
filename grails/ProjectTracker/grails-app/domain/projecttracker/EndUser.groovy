package projecttracker

class EndUser {
    String userName
    String password
    String fullName
    String toString (){
        "${fullName}"
    }
    static hasMany = [projects : Project, tasks : Task]

    static constraints = {
        fullName()
        userName()
        password(password: true)
    }
}
