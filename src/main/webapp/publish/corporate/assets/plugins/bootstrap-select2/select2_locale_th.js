/**
 * Select2 Thai translation.
 *
 * Author: Atsawin Chaowanakritsanakul <joke@nakhon.net>
 */
(function ($) {
    "use strict";

    $.fn.select2.locales['th'] = {
        formatNoMatches: function () { return "仙꾝륫仙댽툧錫싟툊仙됢릎錫□많錫?; },
        formatInputTooShort: function (input, min) { var n = min - input.length; return "仙귖툤錫｀툝錫왽릿錫□툧仙뚟?錫왽릿仙댽륫錫?링錫?" + n + " 錫뺖릴錫㏅릎錫긍툈錫⒯르"; },
        formatInputTooLong: function (input, max) { var n = input.length - max; return "仙귖툤錫｀툝錫?툣錫?릎錫?" + n + " 錫뺖릴錫㏅릎錫긍툈錫⒯르"; },
        formatSelectionTooBig: function (limit) { return "錫꾝만錫볙릉錫꿋륫錫꿋르錫뽤?錫?막錫?툈仙꾝툝仙됢퉬錫□퉰仙錫곟릿錫?" + limit + " 錫｀림錫№툈錫꿋르"; },
        formatLoadMore: function (pageNumber) { return "錫곟립錫?릴錫뉋툌仙됢툢錫귖퉱錫?륫錫밝른仙錫왽릿仙댽륫??; },
        formatSearching: function () { return "錫곟립錫?릴錫뉋툌仙됢툢錫귖퉱錫?륫錫밝른??; }
    };

    $.extend($.fn.select2.defaults, $.fn.select2.locales['th']);
})(jQuery);
