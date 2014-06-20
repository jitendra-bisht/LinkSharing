<%@ page import="com.bootcamp.Group" %>



<div class="fieldcontain ${hasErrors(bean: groupInstance, field: 'address', 'error')} ">
	<label for="address">
		<g:message code="group.address.label" default="Address" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${groupInstance?.address?}" var="a">
    <li><g:link controller="address" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="address" action="create" params="['group.id': groupInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'address.label', default: 'Address')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: groupInstance, field: 'description', 'error')} required">
	<label for="description">
		<g:message code="group.description.label" default="Description" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="description" required="" value="${groupInstance?.description}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: groupInstance, field: 'group', 'error')} required">
	<label for="group">
		<g:message code="group.group.label" default="Group" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="group" required="" value="${groupInstance?.group}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: groupInstance, field: 'order', 'error')} required">
	<label for="order">
		<g:message code="group.order.label" default="Order" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="order" type="number" value="${groupInstance.order}" required=""/>

</div>

