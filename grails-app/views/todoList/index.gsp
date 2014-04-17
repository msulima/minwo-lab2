
<%@ page import="todoapp.TodoList" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'todoList.label', default: 'TodoList')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="list-todoList" class="content scaffold-list" role="main">
			<h1>${entityName}</h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:if test="${todoListInstanceList?.empty}">
      <div class="alert alert-info">
          Nie ma jeszcze żadnych zadań.
          <g:link class="create" action="create">Kliknij tutaj aby je utworzyć.</g:link>
      </div>
			</g:if>
			<g:else>
			<table class="table">
			<thead>
					<tr> 
						<g:sortableColumn property="name" title="${message(code: 'todoList.name.label', default: 'Name')}" />
						<th>Liczba zadań</th>
					</tr>
				</thead>
				<tbody>
				<g:each in="${todoListInstanceList}" status="i" var="todoListInstance">
					<tr>
						<td><g:link action="show" id="${todoListInstance.id}">${fieldValue(bean: todoListInstance, field: "name")}</g:link></td>
						<td><span class="label label-primary">${todoListInstance.items.size()}</span></td>
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${todoListInstanceCount ?: 0}" />
			</div>
            <span class="btn btn-default"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
			</g:else>
		</div>
	</body>
</html>
