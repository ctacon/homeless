<html>
<head>
	<title><g:message code="springSecurity.login.title"/></title>
	<meta name="layout" content="kickstart" />

	<%--g:set var="layout_nomainmenu"		value="${true}" scope="request"/--%>
	<g:set var="layout_nosecondarymenu"	value="${true}" scope="request"/>
</head>

<body>

<section id="login" class="first">
<div class="row">
	<div class="span3"></div>
	<div class="span6">
		<h3> <g:message code="springSecurity.login.header"/> </h3>
		<form id='loginForm' class='form-horizontal' action='${postUrl}' method='POST' autocomplete='on'>
            <input  name="_spring_security_remember_me" id="remember-me" value="1"  type="hidden">
			<fieldset class="form">
				<div class="control-group fieldcontain ${hasErrors(bean: _DemoPageInstance, field: 'name', 'error')} ">
					<label for='username' class="control-label"><g:message code="springSecurity.login.username.label"/>:</label>
					<div class="controls">
						<input type='text' class='span4' name='j_username' id='username'/>
					</div>
				</div>
	
				<div class="control-group fieldcontain ${hasErrors(bean: _DemoPageInstance, field: 'name', 'error')} ">
					<label for='password' class="control-label"><g:message code="springSecurity.login.password.label"/>:</label>
					<div class="controls">
						<input type='password' class='span4' name='j_password' id='password'/>
					</div>
				</div>
			</fieldset>
			<div class="controls">
				<input type='submit' id="submit" class="btn btn-success" value='${message(code: "springSecurity.login.button")}'/>
                <s2ui:linkButton elementId='register' controller='register' messageCode='spring.security.ui.login.register'/>
                <g:link controller='register' action='forgotPassword'><g:message code='spring.security.ui.login.forgotPassword'/></g:link>
			</div>

		</form>
	</div>
	<div class="span3"></div>
</div>
</section>

<script type='text/javascript'>
	<!--
	(function() {
		document.forms['loginForm'].elements['j_username'].focus();
	})();
	// -->
</script>

</body>
</html>