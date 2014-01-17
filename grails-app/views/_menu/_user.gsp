<ul class="nav pull-right">
    <sec:ifNotGranted roles="ROLE_USER">
        <g:link class="btn btn-success" controller='login' action='auth' elementId='login'><g:message
                code='security.signin.label'/></g:link>
        <s2ui:linkButton class="btn btn-inverse" elementId='register' controller='register'
                         messageCode='spring.security.ui.login.register'/>
    </sec:ifNotGranted>
    <sec:ifAnyGranted roles="ROLE_USER,ROLE_FACEBOOK">
        ${person.fullName}
        <g:link controller='logout' action='index'>
            <g:message code="security.signoff.label"
                       default="LogOut"/></g:link>
    </sec:ifAnyGranted>

</ul>



