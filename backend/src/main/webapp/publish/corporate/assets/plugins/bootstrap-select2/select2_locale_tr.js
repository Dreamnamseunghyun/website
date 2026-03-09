/**
 * Select2 Turkish translation.
 * 
 * Author: Salim KAYABA힇I <salim.kayabasi@gmail.com>
 */
(function ($) {
    "use strict";

    $.fn.select2.locales['tr'] = {
        formatNoMatches: function () { return "Sonu챌 bulunamad캇"; },
        formatInputTooShort: function (input, min) { var n = min - input.length; return "En az " + n + " karakter daha girmelisiniz"; },
        formatInputTooLong: function (input, max) { var n = input.length - max; return n + " karakter azaltmal캇s캇n캇z"; },
        formatSelectionTooBig: function (limit) { return "Sadece " + limit + " se챌im yapabilirsiniz"; },
        formatLoadMore: function (pageNumber) { return "Daha fazla??; },
        formatSearching: function () { return "Aran캇yor??; }
    };

    $.extend($.fn.select2.defaults, $.fn.select2.locales['tr']);
})(jQuery);
