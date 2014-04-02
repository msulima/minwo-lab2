
<%@ page import="todoapp.TodoItem" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'todoItem.label', default: 'TodoItem')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-todoItem" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-todoItem" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
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
					
						<td>${fieldValue(bean: todoItemInstance, field: "list")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${todoItemInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
