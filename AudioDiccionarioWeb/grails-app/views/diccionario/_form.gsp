<%@ page import="audiodiccionarioweb.Diccionario" %>



<div class="fieldcontain ${hasErrors(bean: diccionarioInstance, field: 'nivelEducativo', 'error')} required">
	<label for="nivelEducativo">
		<g:message code="diccionario.nivelEducativo.label" default="Nivel Educativo" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nivelEducativo" required="" value="${diccionarioInstance?.nivelEducativo}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: diccionarioInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="diccionario.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" required="" value="${diccionarioInstance?.nombre}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: diccionarioInstance, field: 'vocabulario', 'error')} ">
	<label for="vocabulario">
		<g:message code="diccionario.vocabulario.label" default="Vocabulario" />
		
	</label>
	<g:select name="vocabulario" from="${audiodiccionarioweb.Vocabulario.list()}" multiple="multiple" optionKey="id" size="5" value="${diccionarioInstance?.vocabulario*.id}" class="many-to-many"/>

</div>

