<%@ page import="com.bootcamp.Group" %>



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

