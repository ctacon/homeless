<%@ page import="ru.homeless.model.Photo; ru.homeless.model.animal.Animal" %>

<div class="row" xmlns="http://www.w3.org/1999/html">
    <div class="span3">
        <div class="control-group fieldcontain ${hasErrors(bean: animalInstance, field: 'type', 'error')} required">
            <label for="type" class="control-label "><g:message code="animal.type.label" default="Тип"/><span
                    class="required-indicator">*</span></label>

            <div class="controls">
                <g:select id="type"

                          name="type.id" from="${ru.homeless.model.animal.AnimalType.list()}" optionKey="id"
                          required="" value="${animalInstance?.type?.id}"
                          class="span2"/>
                <span class="help-inline">${hasErrors(bean: animalInstance, field: 'type', 'error')}</span>
            </div>
        </div>
    </div>
</div>

<div class="row">
    <div class="span3">
        <div class="control-group fieldcontain ${hasErrors(bean: animalInstance, field: 'name', 'error')} required"
             xmlns="http://www.w3.org/1999/html">
            <label for="name" class="control-label"><g:message code="animal.name.label" default="Имя"/><span
                    class="required-indicator">*</span></label>

            <div class="controls">
                <g:textField name="name"
                             class="span2"
                             style="height: 30px;width: 63%"
                             maxlength="50" required="" value="${animalInstance?.name}"/>
                <span class="help-inline">${hasErrors(bean: animalInstance, field: 'name', 'error')}</span>
            </div>
        </div>
    </div>

    <div class="span3">
        <div class="control-group fieldcontain ${hasErrors(bean: animalInstance, field: 'animalFilterSex', 'error')} required">
            <label for="sex" class="control-label"><g:message code="animal.sex.label" default="Sex"/><span
                    class="required-indicator">*</span></label>

            <div class="controls">
                <g:select id="sex" name="sex.id" from="${ru.homeless.model.animal.AnimalSex.list()}" optionKey="id"
                          required=""
                          value="${animalInstance?.sex?.id}" class="span2"/>
                <span class="help-inline">${hasErrors(bean: animalInstance, field: 'animalFilterSex', 'error')}</span>
            </div>
        </div>
    </div>

    <div class="span3">
        <div class="control-group fieldcontain ${hasErrors(bean: animalInstance, field: 'age', 'error')} required">
            <label for="age" class="control-label"><g:message code="animal.age.label" default="Age"/><span
                    class="required-indicator">*</span></label>

            <div class="controls">
                <g:hiddenField id="age" name="age" value="${animalInstance.age?.format('yyyyMM')}"/>
                <select id="month" class="input-small" style="font-size: 12px">
                    <option value="0"><g:message code="animal.age.month1.label" default="Январь"/></option>
                    <option value="1"><g:message code="animal.age.month2.label" default="Февраль"/></option>
                    <option value="2"><g:message code="animal.age.month3.label" default="Март"/></option>
                    <option value="3"><g:message code="animal.age.month4.label" default="Апрель"/></option>
                    <option value="4"><g:message code="animal.age.month5.label" default="Май"/></option>
                    <option value="5"><g:message code="animal.age.month6.label" default="Июнь"/></option>
                    <option value="6"><g:message code="animal.age.month7.label" default="Июль"/></option>
                    <option value="7"><g:message code="animal.age.month8.label" default="Август"/></option>
                    <option value="8"><g:message code="animal.age.month9.label" default="Сентябрь"/></option>
                    <option value="9"><g:message code="animal.age.month10.label" default="Октябрь"/></option>
                    <option value="10"><g:message code="animal.age.month11.label" default="Ноябрь"/></option>
                    <option value="11"><g:message code="animal.age.month12.label" default="Декабрь"/></option>
                </select>
                <select id="years" class="input-mini" style="font-size: 12px">
                </select>
                <span class="help-inline" id="agelabel">0 мес.</span>
                <span class="help-inline">${hasErrors(bean: animalInstance, field: 'age', 'error')}</span>
            </div>
        </div>
    </div>
</div>

<div class="row">
    <div class="span3">
        <div class="control-group fieldcontain ${hasErrors(bean: animalInstance, field: 'color', 'error')} ">
            <label for="color" class="control-label"><g:message code="animal.color.label"
                                                                default="Color"/></label>

            <div class="controls">
                %{--<g:textField name="color"--}%
                %{--class="input-large"--}%
                %{--style="height: 30px"--}%
                %{--value="${animalInstance?.color}"/>--}%
                <g:select id="color" name="color.id"
                          from="${ru.homeless.model.animal.AnimalColor.list()}"
                          optionKey="id" value="${animalInstance?.color?.id}"
                          class="span2"
                          noSelection="['null': '']"/>
                <span class="help-inline">${hasErrors(bean: animalInstance, field: 'color', 'error')}</span>
            </div>
        </div>
    </div>

    <div class="span3">
        <div class="control-group fieldcontain ${hasErrors(bean: animalInstance, field: 'character', 'error')} ">
            <label for="character" class="control-label"><g:message code="animal.character.label"
                                                                    default="Character"/></label>

            <div class="controls">
                <g:select id="character" name="character.id"
                          from="${ru.homeless.model.animal.AnimalCharacter.list()}"
                          optionKey="id" value="${animalInstance?.character?.id}"
                          class="span2"
                          noSelection="['null': '']"/>
                <span class="help-inline">${hasErrors(bean: animalInstance, field: 'character', 'error')}</span>
            </div>
        </div>
    </div>

    <div class="span3">
        <div class="control-group fieldcontain ${hasErrors(bean: animalInstance, field: 'hair', 'error')} ">
            <label for="hair" class="control-label"><g:message code="animal.hair.label"
                                                               default="hair"/></label>

            <div class="controls">
                <g:select id="hair" name="hair.id"
                          from="${ru.homeless.model.animal.AnimalHair.list()}"
                          optionKey="id" value="${animalInstance?.hair?.id}"
                          class="span2"
                          noSelection="['null': '']"/>
                <span class="help-inline">${hasErrors(bean: animalInstance, field: 'hair', 'error')}</span>
            </div>
        </div>
    </div>
</div>


<div class="row">
    <div class="span6">
        <div class="control-group fieldcontain ${hasErrors(bean: animalInstance, field: 'description', 'error')} ">
            <label for="description" class="control-label"><g:message code="animal.description.label"
                                                                      default="Description"/></label>

            <div class="controls">
                <g:textArea class="span6" name="description" value="${animalInstance?.description}" rows="5"/>
                <span class="help-inline">${hasErrors(bean: animalInstance, field: 'description', 'error')}</span>
            </div>
        </div>
    </div>

    %{--<div class="span3">--}%
    %{--<div class="row">--}%
    %{--<div class="span3">--}%
    %{--<div class="control-group fieldcontain ${hasErrors(bean: animalInstance, field: 'color', 'error')} ">--}%
    %{--<label for="color" class="control-label"><g:message code="animal.color.label"--}%
    %{--default="Color"/></label>--}%

    %{--<div class="controls">--}%
    %{--<g:textField name="color"--}%
    %{--class="input-large"--}%
    %{--style="height: 30px"--}%
    %{--value="${animalInstance?.color}"/>--}%
    %{--<g:select id="color" name="color.id"--}%
    %{--from="${ru.homeless.model.animal.AnimalHair.list()}"--}%
    %{--optionKey="id" value="${animalInstance?.color?.id}" class="input-large"--}%
    %{--noSelection="['null': '']"/>--}%
    %{--<span class="help-inline">${hasErrors(bean: animalInstance, field: 'color', 'error')}</span>--}%
    %{--</div>--}%
    %{--</div>--}%
    %{--</div>--}%
    %{--</div>--}%

    %{--<div class="row">--}%
    %{--<div class="span3">--}%
    %{--<div class="control-group fieldcontain ${hasErrors(bean: animalInstance, field: 'character', 'error')} ">--}%
    %{--<label for="character" class="control-label"><g:message code="animal.character.label"--}%
    %{--default="Character"/></label>--}%

    %{--<div class="controls">--}%
    %{--<g:select id="character" name="character.id"--}%
    %{--from="${ru.homeless.model.animal.AnimalCharacter.list()}"--}%
    %{--optionKey="id" value="${animalInstance?.character?.id}" class="input-large"--}%
    %{--noSelection="['null': '']"/>--}%
    %{--<span class="help-inline">${hasErrors(bean: animalInstance, field: 'character', 'error')}</span>--}%
    %{--</div>--}%
    %{--</div>--}%
    %{--</div>--}%
    %{--</div>--}%
    %{--</div>--}%
</div>

<div class="row">
    <div class="span9">
        <div class="control-group fieldcontain ${hasErrors(bean: animalInstance, field: 'photos', 'error')} ">
            <label for="albumfileupload" class="control-label"><g:message code="animal.photos.label"
                                                                          default="Фотоальбом"/></label>

            <div class="controls">
                <g:render template="/image-gallery/image_list" model="['photos': animalInstance?.photos]"/>
                <g:render template='/image-gallery/image' model="['photo': null, 'i': '_clone', 'hidden': true]"/>
                <input id="albumfileupload" type="file" name="files1[]"
                       data-url="${createLink(controller: 'Animal', action: 'upload')}"
                       autoUpload="true"
                       multiple="true"
                       replaceFileInput="false"
                       class="jfilestyle" data-theme="orange"/>

                <span class="help-inline">${hasErrors(bean: animalInstance, field: 'photos', 'error')}</span>
            </div>
        </div>
    </div>
</div>

<div class="row">
    <div class="span3">
        <div class="control-group fieldcontain ${hasErrors(bean: animalInstance, field: 'place', 'error')} ">
            <label for="place" class="control-label"><g:message code="animal.place.label" default="Place"/></label>

            <div class="controls">
                <g:select id="place" name="place.id" from="${ru.homeless.model.animal.AnimalPlace.list()}"
                          optionKey="id" required="" value="${animalInstance?.place?.id}"
                          class="span2"/>
                <span class="help-inline">${hasErrors(bean: animalInstance, field: 'place', 'error')}</span>
            </div>
        </div>
    </div>

    <div class="span3">
        <div class="control-group fieldcontain ${hasErrors(bean: animalInstance, field: 'animalFilterStatus', 'error')} ">
            <label for="status" class="control-label"><g:message code="animal.status.label" default="Status"/></label>

            <div class="controls">
                <g:select id="status" name="status.id" from="${ru.homeless.model.animal.AnimalStatus.list()}"
                          optionKey="id" required="" value="${animalInstance?.status?.id}"
                          class="span2"/>
                <span class="help-inline">${hasErrors(bean: animalInstance, field: 'animalFilterStatus', 'error')}</span>
            </div>
        </div>
    </div>

    <div class="span3">
    </div>
</div>

<sec:ifAnyGranted roles="ROLE_ADMIN">
    <div class="row">
        <div class="span3">
            <div class="control-group fieldcontain ${hasErrors(bean: animalInstance, field: 'animalFilterFindOwner', 'error')} ">
                <label for="findOwner" class="control-label"><g:message code="animal.findOwner.label"
                                                                        default="Find Owner"/></label>

                <div class="controls">
                    <bs:checkBox name="findOwner" value="${animalInstance?.findOwner}"/>
                    <span class="help-inline">${hasErrors(bean: animalInstance, field: 'animalFilterFindOwner', 'error')}</span>
                </div>
            </div>
        </div>

        <div class="span3">
            <div class="control-group fieldcontain ${hasErrors(bean: animalInstance, field: 'losted', 'error')} ">
                <label for="losted" class="control-label"><g:message code="animal.losted.label"
                                                                     default="Losted"/></label>

                <div class="controls">
                    <bs:checkBox name="losted" value="${animalInstance?.losted}"/>
                    <span class="help-inline">${hasErrors(bean: animalInstance, field: 'losted', 'error')}</span>
                </div>
            </div>
        </div>

        <div class="span3">
            <div class="control-group fieldcontain ${hasErrors(bean: animalInstance, field: 'animalFilterPublished', 'error')} ">
                <label for="published" class="control-label"><g:message code="animal.published.label"
                                                                        default="Published"/></label>

                <div class="controls">
                    <bs:checkBox name="published" value="${animalInstance?.published}"/>
                    <span class="help-inline">${hasErrors(bean: animalInstance, field: 'animalFilterPublished', 'error')}</span>
                </div>

            </div>
        </div>
    </div>
</sec:ifAnyGranted>

%{--<g:render template="/image-gallery/galery_template"/>--}%

<script>
    $(document).ready((function () {
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
        $('#years').change(function () {
            var year = $('#years').val();
            var month = $('#month').val();
            var totalMonth = (lastYear - year) * 12 + currentMonth - parseInt(month, 10);
            $('#agelabel').text(totalMonth + ' мес.');
            $('#age').val(year + (parseInt(month, 10) + 1));
        });
        $('#month').change(function () {
            var year = $('#years').val();
            var month = $('#month').val();
            var totalMonth = (lastYear - year) * 12 + currentMonth - parseInt(month, 10);
            $('#agelabel').text(totalMonth + ' мес.');
            $('#age').val(year + (parseInt(month, 10) + 1));
        });


        var lastYear = new Date().getFullYear();
        var selectedYear;
        var currentMonth = new Date().getMonth();
        var selectedMonth;
        if ($('#age').val()) {
            selectedYear = $('#age').val().substring(0, 4);
            selectedMonth = parseInt($('#age').val().substring(4, 6), 10) - 1;
        } else {
            selectedYear = new Date().getFullYear();
            selectedMonth = new Date().getMonth();
        }
        for (var i = 2000; i <= new Date().getFullYear(); i++) {
            $('#years').append('<option value=\"' + i + '\">' + i + '</option>');
        }
        $("#years option:contains(" + selectedYear + ")").attr('selected', 'selected');
        $("#month option[value=" + selectedMonth + "]").attr('selected', 'selected');
        $('#agelabel').text((lastYear - selectedYear) * 12 + currentMonth - parseInt(selectedMonth, 10) + ' мес.');
        $('#age').val(lastYear + '' + (currentMonth + 1));
    }))

</script>







