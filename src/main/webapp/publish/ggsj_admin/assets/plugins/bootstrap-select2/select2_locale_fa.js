/**
 * Select2 Persian translation.
 * 
 * Author: Ali Choopan <choopan@arsh.co>
 * Author: Ebrahim Byagowi <ebrahim@gnu.org>
 */
(function ($) {
    "use strict";

    $.fn.select2.locales['fa'] = {
        formatMatches: function (matches) { return matches + " ?魔?寞? ??寞?膜 碼卍魔? 沕??膜?碼? 寞?魔 磨碼?碼 ? 毛碼??? 邈碼 磨邈碼? 彌娩魔? 碼卍魔?碼膜? 沕??膜."; },
        formatNoMatches: function () { return "?魔?寞??뚕㏁??碼?魔 ?娩膜."; },
        formatInputTooShort: function (input, min) { var n = min - input.length; return "?慢?碼? " + n + " ???卍? 磨?娩魔邈 ?碼邈膜 ??碼??膜"; },
        formatInputTooLong: function (input, max) { var n = input.length - max; return "?慢?碼? " + n + " ???卍? 邈碼 幕莫? 沕??膜."; },
        formatSelectionTooBig: function (limit) { return "娩?碼 ??慢 ???뚕べ댵Ω녬뚕?" + limit + " ??邈膜 邈碼 碼?魔漠碼磨 沕??膜"; },
        formatLoadMore: function (pageNumber) { return "膜邈 幕碼? 磨碼邈彌?邈? ??碼邈膜 磨?娩魔邈??; },
        formatSearching: function () { return "膜邈 幕碼? 寞卍魔寞???; }
    };

    $.extend($.fn.select2.defaults, $.fn.select2.locales['fa']);
})(jQuery);
