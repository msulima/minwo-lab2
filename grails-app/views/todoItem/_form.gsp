<%@ page import="todoapp.TodoItem" %>



<div class="fieldcontain ${hasErrors(bean: todoItemInstance, field: 'content', 'error')} ">
	<label for="content">
		<g:message code="todoItem.content.label" default="Content" />
		
	</label>
	<g:textField name="content" value="${todoItemInstance?.content}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: todoItemInstance, field: 'done', 'error')} ">
	<label for="done">
		<g:message code="todoItem.done.label" default="Done" />
		
	</label>
	<g:checkBox name="done" value="${todoItemInstance?.done}" />

</div>

<div class="fieldcontain ${hasErrors(bean: todoItemInstance, field: 'list', 'error')} required">
	<label for="list">
		<g:message code="todoItem.list.label" default="List" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="list" name="list.id" from="${todoapp.TodoList.list()}" optionKey="id" optionValue="name" required="" value="${todoItemInstance?.list?.id}" class="many-to-one"/>

</div>

