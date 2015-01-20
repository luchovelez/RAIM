package audiodiccionarioweb



import grails.test.mixin.*
import spock.lang.*

@TestFor(VocabularioController)
@Mock(Vocabulario)
class VocabularioControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "Test the index action returns the correct model"() {

        when:"The index action is executed"
            controller.index()

        then:"The model is correct"
            !model.vocabularioInstanceList
            model.vocabularioInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when:"The create action is executed"
            controller.create()

        then:"The model is correctly created"
            model.vocabularioInstance!= null
    }

    void "Test the save action correctly persists an instance"() {

        when:"The save action is executed with an invalid instance"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'POST'
            def vocabulario = new Vocabulario()
            vocabulario.validate()
            controller.save(vocabulario)

        then:"The create view is rendered again with the correct model"
            model.vocabularioInstance!= null
            view == 'create'

        when:"The save action is executed with a valid instance"
            response.reset()
            populateValidParams(params)
            vocabulario = new Vocabulario(params)

            controller.save(vocabulario)

        then:"A redirect is issued to the show action"
            response.redirectedUrl == '/vocabulario/show/1'
            controller.flash.message != null
            Vocabulario.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when:"The show action is executed with a null domain"
            controller.show(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the show action"
            populateValidParams(params)
            def vocabulario = new Vocabulario(params)
            controller.show(vocabulario)

        then:"A model is populated containing the domain instance"
            model.vocabularioInstance == vocabulario
    }

    void "Test that the edit action returns the correct model"() {
        when:"The edit action is executed with a null domain"
            controller.edit(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the edit action"
            populateValidParams(params)
            def vocabulario = new Vocabulario(params)
            controller.edit(vocabulario)

        then:"A model is populated containing the domain instance"
            model.vocabularioInstance == vocabulario
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when:"Update is called for a domain instance that doesn't exist"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'PUT'
            controller.update(null)

        then:"A 404 error is returned"
            response.redirectedUrl == '/vocabulario/index'
            flash.message != null


        when:"An invalid domain instance is passed to the update action"
            response.reset()
            def vocabulario = new Vocabulario()
            vocabulario.validate()
            controller.update(vocabulario)

        then:"The edit view is rendered again with the invalid instance"
            view == 'edit'
            model.vocabularioInstance == vocabulario

        when:"A valid domain instance is passed to the update action"
            response.reset()
            populateValidParams(params)
            vocabulario = new Vocabulario(params).save(flush: true)
            controller.update(vocabulario)

        then:"A redirect is issues to the show action"
            response.redirectedUrl == "/vocabulario/show/$vocabulario.id"
            flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when:"The delete action is called for a null instance"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'DELETE'
            controller.delete(null)

        then:"A 404 is returned"
            response.redirectedUrl == '/vocabulario/index'
            flash.message != null

        when:"A domain instance is created"
            response.reset()
            populateValidParams(params)
            def vocabulario = new Vocabulario(params).save(flush: true)

        then:"It exists"
            Vocabulario.count() == 1

        when:"The domain instance is passed to the delete action"
            controller.delete(vocabulario)

        then:"The instance is deleted"
            Vocabulario.count() == 0
            response.redirectedUrl == '/vocabulario/index'
            flash.message != null
    }
}
