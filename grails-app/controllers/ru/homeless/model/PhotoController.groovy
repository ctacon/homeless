package ru.homeless.model

import grails.converters.JSON
//import org.imgscalr.Scalr
import org.springframework.http.HttpStatus
import org.springframework.web.multipart.MultipartFile
import org.springframework.web.multipart.MultipartHttpServletRequest

import javax.imageio.ImageIO
import java.awt.image.BufferedImage

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
        def photoInstance = new Photo(params)
        if (!photoInstance.save(flush: true)) {
            render(view: "create", model: [photoInstance: photoInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'photos.label', default: 'Photo'), photoInstance.id])
        redirect(action: "show", id: photoInstance.id)
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

//    def delete() {
//        def photoInstance = Photo.get(params.id)
//        if (!photoInstance) {
//            flash.message = message(code: 'default.not.found.message', args: [message(code: 'photos.label', default: 'Photo'), params.id])
//            redirect(action: "list")
//            return
//        }
//
//        try {
//            photoInstance.delete(flush: true)
//            flash.message = message(code: 'default.deleted.message', args: [message(code: 'photos.label', default: 'Photo'), params.id])
//            redirect(action: "list")
//        }
//        catch (DataIntegrityViolationException e) {
//            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'photos.label', default: 'Photo'), params.id])
//            redirect(action: "show", id: params.id)
//        }
//    }

//    def upload() {
//        switch (request.method) {
//            case "GET":
//                def results = []
//                Photo.findAll().each { Photo picture ->
//                    results << [
//                            name: picture.originalFilename,
//                            size: picture.fileSize,
//                            url: createLink(controller: 'Photo', action: 'picture', id: picture.id),
//                            thumbnail_url: createLink(controller: 'Photo', action: 'thumbnail', id: picture.id),
//                            delete_url: createLink(controller: 'Photo', action: 'delete', id: picture.id),
//                            delete_type: "DELETE"
//                    ]
//                }
//                render results as JSON
//                break;
//            case "POST":
//                def results = []
//                if (request instanceof MultipartHttpServletRequest) {
//                    for (filename in request.getFileNames()) {
//                        MultipartFile file = request.getFile(filename)
//
//                        String newFilenameBase = UUID.randomUUID().toString()
//                        String originalFileExtension = file.originalFilename.substring(file.originalFilename.lastIndexOf("."))
//                        String newFilename = newFilenameBase + originalFileExtension
//                        String storageDirectory = grailsApplication.config.file.upload.directory ?: '/tmp'
//
//                        File newFile = new File("$storageDirectory/$newFilename")
//                        file.transferTo(newFile)
//
//                        BufferedImage thumbnail = Scalr.resize(ImageIO.read(newFile), 290);
//                        String thumbnailFilename = newFilenameBase + '-thumbnail.png'
//                        File thumbnailFile = new File("$storageDirectory/$thumbnailFilename")
//                        ImageIO.write(thumbnail, 'png', thumbnailFile)
//
//                        Photo picture = new Photo(
//                                originalFilename: file.originalFilename,
//                                thumbnailFilename: thumbnailFilename,
//                                newFilename: newFilename,
//                                fileSize: file.size
//                        ).save()
//
//                        results << [
//                                name: picture.originalFilename,
//                                size: picture.fileSize,
//                                url: createLink(controller: 'Photo', action: 'picture', id: picture.id),
//                                thumbnail_url: createLink(controller: 'Photo', action: 'thumbnail', id: picture.id),
//                                delete_url: createLink(controller: 'Photo', action: 'delete', id: picture.id),
//                                delete_type: "DELETE"
//                        ]
//                    }
//                }
//
//                render results as JSON
//                break;
//            default: render animalFilterStatus: HttpStatus.METHOD_NOT_ALLOWED.value()
//        }
//    }





    def picture() {
        def pic = Photo.get(params.id)
        File picFile = new File("${grailsApplication.config.file.upload.directory ?: '/tmp'}/${pic.newFilename}")
        response.contentType = 'image/jpeg'
        response.outputStream << new FileInputStream(picFile)
        response.outputStream.flush()
    }

    def thumbnail() {
        def pic = Photo.get(params.id)
        if (pic != null) {
            File picFile = new File("${grailsApplication.config.file.upload.directory ?: '/tmp'}/${pic.thumbnailFilename}")
            response.outputStream << new FileInputStream(picFile)
        }
        response.contentType = 'image/png'
        response.outputStream.flush()
    }

    def delete() {
        def pic = Photo.get(params.id)
        File picFile = new File("${grailsApplication.config.file.upload.directory ?: '/tmp'}/${pic.newFilename}")
        picFile.delete()
        File thumbnailFile = new File("${grailsApplication.config.file.upload.directory ?: '/tmp'}/${pic.thumbnailFilename}")
        thumbnailFile.delete()
        pic.delete()

        def result = [success: true]
        render result as JSON
    }


}
