import audiodiccionarioweb.Diccionario
import org.codehaus.groovy.grails.plugins.metadata.GrailsPlugin
import org.codehaus.groovy.grails.web.pages.GroovyPage
import org.codehaus.groovy.grails.web.taglib.*
import org.codehaus.groovy.grails.web.taglib.exceptions.GrailsTagException
import org.springframework.web.util.*
import grails.util.GrailsUtil

class gsp_audioDiccionarioWeb_diccionario_form_gsp extends GroovyPage {
public String getGroovyPageFileName() { "/WEB-INF/grails-app/views/diccionario/_form.gsp" }
public Object run() {
Writer out = getOut()
Writer expressionOut = getExpressionOut()
registerSitemeshPreprocessMode()
printHtmlPart(0)
expressionOut.print(hasErrors(bean: diccionarioInstance, field: 'nivelEducativo', 'error'))
printHtmlPart(1)
invokeTag('message','g',7,['code':("diccionario.nivelEducativo.label"),'default':("Nivel Educativo")],-1)
printHtmlPart(2)
invokeTag('textField','g',10,['name':("nivelEducativo"),'required':(""),'value':(diccionarioInstance?.nivelEducativo)],-1)
printHtmlPart(3)
expressionOut.print(hasErrors(bean: diccionarioInstance, field: 'nombre', 'error'))
printHtmlPart(4)
invokeTag('message','g',16,['code':("diccionario.nombre.label"),'default':("Nombre")],-1)
printHtmlPart(2)
invokeTag('textField','g',19,['name':("nombre"),'required':(""),'value':(diccionarioInstance?.nombre)],-1)
printHtmlPart(3)
expressionOut.print(hasErrors(bean: diccionarioInstance, field: 'vocabulario', 'error'))
printHtmlPart(5)
invokeTag('message','g',25,['code':("diccionario.vocabulario.label"),'default':("Vocabulario")],-1)
printHtmlPart(6)
invokeTag('select','g',28,['name':("vocabulario"),'from':(audiodiccionarioweb.Vocabulario.list()),'multiple':("multiple"),'optionKey':("id"),'size':("5"),'value':(diccionarioInstance?.vocabulario*.id),'class':("many-to-many")],-1)
printHtmlPart(7)
}
public static final Map JSP_TAGS = new HashMap()
protected void init() {
	this.jspTags = JSP_TAGS
}
public static final String CONTENT_TYPE = 'text/html;charset=UTF-8'
public static final long LAST_MODIFIED = 1424559733321L
public static final String EXPRESSION_CODEC = 'html'
public static final String STATIC_CODEC = 'none'
public static final String OUT_CODEC = 'html'
public static final String TAGLIB_CODEC = 'none'
}
