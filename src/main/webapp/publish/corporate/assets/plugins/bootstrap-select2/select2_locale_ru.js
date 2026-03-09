/**
 * Select2 Russian translation.
 *
 * @author  Uriy Efremochkin <efremochkin@uriy.me>
 */
(function ($) {
    "use strict";

    $.fn.select2.locales['ru'] = {
        formatNoMatches: function () { return "鬼棘勻極逵畇筠戟龜橘 戟筠 戟逵橘畇筠戟棘"; },
        formatInputTooShort: function (input, min) { return "?棘菌逵剋?橘??逵, 勻勻筠畇龜?筠 筠?筠 ?棘?? 閨?" + character(min - input.length); },
        formatInputTooLong: function (input, max) { return "?棘菌逵剋?橘??逵, 勻勻筠畇龜?筠 戟逵" + character(input.length - max) + " 劇筠戟??筠"; },
        formatSelectionTooBig: function (limit) { return "?? 劇棘菌筠?筠 勻?閨?逵?? 戟筠 閨棘剋筠筠 " + limit + " ?剋筠劇筠戟?" + (limit%10 == 1 && limit%100 != 11 ? "逵" : "棘勻"); },
        formatLoadMore: function (pageNumber) { return "?逵均??鈞克逵 畇逵戟戟????; },
        formatSearching: function () { return "?棘龜?克??; }
    };

    $.extend($.fn.select2.defaults, $.fn.select2.locales['ru']);

    function character (n) {
        return " " + n + " ?龜劇勻棘剋" + (n%10 < 5 && n%10 > 0 && (n%100 < 5 || n%100 > 20) ? n%10 > 1 ? "a" : "" : "棘勻");
    }
})(jQuery);
