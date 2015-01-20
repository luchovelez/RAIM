package audiodiccionarioweb



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class VocabularioController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Vocabulario.list(params), model:[vocabularioInstanceCount: Vocabulario.count()]
    }
    
        def list() {
        params.max = Math.min(params.max ? params.int('max') : 5, 100)
 
        def vocabularioList = Vocabulario.createCriteria().list (params) {
            if ( params.query ) {
                ilike("palabra", "%${params.query}%")
            }
        }
 
        [vocabularioInstanceList: vocabularioList, vocabularioInstanceTotal: vocabularioList.totalCount]
    }
    
    def searchableService //inject the service (make sure the name is correct)
    
// @Secured(['IS_AUTHENTICATED_ANONYMOUSLY'])
    def search = {
    def query = params.q
    if(query){
        def srchResults = searchableService.search(query)
        render(view: "list",
               model: [vocabularioInstanceList: srchResults.results,
                     vocabularioInstanceTotal:srchResults.total])
    }else{
        redirect(action: "list")
    }
}
    
    
    

    def show(Vocabulario vocabularioInstance) {
        respond vocabularioInstance
    }

    def create() {
        respond new Vocabulario(params)
    }

    @Transactional
    def save(Vocabulario vocabularioInstance) {
        if (vocabularioInstance == null) {
            notFound()
            return
        }

        if (vocabularioInstance.hasErrors()) {
            respond vocabularioInstance.errors, view:'create'
            return
        }

        vocabularioInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'vocabulario.label', default: 'Vocabulario'), vocabularioInstance.id])
                redirect vocabularioInstance
            }
            '*' { respond vocabularioInstance, [status: CREATED] }
        }
    }

    def edit(Vocabulario vocabularioInstance) {
        respond vocabularioInstance
    }

    @Transactional
    def update(Vocabulario vocabularioInstance) {
        if (vocabularioInstance == null) {
            notFound()
            return
        }

        if (vocabularioInstance.hasErrors()) {
            respond vocabularioInstance.errors, view:'edit'
            return
        }

        vocabularioInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Vocabulario.label', default: 'Vocabulario'), vocabularioInstance.id])
                redirect vocabularioInstance
            }
            '*'{ respond vocabularioInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Vocabulario vocabularioInstance) {

        if (vocabularioInstance == null) {
            notFound()
            return
        }

        vocabularioInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Vocabulario.label', default: 'Vocabulario'), vocabularioInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'vocabulario.label', default: 'Vocabulario'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
