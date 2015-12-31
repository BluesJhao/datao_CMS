package com.iminer.biz.entity



import org.junit.*
import grails.test.mixin.*

@TestFor(DutyInfoController)
@Mock(DutyInfo)
class DutyInfoControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/dutyInfo/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.dutyInfoInstanceList.size() == 0
        assert model.dutyInfoInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.dutyInfoInstance != null
    }

    void testSave() {
        controller.save()

        assert model.dutyInfoInstance != null
        assert view == '/dutyInfo/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/dutyInfo/show/1'
        assert controller.flash.message != null
        assert DutyInfo.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/dutyInfo/list'

        populateValidParams(params)
        def dutyInfo = new DutyInfo(params)

        assert dutyInfo.save() != null

        params.id = dutyInfo.id

        def model = controller.show()

        assert model.dutyInfoInstance == dutyInfo
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/dutyInfo/list'

        populateValidParams(params)
        def dutyInfo = new DutyInfo(params)

        assert dutyInfo.save() != null

        params.id = dutyInfo.id

        def model = controller.edit()

        assert model.dutyInfoInstance == dutyInfo
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/dutyInfo/list'

        response.reset()

        populateValidParams(params)
        def dutyInfo = new DutyInfo(params)

        assert dutyInfo.save() != null

        // test invalid parameters in update
        params.id = dutyInfo.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/dutyInfo/edit"
        assert model.dutyInfoInstance != null

        dutyInfo.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/dutyInfo/show/$dutyInfo.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        dutyInfo.clearErrors()

        populateValidParams(params)
        params.id = dutyInfo.id
        params.version = -1
        controller.update()

        assert view == "/dutyInfo/edit"
        assert model.dutyInfoInstance != null
        assert model.dutyInfoInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/dutyInfo/list'

        response.reset()

        populateValidParams(params)
        def dutyInfo = new DutyInfo(params)

        assert dutyInfo.save() != null
        assert DutyInfo.count() == 1

        params.id = dutyInfo.id

        controller.delete()

        assert DutyInfo.count() == 0
        assert DutyInfo.get(dutyInfo.id) == null
        assert response.redirectedUrl == '/dutyInfo/list'
    }
}
