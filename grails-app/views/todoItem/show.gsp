
<%@ page import="todoapp.TodoItem" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'todoItem.label', default: 'TodoItem')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-todoItem" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-todoItem" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list todoItem">
			
				<g:if test="${todoItemInstance?.content}">
				<li class="fieldcontain">
					<span id="content-label" class="property-label"><g:message code="todoItem.content.label" default="Content" /></span>
					
						<span class="property-value" aria-labelledby="content-label"><g:fieldValue bean="${todoItemInstance}" field="content"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${todoItemInstance?.done}">
				<li class="fieldcontain">
					<span id="done-label" class="property-label"><g:message code="todoItem.done.label" default="Done" /></span>
					
						<span class="property-value" aria-labelledby="done-label"><g:formatBoolean boolean="${todoItemInstance?.done}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${todoItemInstance?.list}">
				<li class="fieldcontain">
					<span id="list-label" class="property-label"><g:message code="todoItem.list.label" default="List" /></span>
					
						<span class="property-value" aria-labelledby="list-label"><g:link controller="todoList" action="show" id="${todoItemInstance?.list?.id}">${todoItemInstance?.list?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:todoItemInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${todoItemInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
