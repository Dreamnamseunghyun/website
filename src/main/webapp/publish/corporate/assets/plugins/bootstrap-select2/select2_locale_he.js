/**
* Select2 Hebrew translation.
*
* Author: Yakir Sitbon <http://www.yakirs.net/>
*/
(function ($) {
    "use strict";

    $.fn.select2.locales['he'] = {
        formatNoMatches: function () { return "?? ??屢?? ?瘻???瘻"; },
        formatInputTooShort: function (input, min) { var n = min - input.length; return "?? ????? 鬧?? " + n + " 瘻???? ??遼壘??"; },
        formatInputTooLong: function (input, max) { var n = input.length - max; return "?? ????? 壘??瘻 " + n + " 瘻????"; },
        formatSelectionTooBig: function (limit) { return "??瘻? ????淚 " + limit + " 壘淚????"; },
        formatLoadMore: function (pageNumber) { return "??鬧? 瘻?屢??瘻 ??遼壘?瘻??; },
        formatSearching: function () { return "??壘漏??; }
    };

    $.extend($.fn.select2.defaults, $.fn.select2.locales['he']);
})(jQuery);
