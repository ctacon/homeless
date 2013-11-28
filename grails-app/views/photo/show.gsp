
<%@ page import="ru.homeless.model.Photo" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'photos.label', default: 'Photo')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-photo" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="photo.fileSize.label" default="File Size" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: photoInstance, field: "fileSize")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="photo.newFilename.label" default="New Filename" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: photoInstance, field: "newFilename")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="photo.originalFilename.label" default="Original Filename" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: photoInstance, field: "originalFilename")}</td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
