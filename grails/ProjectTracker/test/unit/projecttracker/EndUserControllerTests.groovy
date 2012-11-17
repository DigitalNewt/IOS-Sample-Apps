package projecttracker



import org.junit.*
import grails.test.mixin.*

@TestFor(EndUserController)
@Mock(EndUser)
class EndUserControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/endUser/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.endUserInstanceList.size() == 0
        assert model.endUserInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.endUserInstance != null
    }

    void testSave() {
        controller.save()

        assert model.endUserInstance != null
        assert view == '/endUser/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/endUser/show/1'
        assert controller.flash.message != null
        assert EndUser.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/endUser/list'

        populateValidParams(params)
        def endUser = new EndUser(params)

        assert endUser.save() != null

        params.id = endUser.id

        def model = controller.show()

        assert model.endUserInstance == endUser
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/endUser/list'

        populateValidParams(params)
        def endUser = new EndUser(params)

        assert endUser.save() != null

        params.id = endUser.id

        def model = controller.edit()

        assert model.endUserInstance == endUser
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/endUser/list'

        response.reset()

        populateValidParams(params)
        def endUser = new EndUser(params)

        assert endUser.save() != null

        // test invalid parameters in update
        params.id = endUser.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/endUser/edit"
        assert model.endUserInstance != null

        endUser.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/endUser/show/$endUser.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        endUser.clearErrors()

        populateValidParams(params)
        params.id = endUser.id
        params.version = -1
        controller.update()

        assert view == "/endUser/edit"
        assert model.endUserInstance != null
        assert model.endUserInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/endUser/list'

        response.reset()

        populateValidParams(params)
        def endUser = new EndUser(params)

        assert endUser.save() != null
        assert EndUser.count() == 1

        params.id = endUser.id

        controller.delete()

        assert EndUser.count() == 0
        assert EndUser.get(endUser.id) == null
        assert response.redirectedUrl == '/endUser/list'
    }
}
