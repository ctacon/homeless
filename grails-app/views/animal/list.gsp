<%@ page import="ru.homeless.model.animal.Animal" %>
<!doctype html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="kickstart"/>
    <g:set var="entityName" value="${message(code: 'animal.label', default: 'Animal')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
    <r:require module="filterpane"/>
</head>

<body>

<section id="list-animal" class="first">
    <div class="row">
        <g:each in="${animalInstanceList}" status="i" var="animalInstance">
            <div class="col-sm-6 col-md-4">
                <div class="thumbnail">
                    <g:link action="show" id="${animalInstance.id}">${fieldValue(bean: animalInstance, field: "name")}
                        <img data-src="holder.js/200x200" alt="100%x180"
                             style="height: 180px; width: 100%; display: block;"
                             src="${animalInstance.avatar ?
                                 createLink(controller: 'Photo', action: 'thumbnail', id: animalInstance.avatar.id)
                             : resource(dir: 'images', file: 'cat.jpeg')}">

                        <div class="caption">
                            <p>${animalInstance.description}</p>
                        </div>
                    </g:link>
                </div>
            </div>
        </g:each>
    </div>

    <div class="pagination">
        <bs:paginate total="${animalInstanceTotal == null ? animalInstanceList.count() : animalInstanceTotal}"
                     params="${filterParams}"/>
    </div>

    <filterpane:filterPane domain="Animal" visible="y" showSortPanel="n" showTitle="n"
                           />
</section>
</body>

</html>
