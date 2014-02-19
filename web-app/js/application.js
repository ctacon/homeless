//if (typeof jQuery !== 'undefined') {
//    (function ($) {
//        $('#spinner').ajaxStart(function () {
//            $(this).show();
//        })
//            .ajaxStop(function() {
//			$(this).fadeOut();
//		})
//        ;
//    })(jQuery);
//}
//

var $loading = $('#spinner').hide();
$(document)
    .ajaxStart(function () {
        $loading.show();
    })
    .ajaxStop(function () {
        $loading.hide();
    })
;
