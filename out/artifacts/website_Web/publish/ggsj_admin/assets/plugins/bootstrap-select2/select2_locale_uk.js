/**
 * Select2 Ukrainian translation.
 * 
 * @author  bigmihail <bigmihail@bigmir.net>
 * @author  Uriy Efremochkin <efremochkin@uriy.me>
 */
(function ($) {
    "use strict";

    $.fn.select2.locales['uk'] = {
        formatMatches: function (matches) { return character(matches, "?筠鈞?剋??逵?") + " 鈞戟逵橘畇筠戟棘, 勻龜克棘?龜??棘勻?橘?筠 克剋逵勻??? 鈞? ????剋克逵劇龜 勻勻筠?? ?逵 勻戟龜鈞 畇剋? 戟逵勻?均逵???."; },
        formatNoMatches: function () { return "???棘均棘 戟筠 鈞戟逵橘畇筠戟棘"; },
        formatInputTooShort: function (input, min) { return "?勻筠畇??? 閨?剋? 剋逵?克逵 ?筠 " + character(min - input.length, "?龜劇勻棘剋"); },
        formatInputTooLong: function (input, max) { return "?勻筠畇??? 閨?剋? 剋逵?克逵 戟逵 " + character(input.length - max, "?龜劇勻棘剋") + " 劇筠戟?筠"; },
        formatSelectionTooBig: function (limit) { return "?龜 劇棘菌筠?筠 勻龜閨?逵?龜 剋龜?筠 " + character(limit, "筠剋筠劇筠戟?"); },
        formatLoadMore: function (pageNumber) { return "?逵勻逵戟?逵菌筠戟戟? 畇逵戟龜???; },
        formatSearching: function () { return "?棘??克??; }
    };

    $.extend($.fn.select2.defaults, $.fn.select2.locales['uk']);

    function character (n, word) {
        return n + " " + word + (n%10 < 5 && n%10 > 0 && (n%100 < 5 || n%100 > 19) ? n%10 > 1 ? "龜" : "" : "?勻");
    }
})(jQuery);
