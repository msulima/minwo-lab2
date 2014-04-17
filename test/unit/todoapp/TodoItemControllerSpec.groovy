package todoapp



import grails.test.mixin.*
import spock.lang.*

@TestFor(TodoItemController)
@Mock([TodoItem, TodoList])
class TodoItemControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        def todoList = new TodoList()
        todoList.name = 'list name'
        todoList.save flush:true
        params["list"] = 1
        params["content"] = 'someValidName'
        params["done"] = true
    }

    void "Test the index action returns the correct model"() {

        when:"The index action is executed"
            controller.index()

        then:"The model is correct"
            !model.todoItemInstanceList
            model.todoItemInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when:"The create action is executed"
            controller.create()

        then:"The model is correctly created"
            model.todoItemInstance!= null
    }

    void "Test the save action correctly persists an instance"() {

        when:"The save action is executed with an invalid instance"
            request.contentType = FORM_CONTENT_TYPE
            def todoItem = new TodoItem()
            todoItem.validate()
            controller.save(todoItem)

        then:"The create view is rendered again with the correct model"
            model.todoItemInstance!= null
            view == 'create'

        when:"The save action is executed with a valid instance"
            response.reset()
            populateValidParams(params)
            todoItem = new TodoItem(params)

            controller.save(todoItem)

        then:"A redirect is issued to the show action"
            response.redirectedUrl == '/todoItem/show/1'
            controller.flash.message != null
            TodoItem.count() == 1
    }

    void "Should toggle done value"() {

        when:"The toggle action is executed with a valid instance"
            response.reset()
            populateValidParams(params)
            def todoItem = new TodoItem(params).save(flush: true)

            controller.toggleDone(todoItem)

        then:"A redirect is issued to the show action"
            response.redirectedUrl == '/todoList/show/1'
            controller.flash.message != null
            TodoItem.count() == 1
            TodoItem.get(todoItem.id).done == false
    }

    void "Test that the show action returns the correct model"() {
        when:"The show action is executed with a null domain"
            controller.show(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the show action"
            populateValidParams(params)
            def todoItem = new TodoItem(params)
            controller.show(todoItem)

        then:"A model is populated containing the domain instance"
            model.todoItemInstance == todoItem
    }

    void "Test that the edit action returns the correct model"() {
        when:"The edit action is executed with a null domain"
            controller.edit(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the edit action"
            populateValidParams(params)
            def todoItem = new TodoItem(params)
            controller.edit(todoItem)

        then:"A model is populated containing the domain instance"
            model.todoItemInstance == todoItem
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when:"Update is called for a domain instance that doesn't exist"
            request.contentType = FORM_CONTENT_TYPE
            controller.update(null)

        then:"A 404 error is returned"
            response.redirectedUrl == '/todoItem/index'
            flash.message != null


        when:"An invalid domain instance is passed to the update action"
            response.reset()
            def todoItem = new TodoItem()
            todoItem.validate()
            controller.update(todoItem)

        then:"The edit view is rendered again with the invalid instance"
            view == 'edit'
            model.todoItemInstance == todoItem

        when:"A valid domain instance is passed to the update action"
            response.reset()
            populateValidParams(params)
            todoItem = new TodoItem(params).save(flush: true)
            controller.update(todoItem)

        then:"A redirect is issues to the show action"
            response.redirectedUrl == "/todoItem/show/$todoItem.id"
            flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when:"The delete action is called for a null instance"
            request.contentType = FORM_CONTENT_TYPE
            controller.delete(null)

        then:"A 404 is returned"
            response.redirectedUrl == '/todoItem/index'
            flash.message != null

        when:"A domain instance is created"
            response.reset()
            populateValidParams(params)
            def todoItem = new TodoItem(params).save(flush: true)

        then:"It exists"
            TodoItem.count() == 1

        when:"The domain instance is passed to the delete action"
            controller.delete(todoItem)

        then:"The instance is deleted"
            TodoItem.count() == 0
            response.redirectedUrl == '/todoItem/index'
            flash.message != null
    }
}
