package ru.homeless.model

import org.springframework.dao.DataIntegrityViolationException
import ru.homeless.model.animal.Animal

/**
 * AnimalController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class AnimalController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    def filterPaneService

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [animalInstanceList: Animal.list(params), animalInstanceTotal: Animal.count()]
    }

    def create() {
        [animalInstance: new Animal(params)]
    }

    def save() {
        def animalInstance = new Animal(params)
        if (!animalInstance.save(flush: true)) {
            render(view: "create", model: [animalInstance: animalInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'animal.label', default: 'Animal'), animalInstance.id])
        redirect(action: "show", id: animalInstance.id)
    }

    def show() {
        def animalInstance = Animal.get(params.id)
        if (!animalInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'animal.label', default: 'Animal'), params.id])
            redirect(action: "list")
            return
        }

        [animalInstance: animalInstance]
    }

    def edit() {
        def animalInstance = Animal.get(params.id)
        if (!animalInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'animal.label', default: 'Animal'), params.id])
            redirect(action: "list")
            return
        }

        [animalInstance: animalInstance]
    }

    def update() {
        def animalInstance = Animal.get(params.id)
        if (!animalInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'animal.label', default: 'Animal'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (animalInstance.version > version) {
                animalInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'animal.label', default: 'Animal')] as Object[],
                        "Another user has updated this Animal while you were editing")
                render(view: "edit", model: [animalInstance: animalInstance])
                return
            }
        }

        animalInstance.properties = params

        if (!animalInstance.save(flush: true)) {
            render(view: "edit", model: [animalInstance: animalInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'animal.label', default: 'Animal'), animalInstance.id])
        redirect(action: "show", id: animalInstance.id)
    }

    def delete() {
        def animalInstance = Animal.get(params.id)
        if (!animalInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'animal.label', default: 'Animal'), params.id])
            redirect(action: "list")
            return
        }

        try {
            animalInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'animal.label', default: 'Animal'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'animal.label', default: 'Animal'), params.id])
            redirect(action: "show", id: params.id)
        }
    }

//    def filter = {
//        if(!params.max) params.max = 10
//        render( view:'list',
//                model:[ animalInstanceList: filterPaneService.filter( params, Animal ),
//                        animalInstanceTotal: filterPaneService.count( params, Animal ),
//                        filterParams: org.grails.plugin.filterpane.FilterPaneUtils.extractFilterParams(params),
//                        params:params ] )
//    }
}
