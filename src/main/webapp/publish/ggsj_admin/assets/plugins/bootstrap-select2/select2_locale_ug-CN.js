/**
 * Select2 Uyghur translation
 */
(function ($) {
    "use strict";
    $.fn.select2.locales['ug-CN'] = {
        formatNoMatches: function () { return "?碼卍 ????膜?曼碼? 痲???邈 魔?毛????膜?"; },
        formatInputTooShort: function (input, min) { var n = min - input.length; return "???? " + n + " 岷?邈毛 ??邈彌?万?尾";},
        formatInputTooLong: function (input, max) { var n = input.length - max; return "" + n + "岷?邈毛 痲???邈?尾";},
        formatSelectionTooBig: function (limit) { return "痲?尾 ??毛 磨??曼碼?膜碼" + limit + " 魔碼? 痲???邈 魔碼????碼?碼?卍?万"; },
        formatLoadMore: function (pageNumber) { return "痲???邈?碼邈 痲??????碼魔?膜???; },
        formatSearching: function () { return "痲?万膜??碼魔?膜???; }
    };

    $.extend($.fn.select2.defaults, $.fn.select2.locales['ug-CN']);
})(jQuery);
