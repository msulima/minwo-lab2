
<%@ page import="todoapp.TodoItem" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'todoItem.label', default: 'TodoItem')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="list-todoItem" class="content scaffold-list" role="main">
			<h1>Zadania</h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:if test="${todoListInstanceList?.empty}">
      <div class="alert alert-info">
          Nie ma jeszcze żadnych punktów na tej liście.
            <g:link resource="TodoList/TodoItem" action="create" method="GET" TodoListId="${params['TodoListId']}">
                <g:message code="default.new.label" args="[entityName]" />
            </g:link>
      </div>
			</g:if>
			<g:else>
			<table class="table">
			<thead>
					<tr>
						<g:sortableColumn property="content" title="${message(code: 'todoItem.content.label', default: 'Content')}" />
						<g:sortableColumn property="done" title="${message(code: 'todoItem.done.label', default: 'Done')}" />
						<th><g:message code="todoItem.list.label" default="List" /></th>
					</tr>
				</thead>
				<tbody>
				<g:each in="${todoItemInstanceList}" status="i" var="todoItemInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						<td><g:link action="show" id="${todoItemInstance.id}">${fieldValue(bean: todoItemInstance, field: "content")}</g:link></td>
						<td><g:formatBoolean boolean="${todoItemInstance.done}" /></td>
						<td>${fieldValue(bean: todoItemInstance.list, field: "name")}</td>
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${todoItemInstanceCount ?: 0}" />
			</div>
        <span class="btn btn-default">
            <g:link resource="TodoList/TodoItem" action="create" method="GET" TodoListId="${params['TodoListId']}">
                <g:message code="default.new.label" args="[entityName]" />
            </g:link>
        </span>
			</g:else>
		</div>
	</body>
</html>
