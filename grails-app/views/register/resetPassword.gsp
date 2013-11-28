<html>

<head>
<title><g:message code='spring.security.ui.resetPassword.title'/></title>
    <meta name="layout" content="kickstart" />
    <g:set var="layout_nosecondarymenu"	value="${true}" scope="request"/>
</head>

<body>
<section id="resetSelection" class="first">
    <div class="row">
        <div class="span3"></div>
        <div class="span6">
            <h3> <g:message code="spring.security.ui.resetPassword.header"/> </h3>

            <form id='resetPasswordForm' class='form-horizontal' action='resetPassword' method='POST' autocomplete='off'>
                <input  name="t" id="t" value="${token}"  type="hidden">
                <h4><g:message code='spring.security.ui.resetPassword.description'/></h4>

                <fieldset class="form">
                    <div class="control-group fieldcontain ${hasErrors(bean: command, field: 'password', 'error')} ">
                        <label for='password' class="control-label"><g:message code="resetPasswordCommand.password.label"/>:</label>
                        <div class="controls">
                            <input type='text' class='span4' name='password' id='password'
                                   bean="${command}" value="${command.password}"/>
                            <g:eachError bean="${command}" field="password">
                                <span class="help-inline"><g:message error="${it}"/></span>
                            </g:eachError>
                        </div>
                    </div>

                    <div class="control-group fieldcontain ${hasErrors(bean: command, field: 'password2', 'error')} ">
                        <label for='password' class="control-label"><g:message code="resetPasswordCommand.password2.label"/>:</label>
                        <div class="controls">
                            <input type='password' class='span4' name='password2' id='password2'
                                   bean="${command}" value="${command.password2}"/>
                            <g:eachError bean="${command}" field="password2">
                                <span class="help-inline"><g:message error="${it}"/></span>
                            </g:eachError>
                        </div>
                    </div>
                </fieldset>
                <div class="controls">
                    <input type='submit' id="reset" class="btn btn-success" value='${message(code: "spring.security.ui.resetPassword.submit")}'/>
                </div>

            </form>
        </div>
        <div class="span3"></div>
    </div>
</section>

<script>
$(document).ready(function() {
	$('#password').focus();
});
</script>

</body>
</html>
