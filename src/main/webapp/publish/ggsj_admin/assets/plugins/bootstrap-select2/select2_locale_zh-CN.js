/**
 * Select2 Chinese translation
 */
(function ($) {
    "use strict";
    $.fn.select2.locales['zh-CN'] = {
        formatNoMatches: function () { return "亦→쐣?얍댆?백뀓窈?; },
        formatInputTooShort: function (input, min) { var n = min - input.length; return "瑥룟냽渦볟뀯" + n + "訝ゅ춻寧?;},
        formatInputTooLong: function (input, max) { var n = input.length - max; return "瑥룟닠?? + n + "訝ゅ춻寧?;},
        formatSelectionTooBig: function (limit) { return "鵝졾룵?썽됪떓?鸚? + limit + "窈?; },
        formatLoadMore: function (pageNumber) { return "?좄슬瀯볠옖訝??; },
        formatSearching: function () { return "?쒐뇨訝??; }
    };

    $.extend($.fn.select2.defaults, $.fn.select2.locales['zh-CN']);
})(jQuery);
