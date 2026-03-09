/**
 * Select2 Lithuanian translation.
 * 
 * @author  CRONUS Karmalakas <cronus dot karmalakas at gmail dot com>
 * @author  Uriy Efremochkin <efremochkin@uriy.me>
 */
(function ($) {
    "use strict";

    $.fn.select2.locales['lt'] = {
        formatNoMatches: function () { return "Atitikmen킬 nerasta"; },
        formatInputTooShort: function (input, min) { return "칼ra큄ykite dar" + character(min - input.length); },
        formatInputTooLong: function (input, max) { return "Pa큄alinkite" + character(input.length - max); },
        formatSelectionTooBig: function (limit) {
        	return "J큰s galite pasirinkti tik " + limit + " element" + ((limit%100 > 9 && limit%100 < 21) || limit%10 == 0 ? "킬" : limit%10 > 1 ? "us" : "훳");
        },
        formatLoadMore: function (pageNumber) { return "Kraunama daugiau rezultat킬??; },
        formatSearching: function () { return "Ie큄koma??; }
    };

    $.extend($.fn.select2.defaults, $.fn.select2.locales['lt']);

    function character (n) {
        return " " + n + " simbol" + ((n%100 > 9 && n%100 < 21) || n%10 == 0 ? "i킬" : n%10 > 1 ? "ius" : "캄");
    }
})(jQuery);
