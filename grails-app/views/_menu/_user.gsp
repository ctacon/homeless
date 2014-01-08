<ul class="nav pull-right">

    <sec:ifNotLoggedIn>
        <g:link class="btn btn-success" controller='login' action='auth' elementId='login'><g:message code='security.signin.label'/></g:link>
        <s2ui:linkButton class="btn btn-inverse" elementId='register' controller='register' messageCode='spring.security.ui.login.register'/>
    </sec:ifNotLoggedIn>
    <sec:ifLoggedIn>
        <sec:username/> <g:link  controller='logout' action='index'><g:message code="security.signoff.label"
                                                                              default="LogOut"/></g:link>

    </sec:ifLoggedIn>

</ul>



