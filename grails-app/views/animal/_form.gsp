<%@ page import="ru.homeless.model.animal.Animal" %>

<div class="control-group fieldcontain ${hasErrors(bean: animalInstance, field: 'name', 'error')} required"
     xmlns="http://www.w3.org/1999/html">
    <label for="name" class="control-label"><g:message code="animal.name.label" default="Name"/><span
            class="required-indicator">*</span></label>

    <div class="controls">
        <g:textField name="name" maxlength="50" required="" value="${animalInstance?.name}"/>
        <span class="help-inline">${hasErrors(bean: animalInstance, field: 'name', 'error')}</span>
    </div>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: animalInstance, field: 'age', 'error')} required">
    <label for="age" class="control-label"><g:message code="animal.age.label" default="Age"/><span
            class="required-indicator">*</span></label>

    <div class="controls">
        <g:field type="number" name="age" max="360" required="" value="${animalInstance.age}"/>
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

%{--<div class="control-group fieldcontain ${hasErrors(bean: animalInstance, field: 'avatar', 'error')} ">--}%
%{--<label for="avatar" class="control-label"><g:message code="animal.avatar.label" default="Avatar" /></label>--}%
%{--<div class="controls">--}%
%{--<g:select id="avatar" name="avatar.id" from="${ru.homeless.model.Photo.list()}" optionKey="id" value="${animalInstance?.avatar?.id}" class="many-to-one" noSelection="['null': '']"/>--}%
%{--<span class="help-inline">${hasErrors(bean: animalInstance, field: 'avatar', 'error')}</span>--}%
%{--</div>--}%
%{--</div>--}%
<div class="control-group fieldcontain ${hasErrors(bean: animalInstance, field: 'avatar', 'error')} ">
    <label for="avatar" class="control-label"><g:message code="animal.avatar.label" default="Avatar"/></label>

    <div class="controls">
        <input id="fileupload" type="file" name="files[]" data-url="/animal/create"/>

        <div id="progress">
            <div class="bar" style="width: 0%;"></div>
        </div>
        <span class="help-inline">${hasErrors(bean: animalInstance, field: 'avatar', 'error')}</span>
    </div>
</div>


<div class="control-group fieldcontain ${hasErrors(bean: animalInstance, field: 'description', 'error')} ">
    <label for="description" class="control-label"><g:message code="animal.description.label"
                                                              default="Description"/></label>

    <div class="controls">
        <g:textField name="description" value="${animalInstance?.description}"/>
        <span class="help-inline">${hasErrors(bean: animalInstance, field: 'description', 'error')}</span>
    </div>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: animalInstance, field: 'photos', 'error')} ">
    <label for="photos" class="control-label"><g:message code="animal.photos.label" default="Photos"/></label>

    <div class="controls">
        <g:select name="photos" from="${ru.homeless.model.Photo.list()}" multiple="multiple" optionKey="id" size="5"
                  value="${animalInstance?.photos*.id}" class="many-to-many"/>
        <span class="help-inline">${hasErrors(bean: animalInstance, field: 'photos', 'error')}</span>
    </div>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: animalInstance, field: 'comments', 'error')} ">
    <label for="comments" class="control-label"><g:message code="animal.comments.label" default="Comments"/></label>

    <div class="controls">
        <g:select name="comments" from="${ru.homeless.model.Comment.list()}" multiple="multiple" optionKey="id" size="5"
                  value="${animalInstance?.comments*.id}" class="many-to-many"/>
        <span class="help-inline">${hasErrors(bean: animalInstance, field: 'comments', 'error')}</span>
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

<div class="control-group fieldcontain ${hasErrors(bean: animalInstance, field: 'findOwner', 'error')} ">
    <label for="findOwner" class="control-label"><g:message code="animal.findOwner.label" default="Find Owner"/></label>

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
    <label for="published" class="control-label"><g:message code="animal.published.label" default="Published"/></label>

    <div class="controls">
        <bs:checkBox name="published" value="${animalInstance?.published}"/>
        <span class="help-inline">${hasErrors(bean: animalInstance, field: 'published', 'error')}</span>
    </div>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: animalInstance, field: 'sex', 'error')} required">
    <label for="sex" class="control-label"><g:message code="animal.sex.label" default="Sex"/><span
            class="required-indicator">*</span></label>

    <div class="controls">
        <g:select id="sex" name="sex.id" from="${ru.homeless.model.animal.AnimalSex.list()}" optionKey="id" required=""
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


<style>
.bar {
    height: 18px;
    background: green;
}
</style>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script src="jQuery-File-Upload-9.5.0/js/vendor/jquery.ui.widget.js"></script>
<script src="jQuery-File-Upload-9.5.0/js/jquery.iframe-transport.js"></script>
<script src="jQuery-File-Upload-9.5.0/js/jquery.fileupload.js"></script>
<script>
    $(function () {
        $('#fileupload').fileupload({
            dataType: 'json',
            add: function (e, data) {
                data.context = $('<p/>').text('Uploading...').appendTo(document.body);
                data.submit();
            },
            done: function (e, data) {
                $.each(data.result.files, function (index, file) {
                    $('<p/>').text(file.name).appendTo(document.body);
                });
            },
            progressall: function (e, data) {
                var progress = parseInt(data.loaded / data.total * 100, 10);
                $('#progress .bar').css(
                        'width',
                        progress + '%'
                );
            }
        });
    });
</script>