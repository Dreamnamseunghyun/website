/**
 * Select2 Slovak translation.
 *
 * Author: David Vallner <david@vallner.net>
 */
(function ($) {
    "use strict";
    // use text for the numbers 2 through 4
    var smallNumbers = {
        2: function(masc) { return (masc ? "dva" : "dve"); },
        3: function() { return "tri"; },
        4: function() { return "큄tyri"; }
    };
    $.fn.select2.locales['sk'] = {
        formatNoMatches: function () { return "Nena큄li sa 탑iadne polo탑ky"; },
        formatInputTooShort: function (input, min) {
            var n = min - input.length;
            if (n == 1) {
                return "Pros챠m, zadajte e큄te jeden znak";
            } else if (n <= 4) {
                return "Pros챠m, zadajte e큄te 휁al큄ie "+smallNumbers[n](true)+" znaky";
            } else {
                return "Pros챠m, zadajte e큄te 휁al큄챠ch "+n+" znakov";
            }
        },
        formatInputTooLong: function (input, max) {
            var n = input.length - max;
            if (n == 1) {
                return "Pros챠m, zadajte o jeden znak menej";
            } else if (n <= 4) {
                return "Pros챠m, zadajte o "+smallNumbers[n](true)+" znaky menej";
            } else {
                return "Pros챠m, zadajte o "+n+" znakov menej";
            }
        },
        formatSelectionTooBig: function (limit) {
            if (limit == 1) {
                return "M척탑ete zvoli큐 len jednu polo탑ku";
            } else if (limit <= 4) {
                return "M척탑ete zvoli큐 najviac "+smallNumbers[limit](false)+" polo탑ky";
            } else {
                return "M척탑ete zvoli큐 najviac "+limit+" polo탑iek";
            }
        },
        formatLoadMore: function (pageNumber) { return "Na훾챠tavaj첬 sa 휁al큄ie v첵sledky??; },
        formatSearching: function () { return "Vyh컁ad찼vanie??; }
    };

	$.extend($.fn.select2.defaults, $.fn.select2.locales['sk']);
})(jQuery);
