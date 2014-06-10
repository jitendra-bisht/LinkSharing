<%@ page import="com.bootcamp.Address" %>



<div class="fieldcontain ${hasErrors(bean: addressInstance, field: 'city', 'error')} required">
	<label for="city">
		<g:message code="address.city.label" default="City" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="city" required="" value="${addressInstance?.city}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: addressInstance, field: 'group', 'error')} required">
	<label for="group">
		<g:message code="address.group.label" default="Group" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="group" name="group.id" from="${com.bootcamp.Group.list()}" optionKey="id" required="" value="${addressInstance?.group?.id}" class="many-to-one"/>

</div>

