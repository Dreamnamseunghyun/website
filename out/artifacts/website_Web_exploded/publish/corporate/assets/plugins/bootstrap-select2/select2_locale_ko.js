/**
 * Select2 Korean translation.
 * 
 * @author  Swen Mun <longfinfunnel@gmail.com>
 */
(function ($) {
    "use strict";

    $.fn.select2.locales['ko'] = {
        formatNoMatches: function () { return "寃곌낵 ?놁쓬"; },
        formatInputTooShort: function (input, min) { var n = min - input.length; return "?덈Т 吏㏃뒿?덈떎. "+n+"湲?????낅젰?댁＜?몄슂."; },
        formatInputTooLong: function (input, max) { var n = input.length - max; return "?덈Т 源곷땲?? "+n+"湲??吏?뚯＜?몄슂."; },
        formatSelectionTooBig: function (limit) { return "理쒕? "+limit+"媛쒓퉴吏留??좏깮?섏떎 ???덉뒿?덈떎."; },
        formatLoadMore: function (pageNumber) { return "遺덈윭?ㅻ뒗 以묅?; },
        formatSearching: function () { return "寃??以묅?; }
    };

    $.extend($.fn.select2.defaults, $.fn.select2.locales['ko']);
})(jQuery);
