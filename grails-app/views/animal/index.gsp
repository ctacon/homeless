<%@ page import="ru.homeless.model.animal.Animal" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'animal.label', default: 'Animal')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<a href="#list-animal" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                             default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="list-animal" class="content scaffold-list" role="main">
    <h1><g:message code="default.list.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <table>
        <thead>
        <tr>

            <g:sortableColumn property="name" title="${message(code: 'animal.name.label', default: 'Name')}"/>

            <g:sortableColumn property="age" title="${message(code: 'animal.age.label', default: 'Age')}"/>

            <g:sortableColumn property="color" title="${message(code: 'animal.color.label', default: 'Color')}"/>

            <th><g:message code="animal.character.label" default="Character"/></th>

            <th><g:message code="animal.avatar.label" default="Avatar"/></th>

            <g:sortableColumn property="description"
                              title="${message(code: 'animal.description.label', default: 'Description')}"/>

        </tr>
        </thead>
        <tbody>
        <g:each in="${animalInstanceList}" status="i" var="animalInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                <td><g:link action="show"
                            id="${animalInstance.id}">${fieldValue(bean: animalInstance, field: "name")}</g:link></td>

                <td>${fieldValue(bean: animalInstance, field: "age")}</td>

                <td>${fieldValue(bean: animalInstance, field: "color")}</td>

                <td>${fieldValue(bean: animalInstance, field: "character")}</td>

                <td>${fieldValue(bean: animalInstance, field: "avatar")}</td>

                <td>${fieldValue(bean: animalInstance, field: "description")}</td>

            </tr>
        </g:each>
        </tbody>
    </table>

    <div class="pagination">
        <g:paginate total="${animalInstanceCount ?: 0}"/>
    </div>
</div>
</body>
</html>


