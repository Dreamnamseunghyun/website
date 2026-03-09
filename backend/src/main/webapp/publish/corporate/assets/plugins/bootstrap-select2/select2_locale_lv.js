/**
 * Select2 Latvian translation.
 *
 * @author  Uriy Efremochkin <efremochkin@uriy.me>
 */
(function ($) {
    "use strict";

    $.fn.select2.locales['lv'] = {
        formatNoMatches: function () { return "Sakrit카bu nav"; },
        formatInputTooShort: function (input, min) { var n = min - input.length; return "L큰dzu ievadiet v휆l " + n + " simbol" + (n == 11 ? "us" : n%10 == 1 ? "u" : "us"); },
        formatInputTooLong: function (input, max) { var n = input.length - max; return "L큰dzu ievadiet par " + n + " simbol" + (n == 11 ? "iem" : n%10 == 1 ? "u" : "iem") + " maz훮k"; },
        formatSelectionTooBig: function (limit) { return "J큰s varat izv휆l휆ties ne vair훮k k훮 " + limit + " element" + (limit == 11 ? "us" : limit%10 == 1 ? "u" : "us"); },
        formatLoadMore: function (pageNumber) { return "Datu iel훮de??; },
        formatSearching: function () { return "Mekl휆큄ana??; }
    };

    $.extend($.fn.select2.defaults, $.fn.select2.locales['lv']);
})(jQuery);
