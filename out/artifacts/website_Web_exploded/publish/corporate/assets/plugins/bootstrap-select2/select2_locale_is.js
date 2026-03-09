/**
 * Select2 Icelandic translation.
 */
(function ($) {
    "use strict";

    $.fn.select2.locales['is'] = {
        formatNoMatches: function () { return "Ekkert fannst"; },
        formatInputTooShort: function (input, min) { var n = min - input.length; return "Vinsamlegast skrifi챨 " + n + " staf" + (n > 1 ? "i" : "") + " 챠 vi챨b처t"; },
        formatInputTooLong: function (input, max) { var n = input.length - max; return "Vinsamlegast stytti챨 texta um " + n + " staf" + (n > 1 ? "i" : ""); },
        formatSelectionTooBig: function (limit) { return "횧첬 getur a챨eins vali챨 " + limit + " atri챨i"; },
        formatLoadMore: function (pageNumber) { return "S챈ki fleiri ni챨urst철챨ur??; },
        formatSearching: function () { return "Leita??; }
    };

    $.extend($.fn.select2.defaults, $.fn.select2.locales['is']);
})(jQuery);
