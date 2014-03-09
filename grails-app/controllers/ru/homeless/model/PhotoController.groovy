package ru.homeless.model

import grails.converters.JSON

//import org.imgscalr.Scalr
/**
 * PhotoController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class PhotoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [photoInstanceList: Photo.list(params), photoInstanceTotal: Photo.count()]
    }

    def create() {
        [photoInstance: new Photo(params)]
    }

    def save() {
        try {
            def photoInstance = new Photo(params)
            if (!photoInstance.save(flush: true)) {
                render(view: "create", model: [photoInstance: photoInstance])
                return
            }

            flash.message = message(code: 'default.created.message', args: [message(code: 'photos.label', default: 'Photo'), photoInstance.id])
            redirect(action: "show", id: photoInstance.id)
        } catch (e) {
            log.error(e, e)
            render(view: "create", model: [photoInstance: photoInstance])
            return

        }
    }

    def show() {
        def photoInstance = Photo.get(params.id)
        if (!photoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'photos.label', default: 'Photo'), params.id])
            redirect(action: "list")
            return
        }

        [photoInstance: photoInstance]
    }

    def edit() {
        def photoInstance = Photo.get(params.id)
        if (!photoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'photos.label', default: 'Photo'), params.id])
            redirect(action: "list")
            return
        }

        [photoInstance: photoInstance]
    }

    def update() {
        def photoInstance = Photo.get(params.id)
        if (!photoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'photos.label', default: 'Photo'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (photoInstance.version > version) {
                photoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'photos.label', default: 'Photo')] as Object[],
                        "Another user has updated this Photo while you were editing")
                render(view: "edit", model: [photoInstance: photoInstance])
                return
            }
        }

        photoInstance.properties = params

        if (!photoInstance.save(flush: true)) {
            render(view: "edit", model: [photoInstance: photoInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'photos.label', default: 'Photo'), photoInstance.id])
        redirect(action: "show", id: photoInstance.id)
    }


    def picture() {
        try {
            def pic = Photo.get(params.id)
            if (pic != null) {
                File picFile = new File("${grailsApplication.config.file.upload.directory ?: '/tmp'}/${pic.newFilename}")
                picFile.withInputStream { is ->
                    response.outputStream << is
                }
            }
            response.contentType = 'image/jpeg'
            response.outputStream.flush()
        } catch (ex) {
            log.error(ex, ex)
        }
    }

    def thumbnail() {
        try {
            def pic = Photo.get(params.id)
            if (pic != null) {
                File picFile = new File("${grailsApplication.config.file.upload.directory ?: '/tmp'}/${pic.thumbnailFilename}")
                picFile.withInputStream { is ->
                    response.outputStream << is
                }
            }
            response.contentType = 'image/png'
            response.outputStream.flush()
        } catch (ex) {
            log.error(ex, ex)
        }

    }

    def delete() {
        def result
        try {
            def pic = Photo.get(params.id)
            if (pic) {
                File picFile = new File("${grailsApplication.config.file.upload.directory ?: '/tmp'}/${pic.newFilename}")
                picFile.delete()
                File thumbnailFile = new File("${grailsApplication.config.file.upload.directory ?: '/tmp'}/${pic.thumbnailFilename}")
                thumbnailFile.delete()
                pic.delete(flash: true)
                result = [success: true]
            } else result = [success: false]
        } catch (ex) {
            result = [success: false]
        }
        render result as JSON
    }


}
