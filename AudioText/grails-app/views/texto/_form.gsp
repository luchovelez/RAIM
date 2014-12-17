<%@ page import="audiotext.Texto" %>



<div class="fieldcontain ${hasErrors(bean: textoInstance, field: 'texto', 'error')} required">
	<label for="texto">
		<g:message code="texto.texto.label" default="Texto" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="texto" required="" value="${textoInstance?.texto}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: textoInstance, field: 'titulo', 'error')} required">
	<label for="titulo">
		<g:message code="texto.titulo.label" default="Titulo" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="titulo" required="" value="${textoInstance?.titulo}"/>

</div>

