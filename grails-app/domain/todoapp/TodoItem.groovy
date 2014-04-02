package todoapp

class TodoItem {

    static belongsTo = [list:TodoList]

    String content
    boolean done

}
