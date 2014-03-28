<ul id="auth_block" class="nav pull-right ">
    <li>
        <sec:ifNotGranted roles="ROLE_USER">
            <div class="btn-group">
                <button class="btn btn-success dropdown-toggle btn-dropdown" data-toggle="dropdown" href="#">
                    <g:message code='springSecurity.login.button'/>
                    <span class="caret"></span>
                </button>
                <ul class="dropdown-menu">
                    <li>
                        <div class="container">
                        %{--через--}%
                            <oauth:connect provider="facebook" id="facebook-connect-link">
                                <img src="${resource(dir: 'images/auth/', file: 'fb_new.png')}"/>
                            </oauth:connect>
                        </div>
                    </li>

                    <li>
                        <div class="container">
                        %{--через--}%
                            <oauth:connect provider="vkontakte" id="vkontakte-connect-link">
                                <img src="${resource(dir: 'images/auth/', file: 'vk_new.png')}"/>
                            </oauth:connect>
                        </div>
                    </li>
                    <li>
                        <a data-toggle="modal" data-target="#LoginModal">Есть аккаунт</a>
                    </li>

                    <li class="divider"/>
                    <li>
                        <div class="container">
                            <a elementId="register"
                               href="${createLink(controller: "register", action: "index")}">
                                <g:message code='spring.security.ui.login.register'/>
                            </a>
                        </div>
                    </li>
                </ul>
            </div>

        </sec:ifNotGranted>
        <sec:ifAnyGranted roles="ROLE_USER,ROLE_FACEBOOK">
            <div class="btn-group">
                <button class="btn btn-info dropdown-toggle  btn-dropdown" data-toggle="dropdown" href="#">
                    ${personInstance?.getLoggedInName()}
                    <span class="caret"></span>
                </button>
                <ul class="dropdown-menu">
                    <li>
                        <a href="${createLink(controller: "person", action: 'index')}">
                            <g:message code="menu.user.myanimal.label"/>
                        </a>
                    </li>
                    <li>
                        <a href="${createLink(controller: "person", action: 'index', params: [edit_profile: "true"])}">
                            <g:message code="manu.user.editprofile.label"/>
                        </a>
                    </li>

                    <li>
                        <g:link controller='logout' action='index'>
                            <g:message code="default.controller.label.logout" default="LogOut"/>
                        </g:link>
                    </li>
                </ul>
            </div>

        </sec:ifAnyGranted>
    </li>
</ul>



