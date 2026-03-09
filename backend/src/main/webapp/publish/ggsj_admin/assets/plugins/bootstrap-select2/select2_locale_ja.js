/**
 * Select2 Japanese translation.
 */
(function ($) {
    "use strict";

    $.fn.select2.locales['ja'] = {
        formatNoMatches: function () { return "屋꿨퐪?ゃ걮"; },
        formatInputTooShort: function (input, min) { var n = min - input.length; return "孃? + n + "?뉐춻?γ굦?╉걦?졼걬??; },
        formatInputTooLong: function (input, max) { var n = input.length - max; return "濾쒐뇨?뉐춻?쀣걣" + n + "?뉐춻?룔걲?롢겲??; },
        formatSelectionTooBig: function (limit) { return "?鸚싥겎" + limit + "?끿쎅?얇겎?쀣걢?멩뒢?㎯걤?얇걵??; },
        formatLoadMore: function (pageNumber) { return "沃?씔訝?쉈節ο쉈"; },
        formatSearching: function () { return "濾쒐뇨訝?쉈節ο쉈"; }
    };

    $.extend($.fn.select2.defaults, $.fn.select2.locales['ja']);
})(jQuery);
