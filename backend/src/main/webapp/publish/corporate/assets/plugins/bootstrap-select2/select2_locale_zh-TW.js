/**
 * Select2 Traditional Chinese translation
 */
(function ($) {
    "use strict";
    $.fn.select2.locales['zh-TW'] = {
        formatNoMatches: function () { return "亦믤쐣?얍댆?며Е?꾦쟿??; },
        formatInputTooShort: function (input, min) { var n = min - input.length; return "獄뗥냽雍멨뀯" + n + "?뗥춻??;},
        formatInputTooLong: function (input, max) { var n = input.length - max; return "獄뗥닼?? + n + "?뗥춻??;},
        formatSelectionTooBig: function (limit) { return "鵝졾룵?썽겦?뉑?鸚? + limit + "??; },
        formatLoadMore: function (pageNumber) { return "雍됧뀯訝??; },
        formatSearching: function () { return "?쒎컠訝??; }
    };

    $.extend($.fn.select2.defaults, $.fn.select2.locales['zh-TW']);
})(jQuery);
