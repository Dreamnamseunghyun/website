/**
 * Select2 <Language> translation.
 * 
 * Author: bigmihail <bigmihail@bigmir.net>
 */
(function ($) {
    "use strict";

    $.extend($.fn.select2.defaults, {
        formatNoMatches: function () { return "???棘均棘 戟筠 鈞戟逵橘畇筠戟棘"; },
        formatInputTooShort: function (input, min) { var n = min - input.length, s = ["", "龜", "?勻"], p = [2,0,1,1,1,2]; return "?勻筠畇??? 閨?剋? 剋逵?克逵 ?筠 " + n + " ?龜劇勻棘剋" + s[ (n%100>4 && n%100<=20)? 2 : p[Math.min(n%10, 5)] ]; },
        formatInputTooLong: function (input, max) { var n = input.length - max, s = ["", "龜", "?勻"], p = [2,0,1,1,1,2]; return "?勻筠畇??? 閨?剋? 剋逵?克逵 戟逵 " + n + " ?龜劇勻棘剋" + s[ (n%100>4 && n%100<=20)? 2 : p[Math.min(n%10, 5)] ] + " 劇筠戟?筠"; },
        formatSelectionTooBig: function (limit) {var s = ["", "龜", "?勻"], p = [2,0,1,1,1,2];  return "?龜 劇棘菌筠?筠 勻龜閨?逵?龜 剋龜?筠 " + limit + " 筠剋筠劇筠戟?" + s[ (limit%100>4 && limit%100<=20)? 2 : p[Math.min(limit%10, 5)] ]; },
        formatLoadMore: function (pageNumber) { return "?逵勻逵戟?逵菌筠戟戟? 畇逵戟龜?..."; },
        formatSearching: function () { return "?棘??克..."; }
    });
})(jQuery);
