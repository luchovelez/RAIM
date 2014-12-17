
<%@ page import="audiotext.Texto" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
                 <asset:javascript src="mespeak.js"/>
                <asset:script type="text/javascript">
                 meSpeak.loadConfig("mespeak_config.json");
                 meSpeak.loadVoice("voices/es-la.json");
                </asset:script>
		<g:set var="entityName" value="${message(code: 'texto.label', default: 'Texto')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-texto" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-texto" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list texto">
			
				
			
				<g:if test="${textoInstance?.titulo}">
				<li class="fieldcontain">
					<span id="titulo-label" class="property-label"><g:message code="texto.titulo.label" default="Titulo" /></span>
					
						<span class="property-value" aria-labelledby="titulo-label"><g:fieldValue bean="${textoInstance}" field="titulo"/></span>
					
				</li>
				</g:if>
                                
                                <g:if test="${textoInstance?.texto}">
				<li class="fieldcontain">
					<span id="texto-label" class="property-label"><g:message code="texto.texto.label" default="Texto" /></span>
					<div id="${fieldValue(bean: textoInstance, field: "texto")}">
						<span class="property-value" aria-labelledby="texto-label"><g:fieldValue bean="${textoInstance}" field="texto"/></span>
					</div>
                                        <script type="text/javascript" src="http://vozme.com/get_text.js"></script>
                                        <a href="javascript:void(0);" onclick="get_id('${fieldValue(bean: textoInstance, field: "texto")}','es','fm');">
                                        <asset:image src="speaker-1-512.png" alt="Escuchar" height="54" width="62"/></a></div>
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:textoInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${textoInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
