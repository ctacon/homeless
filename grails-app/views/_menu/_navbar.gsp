<div id="Navbar" class="navbar ">
    <div class="navbar-inner">
        <div class="container">

            %{--<a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">--}%
            %{--<span class="icon-bar"></span>--}%
            %{--<span class="icon-bar"></span>--}%
            %{--<span class="icon-bar"></span>--}%
            %{--</a>--}%

            %{--<a class="brand" href="${createLink(uri: '/')}">--}%
            %{--<img class="logo"--}%
            %{--src="${resource(plugin: 'kickstart-with-bootstrap', dir: 'kickstart/img', file: 'grails.png')}"--}%
            %{--src="${resource(dir: 'images', file: 'icon.png')}"--}%
            %{--alt="${meta(name: 'app.name')}"/>--}%
            %{--${meta(name: 'app.name')}--}%
            %{--<small>v${meta(name: 'app.version')}</small>--}%
            %{--</a>--}%


            <ul class="nav">
                <li><a href="${createLink(controller: "Animal", action: "list")}"><g:message
                        code="menu.animal.label"/></a></li>
                <li><a href="${createLink(controller: "home", action: 'help')}"><g:message code="menu.info.label"/></a>
                </li>
                <sec:ifAnyGranted roles="ROLE_ADMIN">
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#"><g:message
                                code="menu.dirrectory.label"/><b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li class="controller">
                                <g:link controller="animalType">
                                    <g:message code="menu.info.animal.type.label"/>
                                </g:link>
                            </li>
                            <li class="controller">
                                <g:link controller="animalStatus">
                                    <g:message code="menu.info.animal.helf.label"/>
                                </g:link>
                            </li>
                            <li class="controller">
                                <g:link controller="animalSex">
                                    <g:message code="menu.info.animal.sex.label"/>
                                </g:link>
                            </li>
                            <li class="controller">
                                <g:link controller="animalPlace">
                                    <g:message code="menu.info.animal.place.label"/>
                                </g:link>
                            </li>
                            <li class="controller">
                                <g:link controller="animalHair">
                                    <g:message code="menu.info.animal.hear.label"/>
                                </g:link>
                            </li>
                            <li class="controller">
                                <g:link controller="animalColor">
                                    <g:message code="menu.info.animal.color.label"/>
                                </g:link>
                            </li>
                            <li class="controller">
                                <g:link controller="animalCharacter">
                                    <g:message code="menu.info.animal.character.label"/>
                                </g:link>
                            </li>
                            <li class="controller">
                                <g:link controller="personPostType">
                                    <g:message code="menu.info.person.post.label"/>
                                </g:link>
                            </li>
                        </ul>
                    </li>
                </sec:ifAnyGranted>
                <sec:ifAnyGranted roles="ROLE_SUPER_ADMIN">
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#"><g:message
                                code="menu.settings.label"/><b class="caret"></b></a>

                        <ul class="dropdown-menu">
                            <li class="controller">
                                <g:link controller="user" action="search">
                                    <g:message code="menu.settings.security.role.label"/>
                                </g:link>
                            </li>
                        </ul>
                    </li>
                </sec:ifAnyGranted>
            </ul>



            <g:render template="/_menu/user"/>
        </div>
    </div>
</div>
