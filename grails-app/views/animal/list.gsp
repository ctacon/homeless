
<%@ page import="ru.homeless.model.animal.Animal" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'animal.label', default: 'Animal')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list-animal" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:sortableColumn property="name" title="${message(code: 'animal.name.label', default: 'Name')}" />
			
				<g:sortableColumn property="age" title="${message(code: 'animal.age.label', default: 'Age')}" />
			
				<g:sortableColumn property="color" title="${message(code: 'animal.color.label', default: 'Color')}" />
			
				<th><g:message code="animal.character.label" default="Character" /></th>
			
				<th><g:message code="animal.avatar.label" default="Avatar" /></th>
			
				<g:sortableColumn property="description" title="${message(code: 'animal.description.label', default: 'Description')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${animalInstanceList}" status="i" var="animalInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${animalInstance.id}">${fieldValue(bean: animalInstance, field: "name")}</g:link></td>
			
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
		<bs:paginate total="${animalInstanceTotal}" />
	</div>
</section>

</body>

</html>
