/**
 * Select2 Bulgarian translation.
 * 
 * @author  Lubomir Vikev <lubomirvikev@gmail.com>
 * @author  Uriy Efremochkin <efremochkin@uriy.me>
 */
(function ($) {
    "use strict";

    $.fn.select2.locales['bg'] = {
        formatNoMatches: function () { return "??劇逵 戟逵劇筠?筠戟龜 ??勻極逵畇筠戟龜?"; },
        formatInputTooShort: function (input, min) { var n = min - input.length; return "?棘剋? 勻?勻筠畇筠?筠 棘?筠 " + n + " ?龜劇勻棘剋" + (n > 1 ? "逵" : ""); },
        formatInputTooLong: function (input, max) { var n = input.length - max; return "?棘剋? 勻?勻筠畇筠?筠 ? " + n + " 極棘-劇逵剋克棘 ?龜劇勻棘剋" + (n > 1 ? "逵" : ""); },
        formatSelectionTooBig: function (limit) { return "?棘菌筠?筠 畇逵 戟逵極?逵勻龜?筠 畇棘 " + limit + (limit > 1 ? " 龜鈞閨棘?逵" : " 龜鈞閨棘?"); },
        formatLoadMore: function (pageNumber) { return "?逵?筠菌畇逵? ?筠 棘?筠??; },
        formatSearching: function () { return "龜???筠戟筠??; }
    };

    $.extend($.fn.select2.defaults, $.fn.select2.locales['bg']);
})(jQuery);
