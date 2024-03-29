
<%@ page import="todoapp.TodoList" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'todoList.label', default: 'TodoList')}" />
		<g:set var="todoItemName" value="${message(code: 'todoItem.label', default: 'TodoItem')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="show-todoList" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message alert alert-success" role="status">${flash.message}</div>
			</g:if>

      <p>
          <span id="name-label" class="property-label"><g:message code="todoList.name.label" default="Name" /></span>
          <strong><g:fieldValue bean="${todoListInstance}" field="name"/></strong>
      </p>

      <g:if test="${todoListInstance?.items?.empty}">
      <div class="alert alert-info">
          Nie ma jeszcze żadnych zadań na tej liście.
      </div>
      </g:if>
      <g:else>
        <table class="table table-striped">
        <thead>
                <tr>
                    <th>#</th>
                    <th><g:message code="todoItem.content.label" default="List" /></th>
                    <th><g:message code="todoItem.done.label" default="List" /></th>
                    <th><g:message code="todoItem.toggleDone.label" default="List" /></th>
                </tr>
            </thead>
            <tbody>
            <g:each in="${todoListInstance.items}" status="i" var="item">
                <tr>
                    <td>${i+1}</td>
                    <td><g:link resource="TodoList/TodoItem" action="show" TodoListId="${item.list.id}" id="${item.id}">${fieldValue(bean: item, field: "content")}</g:link></td>
                    <td>
                        <i class="glyphicon glyphicon-${item.done ? 'ok' : 'remove'}"></i>
                    </td>
                    <td>
                        <g:link class="btn btn-xs btn-${item.done ? 'danger' : 'success'}" resource="TodoItem" action="toggleDone" method="GET" id="${item.id}">
                        <g:if test="${item.done}">
                            <g:message code="todoItem.toggleDone.off.label" />
                        </g:if>
                        <g:else>
                            <g:message code="todoItem.toggleDone.on.label" />
                        </g:else>
                        </g:link>
                    </td>
                </tr>
            </g:each>
            </tbody>
        </table>
      </g:else>
                    <g:link class="btn btn-info" resource="TodoList/TodoItem" action="create" method="GET" TodoListId="${params['id']}">
                        <g:message code="todoList.addItem" />
                    </g:link>
      <hr/>
			
			<g:form url="[resource:todoListInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit btn btn-primary" action="edit" resource="${todoListInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete btn btn-danger" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
