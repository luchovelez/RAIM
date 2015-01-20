
<%@ page import="audiodiccionarioweb.Diccionario" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'diccionario.label', default: 'Diccionario')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-diccionario" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-diccionario" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list diccionario">
			
				<g:if test="${diccionarioInstance?.nivelEducativo}">
				<li class="fieldcontain">
					<span id="nivelEducativo-label" class="property-label"><g:message code="diccionario.nivelEducativo.label" default="Nivel Educativo" /></span>
					
						<span class="property-value" aria-labelledby="nivelEducativo-label"><g:fieldValue bean="${diccionarioInstance}" field="nivelEducativo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${diccionarioInstance?.nombre}">
				<li class="fieldcontain">
					<span id="nombre-label" class="property-label"><g:message code="diccionario.nombre.label" default="Nombre" /></span>
					
						<span class="property-value" aria-labelledby="nombre-label"><g:fieldValue bean="${diccionarioInstance}" field="nombre"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${diccionarioInstance?.vocabulario}">
				<li class="fieldcontain">
					<span id="vocabulario-label" class="property-label"><g:message code="diccionario.vocabulario.label" default="Vocabulario" /></span>
					
						<g:each in="${diccionarioInstance.vocabulario}" var="v">
						<span class="property-value" aria-labelledby="vocabulario-label"><g:link controller="vocabulario" action="show" id="${v.id}">${v?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:diccionarioInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${diccionarioInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
