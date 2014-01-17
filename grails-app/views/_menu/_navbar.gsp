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
                     src="${resource(dir: 'images', file: 'bezdomishi22.jpg')}"
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
                <li><a href="${createLink(controller: "Animal", action: "index")}">Животные</a></li>
                <li><a href="${createLink(controller: "help")}">Помощь</a></li>
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
