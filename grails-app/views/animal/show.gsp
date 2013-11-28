
<%@ page import="ru.homeless.model.animal.Animal" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'animal.label', default: 'Animal')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-animal" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="animal.name.label" default="Name" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: animalInstance, field: "name")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="animal.age.label" default="Age" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: animalInstance, field: "age")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="animal.color.label" default="Color" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: animalInstance, field: "color")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="animal.character.label" default="Character" /></td>
				
				<td valign="top" class="value"><g:link controller="animalCharacter" action="show" id="${animalInstance?.character?.id}">${animalInstance?.character?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="animal.avatar.label" default="Avatar" /></td>
				
				<td valign="top" class="value"><g:link controller="photo" action="show" id="${animalInstance?.avatar?.id}">${animalInstance?.avatar?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="animal.description.label" default="Description" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: animalInstance, field: "description")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="animal.photos.label" default="Photos" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${animalInstance.photos}" var="p">
						<li><g:link controller="photo" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="animal.comments.label" default="Comments" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${animalInstance.comments}" var="c">
						<li><g:link controller="comment" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="animal.status.label" default="Status" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: animalInstance, field: "status")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="animal.place.label" default="Place" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: animalInstance, field: "place")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="animal.findOwner.label" default="Find Owner" /></td>
				
				<td valign="top" class="value"><g:formatBoolean boolean="${animalInstance?.findOwner}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="animal.losted.label" default="Losted" /></td>
				
				<td valign="top" class="value"><g:formatBoolean boolean="${animalInstance?.losted}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="animal.published.label" default="Published" /></td>
				
				<td valign="top" class="value"><g:formatBoolean boolean="${animalInstance?.published}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="animal.sex.label" default="Sex" /></td>
				
				<td valign="top" class="value"><g:link controller="animalSex" action="show" id="${animalInstance?.sex?.id}">${animalInstance?.sex?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="animal.type.label" default="Type" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: animalInstance, field: "type")}</td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
