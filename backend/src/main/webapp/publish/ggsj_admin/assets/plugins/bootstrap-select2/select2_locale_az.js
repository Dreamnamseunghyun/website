/**
 * Select2 Azerbaijani translation.
 *
 * Author: Farhad Safarov <farhad.safarov@gmail.com>
 */
(function ($) {
    "use strict";

     $.fn.select2.locales['az'] = {
        formatMatches: function (matches) { return matches + " n?tic? m철vcuddur, h?r?k?t etdirm?k 체챌체n yuxar캇 v? a힊a휓캇 d체ym?l?rind?n istifad? edin."; },
        formatNoMatches: function () { return "N?tic? tap캇lmad캇"; },
        formatInputTooShort: function (input, min) { var n = min - input.length; return n + " simvol daxil edin"; },
        formatInputTooLong: function (input, max) { var n = input.length - max; return n + " simvol silin"; },
        formatSelectionTooBig: function (limit) { return "Sad?c? " + limit + " element se챌? bil?rsiniz"; },
        formatLoadMore: function (pageNumber) { return "Daha 챌ox n?tic? y체kl?nir??; },
        formatSearching: function () { return "Axtar캇l캇r??; }
    };

    $.extend($.fn.select2.defaults, $.fn.select2.locales['az']);
})(jQuery);
