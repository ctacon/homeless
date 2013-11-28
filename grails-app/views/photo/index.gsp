
<%@ page import="ru.homeless.model.Photo" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'photos.label', default: 'Photo')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-photo" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-photo" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="fileSize" title="${message(code: 'photos.fileSize.label', default: 'File Size')}" />
					
						<g:sortableColumn property="newFilename" title="${message(code: 'photos.newFilename.label', default: 'New Filename')}" />
					
						<g:sortableColumn property="originalFilename" title="${message(code: 'photos.originalFilename.label', default: 'Original Filename')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${photoInstanceList}" status="i" var="photoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${photoInstance.id}">${fieldValue(bean: photoInstance, field: "fileSize")}</g:link></td>
					
						<td>${fieldValue(bean: photoInstance, field: "newFilename")}</td>
					
						<td>${fieldValue(bean: photoInstance, field: "originalFilename")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${photoInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
