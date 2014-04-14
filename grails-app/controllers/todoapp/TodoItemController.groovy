package todoapp



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class TodoItemController {

    static allowedMethods = [toggleDone: "POST", save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        respond TodoItem.list(params), model:[todoItemInstanceCount: TodoItem.count()]
    }

    def show(TodoItem todoItemInstance) {
        respond todoItemInstance
    }

    def create() {
        respond new TodoItem(params)
    }

    @Transactional
    def save(TodoItem todoItemInstance) {
        if (todoItemInstance == null) {
            notFound()
            return
        }

        if (todoItemInstance.hasErrors()) {
            respond todoItemInstance.errors, view:'create'
            return
        }

        todoItemInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'todoItemInstance.label', default: 'TodoItem'), todoItemInstance.id])
                redirect todoItemInstance
            }
            '*' { respond todoItemInstance, [status: CREATED] }
        }
    }

    @Transactional
    def toggleDone(Long todoItemId) {
        def todoItemInstance = TodoItem.get(todoItemId)

        if (todoItemInstance == null) {
            notFound()
            return
        }

        todoItemInstance.done = !todoItemInstance.done
        todoItemInstance.save flush:true

        flash.message = message(code: 'todoItem.toggleDone.toggled')
        redirect todoItemInstance
    }

    def edit(TodoItem todoItemInstance) {
        respond todoItemInstance
    }

    @Transactional
    def update(TodoItem todoItemInstance) {
        if (todoItemInstance == null) {
            notFound()
            return
        }

        todoItemInstance.list = TodoItem.get(params['TodoListId'])

        if (todoItemInstance.hasErrors()) {
            respond todoItemInstance.errors, view:'edit'
            return
        }

        todoItemInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'TodoItem.label', default: 'TodoItem'), todoItemInstance.id])
                redirect todoItemInstance
            }
            '*'{ respond todoItemInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(TodoItem todoItemInstance) {

        if (todoItemInstance == null) {
            notFound()
            return
        }

        todoItemInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'TodoItem.label', default: 'TodoItem'), todoItemInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'todoItemInstance.label', default: 'TodoItem'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
