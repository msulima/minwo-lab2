<%@ page import="todoapp.TodoList" %>



<div class="fieldcontain ${hasErrors(bean: todoListInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="todoList.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${todoListInstance?.name}"/>

</div>

