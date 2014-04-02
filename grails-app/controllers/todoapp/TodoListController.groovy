package todoapp



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class TodoListController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond TodoList.list(params), model:[todoListInstanceCount: TodoList.count()]
    }

    def show(TodoList todoListInstance) {
        respond todoListInstance
    }

    def create() {
        respond new TodoList(params)
    }

    @Transactional
    def save(TodoList todoListInstance) {
        if (todoListInstance == null) {
            notFound()
            return
        }

        if (todoListInstance.hasErrors()) {
            respond todoListInstance.errors, view:'create'
            return
        }

        todoListInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'todoListInstance.label', default: 'TodoList'), todoListInstance.id])
                redirect todoListInstance
            }
            '*' { respond todoListInstance, [status: CREATED] }
        }
    }

    def edit(TodoList todoListInstance) {
        respond todoListInstance
    }

    @Transactional
    def update(TodoList todoListInstance) {
        if (todoListInstance == null) {
            notFound()
            return
        }

        if (todoListInstance.hasErrors()) {
            respond todoListInstance.errors, view:'edit'
            return
        }

        todoListInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'TodoList.label', default: 'TodoList'), todoListInstance.id])
                redirect todoListInstance
            }
            '*'{ respond todoListInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(TodoList todoListInstance) {

        if (todoListInstance == null) {
            notFound()
            return
        }

        todoListInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'TodoList.label', default: 'TodoList'), todoListInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'todoListInstance.label', default: 'TodoList'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
