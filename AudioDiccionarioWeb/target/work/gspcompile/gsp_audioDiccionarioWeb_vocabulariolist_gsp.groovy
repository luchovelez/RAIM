import audiodiccionarioweb.Vocabulario
import org.codehaus.groovy.grails.plugins.metadata.GrailsPlugin
import org.codehaus.groovy.grails.web.pages.GroovyPage
import org.codehaus.groovy.grails.web.taglib.*
import org.codehaus.groovy.grails.web.taglib.exceptions.GrailsTagException
import org.springframework.web.util.*
import grails.util.GrailsUtil

class gsp_audioDiccionarioWeb_vocabulariolist_gsp extends GroovyPage {
public String getGroovyPageFileName() { "/WEB-INF/grails-app/views/vocabulario/list.gsp" }
public Object run() {
Writer out = getOut()
Writer expressionOut = getExpressionOut()
registerSitemeshPreprocessMode()
printHtmlPart(0)
printHtmlPart(1)
createTagBody(1, {->
printHtmlPart(2)
invokeTag('captureMeta','sitemesh',6,['gsp_sm_xmlClosingForEmptyTag':(""),'name':("layout"),'content':("main")],-1)
printHtmlPart(2)
invokeTag('set','g',7,['var':("entityName"),'value':(message(code: 'vocabulario.label', default: 'Vocabulario'))],-1)
printHtmlPart(2)
createTagBody(2, {->
createTagBody(3, {->
invokeTag('message','g',8,['code':("default.list.label"),'args':([entityName])],-1)
})
invokeTag('captureTitle','sitemesh',8,[:],3)
})
invokeTag('wrapTitleTag','sitemesh',8,[:],2)
printHtmlPart(3)
})
invokeTag('captureHead','sitemesh',10,[:],1)
printHtmlPart(4)
createTagBody(1, {->
printHtmlPart(5)
invokeTag('message','g',12,['code':("default.link.skip.label"),'default':("Skip to content&hellip;")],-1)
printHtmlPart(6)
expressionOut.print(createLink(uri: '/'))
printHtmlPart(7)
invokeTag('message','g',15,['code':("default.home.label")],-1)
printHtmlPart(8)
createTagBody(2, {->
invokeTag('message','g',16,['code':("default.new.label"),'args':([entityName])],-1)
})
invokeTag('link','g',16,['class':("create"),'action':("create")],2)
printHtmlPart(9)
invokeTag('message','g',20,['code':("default.list.label"),'args':([entityName])],-1)
printHtmlPart(10)
if(true && (flash.message)) {
printHtmlPart(11)
expressionOut.print(flash.message)
printHtmlPart(12)
}
printHtmlPart(13)
createTagBody(2, {->
printHtmlPart(14)
invokeTag('textField','g',28,['name':("query"),'value':(params.query.encodeAsURL())],-1)
printHtmlPart(15)
})
invokeTag('form','g',30,['action':("list"),'method':("GET")],2)
printHtmlPart(16)
createTagBody(2, {->
printHtmlPart(17)
expressionOut.print(params.q)
printHtmlPart(18)
})
invokeTag('form','g',39,['action':("search")],2)
printHtmlPart(19)
invokeTag('sortableColumn','g',46,['property':("palabra"),'title':(message(code: 'vocabulario.palabra.label', default: 'Palabra'))],-1)
printHtmlPart(20)
invokeTag('sortableColumn','g',47,['property':("definicion"),'title':(message(code: 'vocabulario.definicion.label', default: 'Definicion'))],-1)
printHtmlPart(21)
loop:{
int i = 0
for( vocabularioInstance in (vocabularioInstanceList) ) {
printHtmlPart(22)
expressionOut.print((i % 2) == 0 ? 'even' : 'odd')
printHtmlPart(23)
createTagBody(3, {->
expressionOut.print(fieldValue(bean: vocabularioInstance, field: "palabra"))
})
invokeTag('link','g',55,['action':("show"),'id':(vocabularioInstance.id)],3)
printHtmlPart(24)
expressionOut.print(fieldValue(bean: vocabularioInstance, field: "definicion"))
printHtmlPart(25)
i++
}
}
printHtmlPart(26)
invokeTag('paginate','g',64,['total':(vocabularioInstanceTotal),'params':(params)],-1)
printHtmlPart(27)
})
invokeTag('captureBody','sitemesh',68,[:],1)
printHtmlPart(28)
}
public static final Map JSP_TAGS = new HashMap()
protected void init() {
	this.jspTags = JSP_TAGS
}
public static final String CONTENT_TYPE = 'text/html;charset=UTF-8'
public static final long LAST_MODIFIED = 1424559733479L
public static final String EXPRESSION_CODEC = 'html'
public static final String STATIC_CODEC = 'none'
public static final String OUT_CODEC = 'html'
public static final String TAGLIB_CODEC = 'none'
}
