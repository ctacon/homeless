<html>

<head>
<title><g:message code='spring.security.ui.forgotPassword.title'/></title>
    <meta name="layout" content="kickstart" />
    <g:set var="layout_nosecondarymenu"	value="${true}" scope="request"/>
</head>

<body>

<section id="login" class="first">
    <div class="row">
        <div class="span3"></div>
        <div class="span6">
            <h3> <g:message code="spring.security.ui.forgotPassword.header"/> </h3>
            <form id='forgotPassword' name="forgotPasswordForm" class='form-horizontal' action='forgotPassword' method='POST' autocomplete='on'>
                <g:if test='${emailSent}'>
                    <br/>
                    <g:message code='spring.security.ui.forgotPassword.sent'/>
                </g:if>
                <g:else>
                   <br/>
                    <h4><g:message code='spring.security.ui.forgotPassword.description'/></h4>
                    <fieldset class="form">
                        <div class="control-group fieldcontain ${hasErrors(bean: _DemoPageInstance, field: 'name', 'error')} ">
                            <label for='username' class="control-label"><g:message code="spring.security.ui.forgotPassword.username"/>:</label>
                            <div class="controls">
                                <input type='text' class='span4' name='username' id='username'/>
                            </div>
                        </div>
                    </fieldset>
                    <div class="controls">
                        <input type='submit' id="reset" class="btn btn-success" value='${message(code: "spring.security.ui.forgotPassword.submit")}'/>
                    </div>

                </g:else>
             </form>
        </div>
        <div class="span3"></div>
    </div>
</section>


<script>
$(document).ready(function() {
	$('#username').focus();
});
</script>

</body>
</html>
