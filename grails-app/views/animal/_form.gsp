<%@ page import="ru.homeless.model.animal.Animal" %>



			<div class="control-group fieldcontain ${hasErrors(bean: animalInstance, field: 'name', 'error')} required">
				<label for="name" class="control-label"><g:message code="animal.name.label" default="Name" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textField name="name" maxlength="50" required="" value="${animalInstance?.name}"/>
					<span class="help-inline">${hasErrors(bean: animalInstance, field: 'name', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: animalInstance, field: 'age', 'error')} required">
				<label for="age" class="control-label"><g:message code="animal.age.label" default="Age" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:field type="number" name="age" max="360" required="" value="${animalInstance.age}"/>
					<span class="help-inline">${hasErrors(bean: animalInstance, field: 'age', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: animalInstance, field: 'color', 'error')} ">
				<label for="color" class="control-label"><g:message code="animal.color.label" default="Color" /></label>
				<div class="controls">
					<g:textField name="color" value="${animalInstance?.color}"/>
					<span class="help-inline">${hasErrors(bean: animalInstance, field: 'color', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: animalInstance, field: 'character', 'error')} ">
				<label for="character" class="control-label"><g:message code="animal.character.label" default="Character" /></label>
				<div class="controls">
					<g:select id="character" name="character.id" from="${ru.homeless.model.animal.AnimalCharacter.list()}" optionKey="id" value="${animalInstance?.character?.id}" class="many-to-one" noSelection="['null': '']"/>
					<span class="help-inline">${hasErrors(bean: animalInstance, field: 'character', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: animalInstance, field: 'avatar', 'error')} ">
				<label for="avatar" class="control-label"><g:message code="animal.avatar.label" default="Avatar" /></label>
				<div class="controls">
					<g:select id="avatar" name="avatar.id" from="${ru.homeless.model.Photo.list()}" optionKey="id" value="${animalInstance?.avatar?.id}" class="many-to-one" noSelection="['null': '']"/>
					<span class="help-inline">${hasErrors(bean: animalInstance, field: 'avatar', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: animalInstance, field: 'description', 'error')} ">
				<label for="description" class="control-label"><g:message code="animal.description.label" default="Description" /></label>
				<div class="controls">
					<g:textField name="description" value="${animalInstance?.description}"/>
					<span class="help-inline">${hasErrors(bean: animalInstance, field: 'description', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: animalInstance, field: 'photos', 'error')} ">
				<label for="photos" class="control-label"><g:message code="animal.photos.label" default="Photos" /></label>
				<div class="controls">
					<g:select name="photos" from="${ru.homeless.model.Photo.list()}" multiple="multiple" optionKey="id" size="5" value="${animalInstance?.photos*.id}" class="many-to-many"/>
					<span class="help-inline">${hasErrors(bean: animalInstance, field: 'photos', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: animalInstance, field: 'comments', 'error')} ">
				<label for="comments" class="control-label"><g:message code="animal.comments.label" default="Comments" /></label>
				<div class="controls">
					<g:select name="comments" from="${ru.homeless.model.Comment.list()}" multiple="multiple" optionKey="id" size="5" value="${animalInstance?.comments*.id}" class="many-to-many"/>
					<span class="help-inline">${hasErrors(bean: animalInstance, field: 'comments', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: animalInstance, field: 'status', 'error')} ">
				<label for="status" class="control-label"><g:message code="animal.status.label" default="Status" /></label>
				<div class="controls">
					
					<span class="help-inline">${hasErrors(bean: animalInstance, field: 'status', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: animalInstance, field: 'place', 'error')} ">
				<label for="place" class="control-label"><g:message code="animal.place.label" default="Place" /></label>
				<div class="controls">
					
					<span class="help-inline">${hasErrors(bean: animalInstance, field: 'place', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: animalInstance, field: 'findOwner', 'error')} ">
				<label for="findOwner" class="control-label"><g:message code="animal.findOwner.label" default="Find Owner" /></label>
				<div class="controls">
					<bs:checkBox name="findOwner" value="${animalInstance?.findOwner}" />
					<span class="help-inline">${hasErrors(bean: animalInstance, field: 'findOwner', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: animalInstance, field: 'losted', 'error')} ">
				<label for="losted" class="control-label"><g:message code="animal.losted.label" default="Losted" /></label>
				<div class="controls">
					<bs:checkBox name="losted" value="${animalInstance?.losted}" />
					<span class="help-inline">${hasErrors(bean: animalInstance, field: 'losted', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: animalInstance, field: 'published', 'error')} ">
				<label for="published" class="control-label"><g:message code="animal.published.label" default="Published" /></label>
				<div class="controls">
					<bs:checkBox name="published" value="${animalInstance?.published}" />
					<span class="help-inline">${hasErrors(bean: animalInstance, field: 'published', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: animalInstance, field: 'sex', 'error')} required">
				<label for="sex" class="control-label"><g:message code="animal.sex.label" default="Sex" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="sex" name="sex.id" from="${ru.homeless.model.animal.AnimalSex.list()}" optionKey="id" required="" value="${animalInstance?.sex?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: animalInstance, field: 'sex', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: animalInstance, field: 'type', 'error')} required">
				<label for="type" class="control-label"><g:message code="animal.type.label" default="Type" /><span class="required-indicator">*</span></label>
				<div class="controls">
					
					<span class="help-inline">${hasErrors(bean: animalInstance, field: 'type', 'error')}</span>
				</div>
			</div>
