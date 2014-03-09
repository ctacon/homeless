<html>
<head>
    <title><g:message code="springSecurity.login.title"/></title>
    <meta name="layout" content="homeless_layout"/>
</head>

<body>

<section id="login" class="first">
    <div class="row">
        <div class="span3"></div>

        <div class="span8">
            <h3 class="offset3"><g:message code="springSecurity.login.header"/></h3>

            <form id='loginForm' class='form-horizontal offset1' action='${postUrl}' method='POST' autocomplete='on'>
                <input name="_spring_security_remember_me" id="remember-me" value="1" type="hidden">

                <div class="controls">
                    <oauth:connect provider="facebook"
                                   id="facebook-connect-link"><img width="150"
                            src="${resource(dir: 'images/auth/', file: 'f-3.jpg')}"/></oauth:connect>
                    <oauth:connect provider="vkontakte" id="vkontakte-connect-link"><img    width="150"
                            src="${resource(dir: 'images/auth/', file: 'an_02.jpg')}"/></oauth:connect>
                </div>


                <fieldset class="form">
                    <div class="control-group fieldcontain ${hasErrors(bean: _DemoPageInstance, field: 'name', 'error')} ">
                        <label for='username' class="control-label"><g:message
                                code="springSecurity.login.username.label"/>:</label>

                        <div class="controls">
                            <input type='text' style="height: 30px" class='span3' name='j_username' id='username'/>
                        </div>
                    </div>

                    <div class="control-group fieldcontain ${hasErrors(bean: _DemoPageInstance, field: 'name', 'error')} ">
                        <label for='password' class="control-label"><g:message
                                code="springSecurity.login.password.label"/>:</label>

                        <div class="controls">
                            <input type='password' style="height: 30px" class='span3' name='j_password' id='password'/>

                        </div>
                    </div>
                </fieldset>

                <div class="controls">
                    <input type='submit' id="submit" class="btn btn-success"
                           value='${message(code: "springSecurity.login.button")}'/>
                    <s2ui:linkButton
                            class="btn btn-link"
                            elementId='register' controller='register'
                            messageCode='spring.security.ui.login.register'/>
                    <g:link class="btn btn-link"
                            controller='register' action='forgotPassword'><g:message
                            code='spring.security.ui.login.forgotPassword'/></g:link>

                </div>

            </form>
        </div>

        <div class="span3"></div>
    </div>
</section>

<script type='text/javascript'>
    <!--
    (function () {
        document.forms['loginForm'].elements['j_username'].focus();
    })();
    // -->
</script>

</body>
</html>
