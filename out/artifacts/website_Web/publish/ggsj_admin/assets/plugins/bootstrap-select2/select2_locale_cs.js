/**
 * Select2 Czech translation.
 * 
 * Author: Michal Marek <ahoj@michal-marek.cz>
 * Author - sklonovani: David Vallner <david@vallner.net>
 */
(function ($) {
    "use strict";
    // use text for the numbers 2 through 4
    var smallNumbers = {
        2: function(masc) { return (masc ? "dva" : "dv휎"); },
        3: function() { return "t힂i"; },
        4: function() { return "훾ty힂i"; }
    }
    $.fn.select2.locales['cs'] = {
        formatNoMatches: function () { return "Nenalezeny 탑찼dn챕 polo탑ky"; },
        formatInputTooShort: function (input, min) {
            var n = min - input.length;
            if (n == 1) {
                return "Pros챠m zadejte je큄t휎 jeden znak";
            } else if (n <= 4) {
                return "Pros챠m zadejte je큄t휎 dal큄챠 "+smallNumbers[n](true)+" znaky";
            } else {
                return "Pros챠m zadejte je큄t휎 dal큄챠ch "+n+" znak킁";
            }
        },
        formatInputTooLong: function (input, max) {
            var n = input.length - max;
            if (n == 1) {
                return "Pros챠m zadejte o jeden znak m챕n휎";
            } else if (n <= 4) {
                return "Pros챠m zadejte o "+smallNumbers[n](true)+" znaky m챕n휎";
            } else {
                return "Pros챠m zadejte o "+n+" znak킁 m챕n휎";
            }
        },
        formatSelectionTooBig: function (limit) {
            if (limit == 1) {
                return "M킁탑ete zvolit jen jednu polo탑ku";
            } else if (limit <= 4) {
                return "M킁탑ete zvolit maxim찼ln휎 "+smallNumbers[limit](false)+" polo탑ky";
            } else {
                return "M킁탑ete zvolit maxim찼ln휎 "+limit+" polo탑ek";
            }
        },
        formatLoadMore: function (pageNumber) { return "Na훾챠taj챠 se dal큄챠 v첵sledky??; },
        formatSearching: function () { return "Vyhled찼v찼n챠??; }
    };

	$.extend($.fn.select2.defaults, $.fn.select2.locales['cs']);
})(jQuery);
