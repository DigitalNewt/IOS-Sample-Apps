package projecttracker

class Project {
    String name
    String description
    Date dueDate
    String billingType
    String toString (){
        "${name}"
    }
    static belongsTo = [owner : EndUser]
    static hasMany = [tasks : Task]

    static constraints = {
        name(blank: false, unique: true)
        description()
        dueDate(min: new Date())
        billingType(blank: true, inList: ["Hourly","Milestone","Non-billable"])
    }
}
