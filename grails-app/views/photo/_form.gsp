<%@ page import="ru.homeless.model.Photo" %>

<bsfu:fileUpload action="upload" controller="PhotoController"/>

%{--	<div class="control-group fieldcontain ${hasErrors(bean: photoInstance, field: 'fileSize', 'error')} required">
        <label for="fileSize" class="control-label"><g:message code="photos.fileSize.label" default="File Size" /><span class="required-indicator">*</span></label>
        <div class="controls">
            <g:field type="number" name="fileSize" required="" value="${photoInstance.fileSize}"/>
            <span class="help-inline">${hasErrors(bean: photoInstance, field: 'fileSize', 'error')}</span>
        </div>
    </div>

    <div class="control-group fieldcontain ${hasErrors(bean: photoInstance, field: 'newFilename', 'error')} ">
        <label for="newFilename" class="control-label"><g:message code="photos.newFilename.label" default="New Filename" /></label>
        <div class="controls">
            <g:textField name="newFilename" value="${photoInstance?.newFilename}"/>
            <span class="help-inline">${hasErrors(bean: photoInstance, field: 'newFilename', 'error')}</span>
        </div>
    </div>

    <div class="control-group fieldcontain ${hasErrors(bean: photoInstance, field: 'originalFilename', 'error')} ">
        <label for="originalFilename" class="control-label"><g:message code="photos.originalFilename.label" default="Original Filename" /></label>
        <div class="controls">
            <g:textField name="originalFilename" value="${photoInstance?.originalFilename}"/>
            <span class="help-inline">${hasErrors(bean: photoInstance, field: 'originalFilename', 'error')}</span>
        </div>
    </div>
--}%