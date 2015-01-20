
<%@ page import="audiodiccionarioweb.Vocabulario" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'vocabulario.label', default: 'Vocabulario')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-vocabulario" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-vocabulario" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="definicion" title="${message(code: 'vocabulario.definicion.label', default: 'Definicion')}" />
					
						<g:sortableColumn property="palabra" title="${message(code: 'vocabulario.palabra.label', default: 'Palabra')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${vocabularioInstanceList}" status="i" var="vocabularioInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${vocabularioInstance.id}">${fieldValue(bean: vocabularioInstance, field: "definicion")}</g:link></td>
					
						<td>${fieldValue(bean: vocabularioInstance, field: "palabra")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${vocabularioInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
