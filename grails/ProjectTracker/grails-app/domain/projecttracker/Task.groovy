package projecttracker

class Task {
    String name
    String description
    Date dueDate
    String toString (){
        "${name}"
    }
    static belongsTo = [assignee : EndUser, project : Project]

    static constraints = {
        name()
        description()
        dueDate()
    }
}
