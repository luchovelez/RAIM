
<%@ page import="audiodiccionarioweb.Vocabulario" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'vocabulario.label', default: 'Vocabulario')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-vocabulario" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-vocabulario" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list vocabulario">
                            <g:if test="${vocabularioInstance?.palabra}">
				<li class="fieldcontain">
					<span id="palabra-label" class="property-label"><g:message code="vocabulario.palabra.label" default="Palabra" /></span>
					
						<span class="property-value" aria-labelledby="palabra-label"><g:fieldValue bean="${vocabularioInstance}" field="palabra"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${vocabularioInstance?.definicion}">
				<li class="fieldcontain">
                                    
                                    
                                    
					<span id="definicion-label" class="property-label"><g:message code="vocabulario.definicion.label" default="Definicion" /></span>
					 <div id="alice2">
                                        <span class="property-value" aria-labelledby="definicion-label"><g:fieldValue bean="${vocabularioInstance}" field="definicion"/></span>
                                        </div>

                                       


<script type="text/javascript" src="http://vozme.com/get_text.js"></script>
<button style="background-color:white; 
 background-image:
 url(http://vozme.com/img/megaphone40x40w.gif); 
 background-position: left center; 
 background-repeat:no-repeat; 
 height: 48px; font-size:70%; 
 padding:4px 4px 4px 44px;" 
 onclick="get_id('alice2','es','fm');">
Escuchar el Texto</button>
                                        
                                        
                                        
                                        
                                        
                                        
                                             <!--  <div hidden="true"><iframe src="http://translate.google.com/translate_tts?tl=es&q=${fieldValue(bean: vocabularioInstance, field: 'definicion')}" height="0" ></iframe></div>-->
					</li>
				</g:if>
			
				
			
			</ol>
			<g:form url="[resource:vocabularioInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${vocabularioInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
