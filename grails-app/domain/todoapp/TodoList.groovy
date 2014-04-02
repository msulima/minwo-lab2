package todoapp

class TodoList {

    static hasMany = [items: TodoItem]

    String name

    static mapping = {
        children cascade: "all-delete-orphan"
    }
}
