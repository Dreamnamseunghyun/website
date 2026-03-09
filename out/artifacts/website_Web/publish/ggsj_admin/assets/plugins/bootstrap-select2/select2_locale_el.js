/**
 * Select2 Greek translation.
 * 
 * @author  Uriy Efremochkin <efremochkin@uriy.me>
 */
(function ($) {
    "use strict";

    $.fn.select2.locales['el'] = {
        formatNoMatches: function () { return "?琯館 棺?串罐管觀慣館 慣?恝?琯貫串?關慣?慣"; },
        formatInputTooShort: function (input, min) { var n = min - input.length; return "?慣?慣觀慣貫恝?關琯 琯菅?郭款琯?琯 " + n + " ?琯?菅????琯?恝" + (n > 1 ? "??" : "") + " ?慣?慣觀?冠?" + (n > 1 ? "琯?" : "慣"); },
        formatInputTooLong: function (input, max) { var n = input.length - max; return "?慣?慣觀慣貫恝?關琯 灌菅慣款?郭??琯 " + n + " ?慣?慣觀?冠?" + (n > 1 ? "琯?" : "慣"); },
        formatSelectionTooBig: function (limit) { return "??恝?琯官?琯 館慣 琯?菅貫串刮琯?琯 關?館恝 " + limit + " 慣館?菅觀琯官關琯館" + (limit > 1 ? "慣" : "恝"); },
        formatLoadMore: function (pageNumber) { return "過?????管 ?琯?菅????琯??館??; },
        formatSearching: function () { return "?館慣瓘冠?管?管??; }
    };

    $.extend($.fn.select2.defaults, $.fn.select2.locales['el']);
})(jQuery);
