/**
 * Select2 Finnish translation
 */
(function ($) {
    "use strict";
    $.fn.select2.locales['fi'] = {
        formatNoMatches: function () {
            return "Ei tuloksia";
        },
        formatInputTooShort: function (input, min) {
            var n = min - input.length;
            return "Ole hyv채 ja anna " + n + " merkki채 lis채채";
        },
        formatInputTooLong: function (input, max) {
            var n = input.length - max;
            return "Ole hyv채 ja anna " + n + " merkki채 v채hemm채n";
        },
        formatSelectionTooBig: function (limit) {
            return "Voit valita ainoastaan " + limit + " kpl";
        },
        formatLoadMore: function (pageNumber) {
            return "Ladataan lis채채 tuloksia??;
        },
        formatSearching: function () {
            return "Etsit채채n??;
        }
    };

    $.extend($.fn.select2.defaults, $.fn.select2.locales['fi']);
})(jQuery);
