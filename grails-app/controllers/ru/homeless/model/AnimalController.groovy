package ru.homeless.model

import grails.plugin.springsecurity.SpringSecurityService
import org.imgscalr.Scalr
import org.springframework.dao.DataIntegrityViolationException
import org.springframework.web.multipart.MultipartFile
import org.springframework.web.multipart.MultipartHttpServletRequest
import ru.homeless.model.animal.Animal

import javax.imageio.ImageIO
import java.awt.image.BufferedImage

/**
 * AnimalController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class AnimalController {
    def SpringSecurityService springSecurityService

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]


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

        def _toBeDeleted = animalInstance.photos.findAll { (it?.deleted || (it == null)) }
        log.info("photos = " + animalInstance.photos)
        log.info("_toBeDeleted = " + _toBeDeleted.size())
        if (_toBeDeleted) {
            animalInstance.photos.removeAll(_toBeDeleted)
        }

        if (!animalInstance.hasErrors() && !animalInstance.save(flush: true)) {
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






    def upload() {
        def results = []
        if (request instanceof MultipartHttpServletRequest) {
            for (filename in request.getFileNames()) {
                MultipartFile file = request.getFile(filename)

                String newFilenameBase = UUID.randomUUID().toString()
                String originalFileExtension = file.originalFilename.substring(file.originalFilename.lastIndexOf("."))
                String newFilename = newFilenameBase + originalFileExtension
                String storageDirectory = grailsApplication.config.file.upload.directory ?: '/tmp'

                File newFile = new File("$storageDirectory/$newFilename")
                file.transferTo(newFile)

                BufferedImage thumbnail = Scalr.resize(ImageIO.read(newFile), Scalr.Mode.FIT_EXACT, 150, 150);
                String thumbnailFilename = newFilenameBase + '-thumbnail.png'
                File thumbnailFile = new File("$storageDirectory/$thumbnailFilename")
                ImageIO.write(thumbnail, 'png', thumbnailFile)

                Photo picture = new Photo(
                        originalFilename: file.originalFilename,
                        thumbnailFilename: thumbnailFilename,
                        newFilename: newFilename,
                        fileSize: file.size
                ).save()

                results << [
                        avatarid: picture.id,
                        name: picture.originalFilename,
                        thumbnail_url: createLink(controller: 'Photo', action: 'thumbnail', id: picture.id),
                        url: createLink(controller: 'Photo', action: 'picture', id: picture.id),
                        size: picture.fileSize
                ]

            }
        }
        println "results : " + results
        render(contentType: 'text/json') { ['files': results] }

    }


}
