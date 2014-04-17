
<%@ page import="todoapp.TodoItem" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'todoItem.label', default: 'TodoItem')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="show-todoItem" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message alert alert-success" role="status">${flash.message}</div>
			</g:if>
      <p>
          <span id="name-label" class="property-label"><g:message code="todoItem.content.label" default="Name" /></span>
          <strong><g:fieldValue bean="${todoItemInstance}" field="content"/></strong>
      </p>
      <p>
          <span id="name-label" class="property-label"><g:message code="todoItem.done.label" default="Name" /></span>
          <strong><g:formatBoolean boolean="${todoItemInstance.done}" /></strong>
      </p>
      <p>
          <span id="name-label" class="property-label"><g:message code="todoItem.list.label" default="Name" /></span>
          <g:link resource="TodoList" action="show" id="${todoItemInstance.list.id}">
          <strong><g:fieldValue bean="${todoItemInstance.list}" field="name"/></strong>
          </g:link>
      </p>
			<g:form url="[resource:todoItemInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit btn btn-primary" action="edit" resource="${todoItemInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete btn btn-danger" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
