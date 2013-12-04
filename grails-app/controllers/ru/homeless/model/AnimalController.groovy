package ru.homeless.model

import grails.converters.JSON
import org.springframework.dao.DataIntegrityViolationException
import org.springframework.web.multipart.MultipartFile

//import org.imgscalr.Scalr
import org.springframework.web.multipart.MultipartHttpServletRequest
import ru.homeless.model.animal.Animal

import javax.imageio.ImageIO
import java.awt.image.BufferedImage

/**
 * AnimalController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class AnimalController {

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

//                        BufferedImage thumbnail = Scalr.resize(ImageIO.read(newFile), 290);
                BufferedImage thumbnail = ImageIO.read(newFile);
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
                        avatarid : picture.id,
                        name: picture.originalFilename,
                        size: picture.fileSize
                ]

            }
        }
        render results as JSON

    }



    def picture() {
        def pic = Photo.get(params.id)
        File picFile = new File("${grailsApplication.config.file.upload.directory ?: '/tmp'}/${pic.newFilename}")
        response.contentType = 'image/jpeg'
        response.outputStream << new FileInputStream(picFile)
        response.outputStream.flush()
    }

    def thumbnail() {
        def pic = Photo.get(params.id)
        File picFile = new File("${grailsApplication.config.file.upload.directory ?: '/tmp'}/${pic.thumbnailFilename}")
        response.contentType = 'image/png'
        response.outputStream << new FileInputStream(picFile)
        response.outputStream.flush()
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
