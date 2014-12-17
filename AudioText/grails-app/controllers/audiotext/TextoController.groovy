package audiotext



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class TextoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Texto.list(params), model:[textoInstanceCount: Texto.count()]
    }

    def show(Texto textoInstance) {
        respond textoInstance
    }

    def create() {
        respond new Texto(params)
    }

    @Transactional
    def save(Texto textoInstance) {
        if (textoInstance == null) {
            notFound()
            return
        }

        if (textoInstance.hasErrors()) {
            respond textoInstance.errors, view:'create'
            return
        }

        textoInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'texto.label', default: 'Texto'), textoInstance.id])
                redirect textoInstance
            }
            '*' { respond textoInstance, [status: CREATED] }
        }
    }

    def edit(Texto textoInstance) {
        respond textoInstance
    }

    @Transactional
    def update(Texto textoInstance) {
        if (textoInstance == null) {
            notFound()
            return
        }

        if (textoInstance.hasErrors()) {
            respond textoInstance.errors, view:'edit'
            return
        }

        textoInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Texto.label', default: 'Texto'), textoInstance.id])
                redirect textoInstance
            }
            '*'{ respond textoInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Texto textoInstance) {

        if (textoInstance == null) {
            notFound()
            return
        }

        textoInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Texto.label', default: 'Texto'), textoInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'texto.label', default: 'Texto'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
