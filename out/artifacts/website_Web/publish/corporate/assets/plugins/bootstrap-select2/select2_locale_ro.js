/**
 * Select2 Romanian translation.
 */
(function ($) {
    "use strict";

    $.fn.select2.locales['ro'] = {
        formatNoMatches: function () { return "Nu a fost g훱sit nimic"; },
        formatInputTooShort: function (input, min) { var n = min - input.length; return "V훱 rug훱m s훱 introduce?i inc훱 " + n + " caracter" + (n == 1 ? "" : "e"); },
        formatInputTooLong: function (input, max) { var n = input.length - max; return "V훱 rug훱m s훱 introduce?i mai pu?in de " + n + " caracter" + (n == 1? "" : "e"); },
        formatSelectionTooBig: function (limit) { return "Ave?i voie s훱 selecta?i cel mult " + limit + " element" + (limit == 1 ? "" : "e"); },
        formatLoadMore: function (pageNumber) { return "Se 챤ncarc훱??; },
        formatSearching: function () { return "C훱utare??; }
    };

    $.extend($.fn.select2.defaults, $.fn.select2.locales['ro']);
})(jQuery);
