<%@ page import="ru.homeless.model.animal.Animal" %>
<!doctype html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="homeless_layout"/>
    <g:set var="entityName" value="${message(code: 'animal.label', default: 'Animal')}"/>
    <title><g:message code="default.create.label" args="[entityName]"/></title>
    <r:require module="fileupload"/>
</head>

<body>

%{--<section id="create-animal" class="first">--}%
<div id="create-animal">

    <g:hasErrors bean="${animalInstance}">
        <div class="alert alert-error">
            <g:renderErrors bean="${animalInstance}" as="list"/>
        </div>
    </g:hasErrors>

    <g:form action="save" class="well form-inline span9">
        <fieldset class="form">
            <g:render template="form"/>
        </fieldset>

        <div class="form-actions pull-right">
            <g:submitButton name="create" class="btn btn-primary"
                            value="${message(code: 'default.button.create.label', default: 'Create')}"/>
            %{--<button class="btn" type="reset"><g:message code="default.button.reset.label" default="Reset"/></button>--}%
        </div>
    </g:form>
</div>
%{--</section>--}%
</body>

</html>
