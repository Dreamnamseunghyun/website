/**
 * Select2 Macedonian translation.
 * 
 * Author: Marko Aleksic <psybaron@gmail.com>
 */
(function ($) {
    "use strict";

    $.fn.select2.locales['mk'] = {
        formatNoMatches: function () { return "?筠劇逵 極?棘戟逵?畇筠戟棘 ?棘勻極逵?逵?逵"; },
        formatInputTooShort: function (input, min) { var n = min - input.length; return "?筠 劇棘剋龜劇筠 勻戟筠?筠?筠 ???筠 " + n + " 克逵?逵克?筠?" + (n == 1 ? "" : "龜"); },
        formatInputTooLong: function (input, max) { var n = input.length - max; return "?筠 劇棘剋龜劇筠 勻戟筠?筠?筠 " + n + " 極棘劇逵剋克? 克逵?逵克?筠?" + (n == 1? "" : "龜"); },
        formatSelectionTooBig: function (limit) { return "?棘菌筠?筠 畇逵 龜鈞閨筠?筠?筠 ?逵劇棘 " + limit + " ??逵勻克" + (limit == 1 ? "逵" : "龜"); },
        formatLoadMore: function (pageNumber) { return "??龜??勻逵?筠 ?筠鈞?剋?逵?龜??; },
        formatSearching: function () { return "??筠閨逵??勻逵?筠??; }
    };

    $.extend($.fn.select2.defaults, $.fn.select2.locales['mk']);
})(jQuery);
