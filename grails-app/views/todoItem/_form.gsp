<%@ page import="todoapp.TodoItem" %>



<div class="fieldcontain ${hasErrors(bean: todoItemInstance, field: 'content', 'error')} form-group">
	<label for="content">
		<g:message code="todoItem.content.label" default="Content" />
		
	</label>
    <input type="text" name="content" value="${todoItemInstance?.content}" class="form-control" placeholder="Wprowadź treść"/>

</div>

<div class="fieldcontain ${hasErrors(bean: todoItemInstance, field: 'done', 'error')} ">
	<label for="done">
		<g:message code="todoItem.done.label" default="Done" />
        <input type="checkbox" name="done" id="done">
	</label>

</div>

<input type="hidden" name="list" value="${params['TodoListId']}" />

</br>

