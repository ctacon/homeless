<div id="Navbar" class="navbar navbar-fixed-top ">
    <div class="navbar-inner">
        <div class="container">

            %{--<a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">--}%
                %{--<span class="icon-bar"></span>--}%
                %{--<span class="icon-bar"></span>--}%
                %{--<span class="icon-bar"></span>--}%
            %{--</a>--}%

            <a class="brand" href="${createLink(uri: '/')}">
                <img class="logo"
                %{--src="${resource(plugin: 'kickstart-with-bootstrap', dir: 'kickstart/img', file: 'grails.png')}"--}%
                     src="${resource(dir: 'images', file: 'icon.png')}"
                     alt="${meta(name: 'app.name')}"/>
                ${meta(name: 'app.name')}
                <small>v${meta(name: 'app.version')}</small>
            </a>


            <ul class="nav">
                <sec:ifAnyGranted roles="ROLE_SUPER_ADMIN">
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">Browse <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <g:each var="c" in="${grailsApplication.controllerClasses.sort { it.fullName }}">
                                <li class="controller">
                                    <g:link controller="${c.logicalPropertyName}">
                                        <g:if test="${c.fullName.contains('HomeController')}">
                                            <i class="icon-home"></i>
                                        </g:if>
                                        <g:elseif test="${c.fullName.contains('DemoPageController')}">
                                            <i class="icon-beaker"></i>
                                        </g:elseif>
                                        ${c.fullName.substring(c.fullName.lastIndexOf('.') + 1)}
                                    </g:link>
                                </li>
                            </g:each>
                        </ul>
                    </li>
                </sec:ifAnyGranted>
                <li><a href="${createLink(controller: "Animal", action: "list")}">Животные</a></li>
                <li><a href="${createLink(controller: "help")}">Помощь</a></li>
                <sec:ifAnyGranted roles="ROLE_ADMIN">
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">Справочники<b class="caret"></b></a>
                        <ul class="dropdown-menu">
                                <li class="controller">
                                    <g:link controller="animalType">
                                        Вид животного
                                    </g:link>
                                </li>
                            <li class="controller">
                                <g:link controller="animalStatus">
                                    Состояние животного
                                </g:link>
                            </li>
                            <li class="controller">
                                <g:link controller="animalSex">
                                    Пол животного
                                </g:link>
                            </li>
                            <li class="controller">
                                <g:link controller="animalPlace">
                                    Место животного
                                </g:link>
                            </li>
                            <li class="controller">
                                <g:link controller="animalHair">
                                    Шерсть животного
                                </g:link>
                            </li>
                            <li class="controller">
                                <g:link controller="animalColor">
                                    Цвет животного
                                </g:link>
                            </li>
                            <li class="controller">
                                <g:link controller="animalCharacter">
                                    Характер животного
                                </g:link>
                            </li>
                            <li class="controller">
                                <g:link controller="personPostType">
                                    Должность пользователя
                                </g:link>
                            </li>
                        </ul>
                    </li>
                </sec:ifAnyGranted>
            </ul>

            <div class="pull-left">
            </div>

            <div class="pull-right">
                <g:render
                        template="/_menu/user"/>
            </div>
        </div>
    </div>
</div>
