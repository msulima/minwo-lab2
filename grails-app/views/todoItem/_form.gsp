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

<div class="fieldcontain ${hasErrors(bean: todoItemInstance, field: 'list', 'error')} required">
	<label for="list">
		<g:message code="todoItem.list.label" default="List" />
		<span class="required-indicator">*</span>
	</label>

    <select id="list" name="list.id" required="" class="many-to-one form-control">
    <g:each in="${todoapp.TodoList.list()}" status="i" var="item">
    <option value="${item.id}">${item.name}</option>
	</g:each>
    </select>
</div>
</br>

