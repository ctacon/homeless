<!DOCTYPE html>
<%-- <html lang="${org.springframework.web.servlet.support.RequestContextUtils.getLocale(request).toString().replace('_', '-')}"> --%>
<html lang="${session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE'}">

<head>
    <title><g:layoutTitle default="${meta(name: 'app.name')}"/></title>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <link rel="shortcut icon" href="${resource(dir: 'images', file: 'tabicon.png')}"
          type="image/x-icon"/>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'bootstrap-custom.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'spinner.css')}" type="text/css">
    %{--<link rel="apple-touch-icon" href="apssets/ico/aple-touch-icon.png">--}%
    %{--<link rel="apple-touch-icon" href="assets/ico/apple-touch-icon-72x72.png" sizes="72x72">--}%
    %{--<link rel="apple-touch-icon" href="assets/ico/apple-touch-icon-114x114.png" sizes="114x114">--}%

    <%-- Manual switch for the skin can be found in /view/_menu/_config.gsp --%>
    <r:require modules="jquery"/>
    <r:require modules="bootstrap"/>
    <r:require modules="bootstrap_utils"/>
    <g:javascript library='jquery'/>
    <g:javascript library='application'/>

    <r:layoutResources/>
    <g:layoutHead/>

    <!-- Le HTML5 shim, for IE6-8 support of HTML elements -->
    <!--[if lt IE 9]>
		<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>

	<![endif]-->

    <%-- For Javascript see end of body --%>
</head>

<body>
<div class="container">
    <g:render template="/_menu/navbar"/>


    <g:if test="${!pageProperty(name: 'page.navigation')}">
        <g:render template="/_menu/navigationmenu"/>
        %{--<g:pageProperty name="page.navigation"/>--}%
    </g:if>
    <g:else>

    </g:else>



    <!-- Enable to overwrite Header by individual page -->
    <%--	<g:if test="${ pageProperty(name:'page.header') }">
               <g:pageProperty name="page.header" />
        </g:if>
        <g:else>
            <g:render template="/layouts/header"/>
        </g:else>      --%>

    <g:render template="/layouts/content"/>

</div>

<!-- Enable to overwrite Footer by individual page -->
	%{--<g:if test="${ pageProperty(name:'page.footer') }">--}%
	    %{--<g:pageProperty name="page.footer" />--}%
	%{--</g:if>--}%
	%{--<g:else>--}%
		<g:render template="/layouts/footer"/>
	%{--</g:else>    --}%
<!-- Enable to insert additional components (e.g., modals, javascript, etc.) by any individual page -->
%{--<g:if test="${pageProperty(name: 'page.include.bottom')}">--}%
%{--<g:pageProperty name="page.include.bottom"/>--}%
%{--</g:if>--}%
%{--<g:else>--}%
<!-- Insert a modal dialog for registering (for an open site registering is possible on any page) -->
%{--<g:render template="/_common/modals/registerDialog" model="[item: item]"/>--}%
%{--</g:else>--}%

<!-- Included Javascript files and other resources -->
%{--style="display: none"--}%
<div id="spinner" class="ajax-spinner-loader" hidden="hidden">
    <g:img dir="images" file="spinner.gif"/>
</div>
<r:layoutResources/>
</body>

</html>

<style>
body {
    padding-top: 40px;
}
</style>