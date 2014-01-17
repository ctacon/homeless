<%@ page import="ru.homeless.model.animal.Animal" %>
<!doctype html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="homeless_layout"/>
    <g:set var="entityName" value="${message(code: 'animal.label', default: 'Animal')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<section id="list-animal" class="first">
    <sec:ifLoggedIn>
        <g:link class="btn btn-primary" action="create"><g:message code="default.new.label"
                                                                   args="[entityName]"/></g:link>
    </sec:ifLoggedIn>
    <ul class="thumbnails">
    <div class="row">
        <g:each in="${animalInstanceList}" status="i" var="animalInstance">
            <g:if test="${i % 3 == 0}">
                </div>
                <div class="row">
            </g:if>
            <li class="span2">
                <div class="thumbnail">
                    <g:link action="show" id="${animalInstance.id}">
                        <img data-src="holder.js/150%x150" alt=""
                             src="${animalInstance.avatar ?
                                 createLink(controller: 'Photo', action: 'thumbnail', id: animalInstance.avatar.id)
                             : resource(dir: 'images', file: 'cat.jpg')}">

                    </g:link>
                    <div class="caption">
                        <h6 class="text-center">${fieldValue(bean: animalInstance, field: "name")}</h6>

                        <p style="word-wrap: break-word"><small>${animalInstance.getShortDescription()}...</small></p>
                    </div>
                </div>
            </li>
        </g:each>
    </div>
    </ul>


    <div class="pagination">
        <bs:paginate total="${animalInstanceTotal}"
                     next="Вперед"
                     prev="Назад"/>
    </div>
</section>
</body>

</html>
