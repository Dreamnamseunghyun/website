/**
 * Select2 Vietnamese translation.
 * 
 * Author: Long Nguyen <olragon@gmail.com>
 */
(function ($) {
    "use strict";

    $.fn.select2.locales['vi'] = {
        formatNoMatches: function () { return "Kh척ng t챙m th梳쪅 k梳퓍 qu梳?; },
        formatInputTooShort: function (input, min) { var n = min - input.length; return "Vui l챵ng nh梳춑 nhi沼걏 h퉤n " + n + " k첵 t沼? + (n == 1 ? "" : "s"); },
        formatInputTooLong: function (input, max) { var n = input.length - max; return "Vui l챵ng nh梳춑 챠t h퉤n " + n + " k첵 t沼? + (n == 1? "" : "s"); },
        formatSelectionTooBig: function (limit) { return "Ch沼?c처 th沼?ch沼뛫 휃튼沼즓 " + limit + " t첫y ch沼뛫" + (limit == 1 ? "" : "s"); },
        formatLoadMore: function (pageNumber) { return "휂ang l梳쪅 th챗m k梳퓍 qu梳ｂ?; },
        formatSearching: function () { return "휂ang t챙m??; }
    };

    $.extend($.fn.select2.defaults, $.fn.select2.locales['vi']);
})(jQuery);

