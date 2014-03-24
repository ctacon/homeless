package ru.homeless.model.animal

import grails.plugin.springsecurity.SpringSecurityService
import org.springframework.dao.DataIntegrityViolationException
import org.springframework.web.multipart.MultipartFile
import org.springframework.web.multipart.MultipartHttpServletRequest
import ru.homeless.model.*

/**
 * AnimalController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class AnimalController {
    def SpringSecurityService springSecurityService
    def PhotoService photoService
    def AnimalService animalService
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]


    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        [animalMinAge: 0, animalMaxAge: 240
        ]

    }

    def list_filter() {
        log.info('params = ' + params)
        List animalList
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        animalList = animalService.filter(params)
        [animalInstanceList: animalList, animalInstanceTotal: Animal.count()]
    }

    def forwardToAnimalList() {
        render(view: "list_filter")
    }


    def create() {
        [animalInstance: new Animal(params)]
    }

    def save() {
        def animalInstance
        try {
            if (params.age) {
                params.age = Date.parse('yyyyMM', params.age)
            }
            animalInstance = new Animal(params)
            log.info('age = ' + animalInstance.age)

            animalInstance.photos?.each {
                if (it.isAvatar()) {
                    animalInstance.avatar = it
                    return true
                }
            }
            if (!animalInstance.save(flush: true)) {
                render(view: "create", model: [animalInstance: animalInstance])
                return
            }
            PersonPost personPost = new PersonPost(person: springSecurityService.currentUser,
                    animal: animalInstance, type: PersonPostType.get(1)).save(flush: true)
            if (personPost) {
                log.info('personPost.id = ' + personPost.id)


                flash.message = message(code: 'default.created.message', args: [message(code: 'animal.label', default: 'Animal'), animalInstance.id])
                redirect(action: "show", id: animalInstance.id)
            } else {
                log.error("fail to create person post!")
                flash.error = 'Произошла непредвиденная ошибка при сохранении. Попробуйте еще раз.'
                render(view: "create", model: [animalInstance: animalInstance])
            }
        } catch (Exception ex) {
            log.error(ex, ex)
            flash.error = 'Произошла непредвиденная ошибка при сохранении. Попробуйте еще раз.'
            render(view: "create", model: [animalInstance: animalInstance])
            return
        }
    }

    def show() {
        def animalInstance = Animal.get(params.id)
        if (!animalInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'animal.label', default: 'Animal'), params.id])
            redirect(action: "list")
            return
        }
        Person currentLoggedInUser = springSecurityService.getCurrentUser()
        [animalInstance: animalInstance, currentLoggedInUser: currentLoggedInUser]
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
        try {

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
            if (params.age) {
                params.age = Date.parse('yyyyMM', params.age)
            }
            animalInstance.properties = params

            def _toBeDeleted = animalInstance.photos.findAll { (it?.deleted || (it == null)) }
            log.info("photos = " + animalInstance.photos)
            log.info("_toBeDeleted = " + _toBeDeleted.size())
            if (_toBeDeleted) {
                animalInstance.photos.removeAll(_toBeDeleted)
            }

            animalInstance.photos?.each {
                if (it.isAvatar()) {
                    animalInstance.avatar = it
                    return true
                }
            }

            if (!animalInstance.hasErrors() && !animalInstance.save(flush: true)) {
                render(view: "edit", model: [animalInstance: animalInstance])
                return
            }

            flash.message = message(code: 'default.updated.message', args: [message(code: 'animal.label', default: 'Animal'), animalInstance.id])
            redirect(action: "show", id: animalInstance.id)
        } catch (Exception ex) {
            log.error(ex, ex)
            flash.message = ex.getMessage()
            render(view: "edit", model: [animalInstance: animalInstance])
            return
        }
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
        } catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'animal.label', default: 'Animal'), params.id])
            redirect(action: "show", id: params.id)
        }
    }






    def upload() {
        try {
            def results = []
            if (request instanceof MultipartHttpServletRequest) {
                for (filename in request.getFileNames()) {
                    MultipartFile file = request.getFile(filename)
                    Photo picture = photoService.saveAnimalAvatar(file)

                    results << [
                            avatarid: picture.id,
                            name: picture.originalFilename,
                            thumbnail_url: createLink(controller: 'photo', action: 'thumbnail', id: picture.id),
                            url: createLink(controller: 'photo', action: 'picture', id: picture.id),
                            size: picture.fileSize
                    ]

                }
            }
            println "results : " + results
            render(contentType: 'text/json') { ['files': results] }

        } catch (ex) {
            log.error(ex, ex)
            render(contentType: 'text/json') { ['files': []] }
        }

    }


}
