<html>
<head>
    <title><g:message code="springSecurity.login.title"/></title>
    <meta name="layout" content="homeless_layout"/>

    <%--g:set var="layout_nomainmenu"		value="${true}" scope="request"/--%>
    <g:set var="layout_nosecondarymenu" value="${true}" scope="request"/>
</head>

<body>

<section id="register" class="first">
    <%--<g:hasErrors bean="${command}">
         <div class="alert alert-error">
             <g:renderErrors bean="${command}" as="list" />
         </div>
     </g:hasErrors>   --%>
    <div class="row">
        <div class="span3"></div>

        <div class="span6">
            <h3><g:message code="spring.security.ui.register.description"/></h3>
            <g:form action='register' name='registerForm' class='form-horizontal' method='POST'>
                <g:if test='${emailSent}'>
                    <br/>
                    <g:message code='spring.security.ui.register.sent'/>
                </g:if>
                <g:else>
                    <fieldset class="form">
                        <div class="control-group fieldcontain ${hasErrors(bean: command, field: 'username', 'error')} required">
                            <label for='username' class="control-label"><g:message code="user.username.label"/>:</label>

                            <div class="controls">
                                <input type='text' class='span4' name='username' id='username'
                                       bean="${command}" value="${command.username}"/>
                                <g:eachError bean="${command}" field="username">
                                    <span class="help-inline"><g:message error="${it}"/></span>
                                </g:eachError>

                            </div>
                        </div>

                        <div class="control-group fieldcontain ${hasErrors(bean: command, field: 'email', 'error')} ">
                            <label for='email' class="control-label"><g:message code="user.email.label"/>:</label>

                            <div class="controls">
                                <input type='email' class='span4' name='email' id='email'
                                       bean="${command}" value="${command.email}"/>
                                <g:eachError bean="${command}" field="email">
                                    <span class="help-inline"><g:message error="${it}"/></span>
                                </g:eachError>
                            </div>
                        </div>

                        <div class="control-group fieldcontain ${hasErrors(bean: command, field: 'password', 'error')} ">
                            <label for='password' class="control-label"><g:message code="user.password.label"/>:</label>

                            <div class="controls">
                                <input class='span4' name='password' id='password'
                                       bean="${command}" value="${command.password}" type='password'/>
                                <g:eachError bean="${command}" field="password">
                                    <span class="help-inline"><g:message error="${it}"/></span>
                                </g:eachError>
                            </div>
                        </div>

                        <div class="control-group fieldcontain ${hasErrors(bean: command, field: 'password2', 'error')} ">
                            <label for='password2' class="control-label"><g:message
                                    code="user.password2.label"/>:</label>

                            <div class="controls">
                                <input class='span4' name='password2' id='password2'
                                       bean="${command}" value="${command.password2}" type='password'/>
                                <g:eachError bean="${command}" field="password2">
                                    <span class="help-inline"><g:message error="${it}"/></span>
                                </g:eachError>
                            </div>
                        </div>

                    </fieldset>

                    <div class="controls">
                        <input type='submit' id="submit" class="btn btn-success"
                               value='${message(code: "spring.security.ui.register.submit")}'/>
                    </div>
                </g:else>

            </g:form>
        </div>

        <div class="span3"></div>
    </div>
</section>

<script>
    $(document).ready(function () {
        $('#username').focus();
    });
</script>

</body>
</html>
