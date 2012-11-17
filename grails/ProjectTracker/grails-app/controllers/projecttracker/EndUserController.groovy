package projecttracker

import org.springframework.dao.DataIntegrityViolationException

class EndUserController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "login", params: params)
    }

    def login = {}

    def authenticate = {
        def user = EndUser.findByUserNameAndPassword(params.userName, params.password)
        if(user){
            session.user = user
            flash.message = "Hello ${user.fullName}!"
            redirect(action:"login")

        }else{
            flash.message = "Sorry, ${params.userName}. Please try again."
            redirect(action:"login")
        }
    }

    def logout = {
        flash.message = "Goodbye ${session.user.fullName}"
        session.user = null
        redirect(action:"login")
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [endUserInstanceList: EndUser.list(params), endUserInstanceTotal: EndUser.count()]
    }

    def create() {
        [endUserInstance: new EndUser(params)]
    }

    def save() {
        def endUserInstance = new EndUser(params)
        if (!endUserInstance.save(flush: true)) {
            render(view: "create", model: [endUserInstance: endUserInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'endUser.label', default: 'EndUser'), endUserInstance.id])
        redirect(action: "show", id: endUserInstance.id)
    }

    def show(Long id) {
        def endUserInstance = EndUser.get(id)
        if (!endUserInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'endUser.label', default: 'EndUser'), id])
            redirect(action: "list")
            return
        }

        [endUserInstance: endUserInstance]
    }

    def edit(Long id) {
        def endUserInstance = EndUser.get(id)
        if (!endUserInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'endUser.label', default: 'EndUser'), id])
            redirect(action: "list")
            return
        }

        [endUserInstance: endUserInstance]
    }

    def update(Long id, Long version) {
        def endUserInstance = EndUser.get(id)
        if (!endUserInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'endUser.label', default: 'EndUser'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (endUserInstance.version > version) {
                endUserInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'endUser.label', default: 'EndUser')] as Object[],
                          "Another user has updated this EndUser while you were editing")
                render(view: "edit", model: [endUserInstance: endUserInstance])
                return
            }
        }

        endUserInstance.properties = params

        if (!endUserInstance.save(flush: true)) {
            render(view: "edit", model: [endUserInstance: endUserInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'endUser.label', default: 'EndUser'), endUserInstance.id])
        redirect(action: "show", id: endUserInstance.id)
    }

    def delete(Long id) {
        def endUserInstance = EndUser.get(id)
        if (!endUserInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'endUser.label', default: 'EndUser'), id])
            redirect(action: "list")
            return
        }

        try {
            endUserInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'endUser.label', default: 'EndUser'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'endUser.label', default: 'EndUser'), id])
            redirect(action: "show", id: id)
        }
    }
}
