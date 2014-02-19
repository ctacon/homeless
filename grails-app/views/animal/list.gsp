<%@ page import="ru.homeless.model.animal.Animal" %>
<!doctype html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="homeless_layout"/>
    <g:set var="entityName" value="${message(code: 'animal.label', default: 'Питомцы')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
    %{--<jqui:resources/>--}%
    <r:require module="jquery-ui"/>
    <g:javascript plugin="remote-pagination" src="remoteNonStopPageScroll.js"/>
</head>

<body>
<section id="list-animal" class="first">
    <sec:ifLoggedIn>
        <g:link class="btn btn-primary" action="create"><g:message code="default.new.label"
                                                                   args="[entityName]"/></g:link>
    </sec:ifLoggedIn>
    <div class="row">
        <div class="span3">
            <g:render template="filter_panel"/>
        </div>

        <div class="span6">
            <div id="animal-list">
                %{--<g:include action="list_filter" params="[--}%
                        %{--animalFilterPublished: animalFilterPublished,--}%
                        %{--animalFilterType: animalFilterType,--}%
                        %{--animalFilterSex: animalFilterSex,--}%
                        %{--animalMinAge: animalMinAge,--}%
                        %{--animalMaxAge: animalMaxAge,--}%
                        %{--animalFilterCharacter: animalFilterCharacter,--}%
                        %{--animalFilterColor: animalFilterColor,--}%
                        %{--animalFilterHair: animalFilterHair,--}%
                        %{--animalFilterFindOwner: animalFilterFindOwner--}%

                %{--]"/>--}%
            </div>
        </div>
    </div>

</section>
<script>
    $(document).ready(function () {
        $("#ageslider").slider({
            range: true,
            min: 0,
            max: 240,
            values: [ 0, 240 ],
            slide: function (event, ui) {
                $("#animalMinAge").val(ui.values[ 0 ]);
                $("#animalMaxAge").val(ui.values[ 1 ]);
                monthFrom = ui.values[ 0 ];
                monthTo = ui.values[ 1 ];
                $("#ageyearlabelfrom").text(parseInt(monthFrom / 12) + 'г ' + (monthFrom % 12) + 'м');
                $("#ageyearlabelto").text(parseInt(monthTo / 12) + 'г ' + (monthTo % 12) + 'м');
            }});
        $("#animalMinAge").val($("#ageslider").slider("values", 0));
        $("#animalMaxAge").val($("#ageslider").slider("values", 1));
        $("#ageyearlabelfrom").text('0г 0м');
        $("#ageyearlabelto").text('20г 0м');
        $("#search-form").submit();
    })
</script>
</body>

</html>
