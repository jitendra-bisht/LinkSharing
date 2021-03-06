
<%@ page import="com.bootcamp.Group" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'group.label', default: 'Group')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-group" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-group" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list group">
			
				<g:if test="${groupInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="group.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${groupInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${groupInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="group.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${groupInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${groupInstance?.address}">
				<li class="fieldcontain">
					<span id="address-label" class="property-label"><g:message code="group.address.label" default="Address" /></span>
					
						<g:each in="${groupInstance.address}" var="a">
						<span class="property-value" aria-labelledby="address-label"><g:link controller="address" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${groupInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="group.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${groupInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${groupInstance?.group}">
				<li class="fieldcontain">
					<span id="group-label" class="property-label"><g:message code="group.group.label" default="Group" /></span>
					
						<span class="property-value" aria-labelledby="group-label"><g:fieldValue bean="${groupInstance}" field="group"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${groupInstance?.order}">
				<li class="fieldcontain">
					<span id="order-label" class="property-label"><g:message code="group.order.label" default="Order" /></span>
					
						<span class="property-value" aria-labelledby="order-label"><g:fieldValue bean="${groupInstance}" field="order"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:groupInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${groupInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
