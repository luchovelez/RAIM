<%@ page import="audiodiccionarioweb.Vocabulario" %>



<div class="fieldcontain ${hasErrors(bean: vocabularioInstance, field: 'definicion', 'error')} required">
	<label for="definicion">
		<g:message code="vocabulario.definicion.label" default="Definicion" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="definicion" required="" value="${vocabularioInstance?.definicion}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: vocabularioInstance, field: 'palabra', 'error')} required">
	<label for="palabra">
		<g:message code="vocabulario.palabra.label" default="Palabra" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="palabra" required="" value="${vocabularioInstance?.palabra}"/>

</div>

