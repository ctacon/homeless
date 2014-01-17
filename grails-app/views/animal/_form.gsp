<%@ page import="ru.homeless.model.Photo; ru.homeless.model.animal.Animal" %>

<div class="control-group fieldcontain ${hasErrors(bean: animalInstance, field: 'avatar', 'error')} ">
    <label for="fileupload" class="control-label"><g:message code="animal.avatar.label" default="Аватар"/></label>
    <g:hiddenField id="avatar" name="avatar.id" value="${animalInstance?.avatar?.id}"/>
    <ul class="thumbnails">
        <li class="span2">
            <div class="thumbnail">
                <img id="avatarthumbnail" data-src="holder.js/150%x150"
                     alt="${animalInstance?.avatar?.thumbnailFilename}"
                     src="${animalInstance?.avatar ?
                         createLink(controller: 'Photo', action: 'thumbnail', id: animalInstance.avatar.id)
                     : avatar && avatar.id ? createLink(controller: 'Photo', action: 'thumbnail', id: avatar.id)
                         : resource(dir: 'images', file: 'cat.jpg')}">
            </div>
        </li>
    </ul>

    <div class="controls">
        <input id="fileupload" type="file" name="files[]"
               data-url="${createLink(controller: 'Animal', action: 'upload')}"
               autoUpload="true"
               disableImageResize="false"/>
        <span class="help-inline">${hasErrors(bean: animalInstance, field: 'avatar', 'error')}</span>
    </div>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: animalInstance, field: 'photos', 'error')} ">
    <label for="albumfileupload" class="control-label"><g:message code="animal.photos.label"
                                                                  default="Фотоальбом"/></label>

    <div class="controls">
        <g:render template='/image-gallery/image' model="['photo': null, 'i': '_clone', 'hidden': true]"/>
        <g:render template="/image-gallery/image_list" model="['photos': animalInstance?.photos]"/>
        <input id="albumfileupload" type="file" name="files1[]"
               data-url="${createLink(controller: 'Animal', action: 'upload')}" autoUpload="true" multiple="true"
               replaceFileInput="false"/>

        <span class="help-inline">${hasErrors(bean: animalInstance, field: 'photos', 'error')}</span>
    </div>
</div>


<div class="control-group fieldcontain ${hasErrors(bean: animalInstance, field: 'name', 'error')} required"
     xmlns="http://www.w3.org/1999/html">
    <label for="name" class="control-label"><g:message code="animal.name.label" default="Имя"/><span
            class="required-indicator">*</span></label>

    <div class="controls">
        <g:textField name="name" maxlength="50" required="" value="${animalInstance?.name}"/>
        <span class="help-inline">${hasErrors(bean: animalInstance, field: 'name', 'error')}</span>
    </div>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: animalInstance, field: 'description', 'error')} ">
    <label for="description" class="control-label"><g:message code="animal.description.label"
                                                              default="Description"/></label>

    <div class="controls">
        <g:textArea class="span4" name="description" value="${animalInstance?.description}" rows="4" />
        <span class="help-inline">${hasErrors(bean: animalInstance, field: 'description', 'error')}</span>
    </div>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: animalInstance, field: 'age', 'error')} required">
    <label for="age" class="control-label"><g:message code="animal.age.label" default="Age"/><span
            class="required-indicator">*</span></label>

    <div class="controls">
        <g:field type="number" name="age" max="360" min="0" size="16" required="" value="${animalInstance.age}"/>
        <span class="help-inline">${hasErrors(bean: animalInstance, field: 'age', 'error')}</span>
    </div>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: animalInstance, field: 'color', 'error')} ">
    <label for="color" class="control-label"><g:message code="animal.color.label" default="Color"/></label>

    <div class="controls">
        <g:textField name="color" value="${animalInstance?.color}"/>
        <span class="help-inline">${hasErrors(bean: animalInstance, field: 'color', 'error')}</span>
    </div>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: animalInstance, field: 'character', 'error')} ">
    <label for="character" class="control-label"><g:message code="animal.character.label" default="Character"/></label>

    <div class="controls">
        <g:select id="character" name="character.id" from="${ru.homeless.model.animal.AnimalCharacter.list()}"
                  optionKey="id" value="${animalInstance?.character?.id}" class="many-to-one"
                  noSelection="['null': '']"/>
        <span class="help-inline">${hasErrors(bean: animalInstance, field: 'character', 'error')}</span>
    </div>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: animalInstance, field: 'status', 'error')} ">
    <label for="status" class="control-label"><g:message code="animal.status.label" default="Status"/></label>

    <div class="controls">
        <g:select id="status" name="status.id" from="${ru.homeless.model.animal.AnimalStatus.list()}"
                  optionKey="id" required="" value="${animalInstance?.status?.id}" class="many-to-one"/>
        <span class="help-inline">${hasErrors(bean: animalInstance, field: 'status', 'error')}</span>
    </div>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: animalInstance, field: 'place', 'error')} ">
    <label for="place" class="control-label"><g:message code="animal.place.label" default="Place"/></label>

    <div class="controls">
        <g:select id="place" name="place.id" from="${ru.homeless.model.animal.AnimalPlace.list()}"
                  optionKey="id" required="" value="${animalInstance?.place?.id}" class="many-to-one"/>
        <span class="help-inline">${hasErrors(bean: animalInstance, field: 'place', 'error')}</span>
    </div>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: animalInstance, field: 'sex', 'error')} required">
    <label for="sex" class="control-label"><g:message code="animal.sex.label" default="Sex"/><span
            class="required-indicator">*</span></label>

    <div class="controls">
        <g:select id="sex" name="sex.id" from="${ru.homeless.model.animal.AnimalSex.list()}" optionKey="id"
                  required=""
                  value="${animalInstance?.sex?.id}" class="many-to-one"/>
        <span class="help-inline">${hasErrors(bean: animalInstance, field: 'sex', 'error')}</span>
    </div>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: animalInstance, field: 'type', 'error')} required">
    <label for="type" class="control-label"><g:message code="animal.type.label" default="Type"/><span
            class="required-indicator">*</span></label>

    <div class="controls">
        <g:select id="type" name="type.id" from="${ru.homeless.model.animal.AnimalType.list()}" optionKey="id"
                  required="" value="${animalInstance?.type?.id}" class="many-to-one"/>
        <span class="help-inline">${hasErrors(bean: animalInstance, field: 'type', 'error')}</span>
    </div>
</div>

<sec:ifAnyGranted roles="ROLE_ADMIN">
    <div class="control-group fieldcontain ${hasErrors(bean: animalInstance, field: 'findOwner', 'error')} ">
        <label for="findOwner" class="control-label"><g:message code="animal.findOwner.label"
                                                                default="Find Owner"/></label>

        <div class="controls">
            <bs:checkBox name="findOwner" value="${animalInstance?.findOwner}"/>
            <span class="help-inline">${hasErrors(bean: animalInstance, field: 'findOwner', 'error')}</span>
        </div>
    </div>

    <div class="control-group fieldcontain ${hasErrors(bean: animalInstance, field: 'losted', 'error')} ">
        <label for="losted" class="control-label"><g:message code="animal.losted.label" default="Losted"/></label>

        <div class="controls">
            <bs:checkBox name="losted" value="${animalInstance?.losted}"/>
            <span class="help-inline">${hasErrors(bean: animalInstance, field: 'losted', 'error')}</span>
        </div>
    </div>

    <div class="control-group fieldcontain ${hasErrors(bean: animalInstance, field: 'published', 'error')} ">
        <label for="published" class="control-label"><g:message code="animal.published.label"
                                                                default="Published"/></label>

        <div class="controls">
            <bs:checkBox name="published" value="${animalInstance?.published}"/>
            <span class="help-inline">${hasErrors(bean: animalInstance, field: 'published', 'error')}</span>
        </div>

    </div>
</sec:ifAnyGranted>

<g:render template="/image-gallery/galery_template"/>

<script>
    $(document).ready((function () {
        $('#fileupload').fileupload({
            dataType: 'json',
            disableImageResize: /Android(?!.*Chrome)|Opera/
                    .test(window.navigator && navigator.userAgent),
            imageMaxWidth: 150,
            imageMaxHeight: 150,
            imageCrop: true,
            replaceFileInput: false,
            add: function (e, data) {
                data.submit();
            },
            done: function (e, data) {
                $.each(data.result.files, function (index, file) {
                    $('#avatar').val(file.avatarid);
                    $("#avatarthumbnail").attr("src", file.thumbnail_url);
                });

            }
        });
        $('#albumfileupload').fileupload({
            dataType: 'json',
            disableImageResize: /Android(?!.*Chrome)|Opera/
                    .test(window.navigator && navigator.userAgent),
            imageMaxWidth: 300,
            imageMaxHeight: 300,
            imageCrop: true,
            replaceFileInput: false,
            add: function (e, data) {
                data.submit();
            },
            done: function (e, data) {
                var ph = [];
                $.each(data.result.files, function (index, file) {
                    ph.push(file.avatarid);
                    addPhoto(file.avatarid, file.thumbnail_url, file.url);
                });
            }
        });

    }));
</script>





