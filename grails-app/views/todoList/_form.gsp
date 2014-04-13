<%@ page import="todoapp.TodoList" %>



<div class="fieldcontain ${hasErrors(bean: todoListInstance, field: 'name', 'error')} form-group ">
	<label for="name">
		<g:message code="todoList.name.label" default="Name" />
		
	</label>
  <input type="text" name="name" value="${todoListInstance?.name}" class="form-control" placeholder="Wprowadź nazwę"/>

</div>

