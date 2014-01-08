<%@ page import="ru.homeless.model.animal.Animal" %>
<!doctype html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="homeless_layout"/>
    <g:set var="entityName" value="${message(code: 'animal.label', default: 'Animal')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>

<div class="row">
    <div class="span3 ">
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
    </div>

    <div class="span8">
        <div class="row">
            <div class="span4">
                <div class="row">
                    <div class="span2">
                        <strong><g:message code="animal.name.label" default="Name"/></strong>
                    </div>

                    <div class="span2">
                        ${fieldValue(bean: animalInstance, field: "name")}
                    </div>
                </div>

                <div class="row">
                    <div class="span2">
                        <strong><g:message code="animal.type.label" default="Type"/></strong>
                    </div>

                    <div class="span2">
                        ${fieldValue(bean: animalInstance, field: "type")}
                    </div>
                </div>

                <div class="row">
                    <div class="span2">
                        <strong><g:message code="animal.sex.label" default="Sex"/></strong>
                    </div>

                    <div class="span2">
                        ${animalInstance?.sex?.encodeAsHTML()}
                    </div>
                </div>

                <div class="row">
                    <div class="span2">
                        <strong><g:message code="animal.age.label" default="Age"/></strong>
                    </div>

                    <div class="span2">
                        ${fieldValue(bean: animalInstance, field: "age")}
                    </div>
                </div>

                <div class="row">
                    <div class="span2">
                        <strong><g:message code="animal.color.label" default="Color"/></strong>
                    </div>

                    <div class="span2">
                        ${fieldValue(bean: animalInstance, field: "color")}
                    </div>
                </div>

                <div class="row">
                    <div class="span2">
                        <strong><g:message code="animal.character.label" default="Character"/></strong>
                    </div>

                    <div class="span2">
                        ${animalInstance?.character?.encodeAsHTML()}
                    </div>
                </div>
            </div>

            <div class="span4">
                <div class="row">
                    <div class="span2">
                        <strong><g:message code="animal.status.label" default="Status"/></strong>
                    </div>

                    <div class="span2">
                        ${fieldValue(bean: animalInstance, field: "status")}
                    </div>
                </div>

                <div class="row">
                    <div class="span2">
                        <strong><g:message code="animal.place.label" default="Place"/></strong>
                    </div>

                    <div class="span2">
                        ${fieldValue(bean: animalInstance, field: "place")}
                    </div>
                </div>

                <div class="row">
                    <div class="span2">
                        <strong><g:message code="animal.findOwner.label" default="Find Owner"/></strong>
                    </div>

                    <div class="span2">
                        <g:if test="${animalInstance?.findOwner}"><g:message code="animal.yes.label"
                                                                             default="Да"/></g:if>
                        <g:if test="${!animalInstance?.findOwner}"><g:message code="animal.no.label"
                                                                              default="Нет"/></g:if>
                    </div>
                </div>

                <div class="row">
                    <div class="span2">
                        <strong><g:message code="animal.losted.label" default="Losted"/></strong>
                    </div>

                    <div class="span2">
                        <g:if test="${animalInstance?.losted}"><g:message code="animal.yes.label" default="Да"/></g:if>
                        <g:if test="${!animalInstance?.losted}"><g:message code="animal.no.label" default="Нет"/></g:if>
                    </div>
                </div>

                <div class="row">
                    <div class="span2">
                        <strong><g:message code="animal.published.label" default="Published"/></strong>
                    </div>

                    <div class="span2">
                        <g:if test="${animalInstance?.published}"><g:message code="animal.yes.label"
                                                                             default="Да"/></g:if>
                        <g:if test="${!animalInstance?.published}"><g:message code="animal.no.label"
                                                                              default="Нет"/></g:if>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="row">
    <div class="row">
        <div class="span1">
            <h4><g:message code="animal.description.label" default="Description"/></h4>
        </div>
    </div>

    <div class="row">
        <div class="span10">
            <div class="highlight">
                <p>${fieldValue(bean: animalInstance, field: "description")}</p>
            </div>
        </div>
    </div>
</div>

<div class="row">
    <div class="row">
        <div class="span1">
            <h4><g:message code="animal.photos.label" default="Фотоальбом"/></h4>
        </div>
    </div>

    <div class="row">
        <div class="span10">
            <div id="links">
                <ul id="photothumbnails" class="thumbnails">
                    <g:each var="photo" in="${animalInstance.photos}">
                        <li class="span2">
                            <div class="thumbnail">
                                <a id="imagelink" name="photos[${i}].imagelink"
                                   href="${createLink(controller: 'Photo', action: 'picture', id: photo?.id)}">
                                    <img id="thumbnaillink" data-src="holder.js/150%x150"
                                         src="${createLink(controller: 'Photo', action: 'thumbnail', id: photo?.id)}">
                                </a>
                            </div>
                        </li>
                    </g:each>
                </ul>
            </div>
        </div>
    </div>
</div>


<sec:ifLoggedIn>
    <sec:ifAnyGranted roles="ROLE_ADMIN">
        <div class="row">
            <div class="span1">
                <g:link class="btn btn-primary" action="edit"><g:message code="default.edit.label"
                                                                         args="[entityName]"/></g:link>
            </div>
        </div>
    </sec:ifAnyGranted>
</sec:ifLoggedIn>


<div class="row">
    <div class="row">
        <div class="span1">
            <h4><g:message code="animal.comments.label" default="Комментарии"/></h4>
        </div>
    </div>

    <div class="row">
        <div class="span10">

        </div>
    </div>
</div>



<g:render template="/image-gallery/galery_template"/>
</body>

</html>
