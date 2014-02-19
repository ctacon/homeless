<%@ page import="ru.homeless.model.animal.Animal" %>
<!doctype html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="homeless_layout"/>
    <g:set var="entityName" value="${message(code: 'animal.label', default: 'Animal')}"/>
    <title><g:message code="default.edit.label" args="[entityName]"/></title>
    <r:require module="fileupload"/>
</head>

<body>

<section id="edit-animal" class="first">

    <g:hasErrors bean="${animalInstance}">
        <div class="alert alert-error">
            <g:renderErrors bean="${animalInstance}" as="list"/>
        </div>
    </g:hasErrors>

    <g:form method="post" class="well form-inline span9">
        <g:hiddenField name="id" value="${animalInstance?.id}"/>
        <g:hiddenField name="version" value="${animalInstance?.version}"/>
        <fieldset class="form">
            <g:render template="form"/>
        </fieldset>

        <div class="form-actions pull-right">
            <g:actionSubmit class="btn btn-danger" action="delete"
                            value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                            onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
            <g:actionSubmit class="btn btn-primary" action="update"
                            value="${message(code: 'default.button.update.label', default: 'Update')}"/>

        </div>
    </g:form>

</section>

</body>

</html>
