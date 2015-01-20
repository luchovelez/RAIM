
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
                  <!--      <fieldset class="form">
    <g:form action="list" method="GET">
        <div class="fieldcontain">
            <label for="query">Buscar palabra:</label>
            <g:textField name="query" value="${params.query.encodeAsURL()}"/><input type="submit" value="Buscar" />
        </div>
    </g:form>
</fieldset>-->
<div class="fieldcontain">
 <g:form action="search">
    <div class="search">
        Buscar palabra
        <input type="text" name="q" value="${params.q}" x-webkit-speech="x-webkit-speech" />
        <input type="submit" value="Search" />
    </div>
</g:form>
</div>
<table>
			<thead>
					<tr>
					
						
						<g:sortableColumn property="palabra" title="${message(code: 'vocabulario.palabra.label', default: 'Palabra')}" />
                                                <g:sortableColumn property="definicion" title="${message(code: 'vocabulario.definicion.label', default: 'Definicion')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${vocabularioInstanceList}" status="i" var="vocabularioInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${vocabularioInstance.id}">${fieldValue(bean: vocabularioInstance, field: "palabra")}</g:link></td>
					
						<td>${fieldValue(bean: vocabularioInstance, field: "definicion")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${vocabularioInstanceTotal}" params="${params}" />
			</div>
		</div>
                
	</body>
</html>
