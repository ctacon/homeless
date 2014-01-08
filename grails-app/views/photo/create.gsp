<%@ page import="ru.homeless.model.Photo" %>
<!doctype html>
<html>

<head>
    <meta http-equiv="Content-Type" content="application/json"/>
    <meta name="layout" content="homeless_layout"/>
    <g:set var="entityName" value="${message(code: 'photos.label', default: 'Photo')}"/>
    <title><g:message code="default.create.label" args="[entityName]"/></title>
    <r:require modules="bootstrap-file-upload"/>
</head>

<body>

<section id="create-photo" class="first">

    <g:hasErrors bean="${photoInstance}">
        <div class="alert alert-error">
            <g:renderErrors bean="${photoInstance}" as="list"/>
        </div>
    </g:hasErrors>

    <bsfu:fileUpload action="upload" controller="Photo"/>

%{--<g:form action="save" class="form-horizontal" >
    <fieldset class="form">
        <g:render template="form"/>
    </fieldset>
    <div class="form-actions">
        <g:submitButton name="create" class="btn btn-primary" value="${message(code: 'default.button.create.label', default: 'Create')}" />
        <button class="btn" type="reset"><g:message code="default.button.reset.label" default="Reset" /></button>
    </div>
</g:form>--}%

</section>

</body>

</html>
