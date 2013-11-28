
<%@ page import="ru.homeless.model.Photo" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'photos.label', default: 'Photo')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list-photo" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:sortableColumn property="fileSize" title="${message(code: 'photos.fileSize.label', default: 'File Size')}" />
			
				<g:sortableColumn property="newFilename" title="${message(code: 'photos.newFilename.label', default: 'New Filename')}" />
			
				<g:sortableColumn property="originalFilename" title="${message(code: 'photos.originalFilename.label', default: 'Original Filename')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${photoInstanceList}" status="i" var="photoInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${photoInstance.id}">${fieldValue(bean: photoInstance, field: "fileSize")}</g:link></td>
			
				<td>${fieldValue(bean: photoInstance, field: "newFilename")}</td>
			
				<td>${fieldValue(bean: photoInstance, field: "originalFilename")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${photoInstanceTotal}" />
	</div>
</section>

</body>

</html>
