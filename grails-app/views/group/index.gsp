
<%@ page import="com.bootcamp.Group" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'group.label', default: 'Group')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-group" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-group" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'group.dateCreated.label', default: 'Date Created')}" />
					
						<g:sortableColumn property="lastUpdated" title="${message(code: 'group.lastUpdated.label', default: 'Last Updated')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'group.description.label', default: 'Description')}" />
					
						<g:sortableColumn property="group" title="${message(code: 'group.group.label', default: 'Group')}" />
					
						<g:sortableColumn property="order" title="${message(code: 'group.order.label', default: 'Order')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${groupInstanceList}" status="i" var="groupInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${groupInstance.id}">${fieldValue(bean: groupInstance, field: "dateCreated")}</g:link></td>
					
						<td><g:formatDate date="${groupInstance.lastUpdated}" /></td>
					
						<td>${fieldValue(bean: groupInstance, field: "description")}</td>
					
						<td>${fieldValue(bean: groupInstance, field: "group")}</td>
					
						<td>${fieldValue(bean: groupInstance, field: "order")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${groupInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
