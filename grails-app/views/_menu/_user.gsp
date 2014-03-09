<ul class="nav pull-right">
    <sec:ifNotGranted roles="ROLE_USER">

        <s2ui:linkButton class="btn btn-link" elementId='register' controller='register'
                         messageCode='spring.security.ui.login.register'/>
        <g:link class="btn btn-success" controller='login' action='auth' elementId='login'><g:message
                code='security.signin.label'/></g:link>
    </sec:ifNotGranted>
    <sec:ifAnyGranted roles="ROLE_USER,ROLE_FACEBOOK">
        <a href="${createLink(controller: "person", action: 'index')}">${personInstance?.getLoggedInName()}</a>

        <g:link controller='logout' action='index'>
            <g:message code="security.signoff.label"
                       default="LogOut"/></g:link>
    </sec:ifAnyGranted>

%{--<s2o:ifLoggedInWith provider="facebook">facebook yes</s2o:ifLoggedInWith>--}%
%{--<s2o:ifNotLoggedInWith provider="facebook">facebook no</s2o:ifNotLoggedInWith>--}%
%{--<s2o:ifLoggedInWith provider="vkontakte">yes</s2o:ifLoggedInWith>--}%
%{--<s2o:ifNotLoggedInWith provider="vkontakte">no</s2o:ifNotLoggedInWith>--}%

</ul>



