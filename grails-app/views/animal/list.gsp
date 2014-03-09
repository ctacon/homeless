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
        <g:link class="btn btn-primary" action="create"><g:message code="animal.new.label"/></g:link>
    </sec:ifLoggedIn>
    <div class="row">
        <div class="span2" style="width: 200px">
            <g:render template="filter_panel"/>
        </div>

        <div class="span6 offset1">
            <div id="animal-list">
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
                $("#ageyearlabelfrom").val(parseInt(monthFrom / 12) + ',' + (monthFrom % 12) + '');
                $("#ageyearlabelto").val(parseInt(monthTo / 12) + ', ' + (monthTo % 12) + '');
            }});
        $("#search-form").submit();
    });
    function resetSlider() {
        var $slider = $("#ageslider");
        $slider.slider("values", 0, 0);
        $slider.slider("values", 1, 240);
    }
</script>
</body>

</html>
