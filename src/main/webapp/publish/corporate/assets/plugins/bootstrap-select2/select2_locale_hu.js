/**
 * Select2 Hungarian translation
 */
(function ($) {
    "use strict";

    $.fn.select2.locales['hu'] = {
        formatNoMatches: function () { return "Nincs tal찼lat."; },
        formatInputTooShort: function (input, min) { var n = min - input.length; return "T첬l r철vid. M챕g " + n + " karakter hi찼nyzik."; },
        formatInputTooLong: function (input, max) { var n = input.length - max; return "T첬l hossz첬. " + n + " karakterrel t철bb, mint kellene."; },
        formatSelectionTooBig: function (limit) { return "Csak " + limit + " elemet lehet kiv찼lasztani."; },
        formatLoadMore: function (pageNumber) { return "T철lt챕s??; },
        formatSearching: function () { return "Keres챕s??; }
    };

    $.extend($.fn.select2.defaults, $.fn.select2.locales['hu']);
})(jQuery);
