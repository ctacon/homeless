<html>

<head>
    <title>О нас</title>
    <meta name="layout" content="homeless_layout"/>
</head>

<body>

<section id="intro" class="first">
    <div class="row">
        <div class="span2 nav nav-list" style="width: 220px;" data-spy="affix">
            <li ><a href="#info"><g:message code="menu.help.aboutus.label" /><i class="icon-chevron-right pull-right"></i></a></li>
            <li ><a href="#choose_friend"><g:message code="menu.help.choose.friend.label" /><i class="icon-chevron-right pull-right"></i></a></li>
            <li ><a href="#help"><g:message code="menu.help.help.label" /><i class="icon-chevron-right pull-right"></i></a></li>
            <li ><a href="#community"><g:message code="menu.help.community.label" /><i class="icon-chevron-right pull-right"></i></a></li>

        </div>

        <div class="span6 offset3">
            <section id="info">
                  <g:render template="/home/info"/>
            </section>
            <section id="choose_friend">
                <g:render template="/home/choose_friend"/>
            </section>
            <section id="help">
                <g:render template="/home/help"/>
            </section>
            <section id="community">
                <g:render template="/home/community"/>
            </section>
        </div>
    </div>

</section>

</body>

</html>
	