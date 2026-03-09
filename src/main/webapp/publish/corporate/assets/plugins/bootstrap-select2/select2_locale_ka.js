/**
 * Select2 Georgian (Kartuli) translation.
 * 
 * Author: Dimitri Kurashvili dimakura@gmail.com
 */
(function ($) {
    "use strict";

    $.fn.select2.locales['ka'] = {
        formatNoMatches: function () { return "?뺗깞???쎺깮?섂꺂?붳깙?쒊깘"; },
        formatInputTooShort: function (input, min) { var n = min - input.length; return "?믟깤??깮?뺗깤 ?ⓤ깞?섂깾?뺗깘?쒊깮???쇹깦?볚깞??" + n + " ?■깦?쎺깙?앩깪??; },
        formatInputTooLong: function (input, max) { var n = input.length - max; return "?믟깤??깮?뺗깤 ?п깘?ⓤ깘?싡깮??" + n + " ?■깦?쎺깙?앩깪??; },
        formatSelectionTooBig: function (limit) { return "?쀡깷?뺗깞???ⓤ깞?믟깦?メ깪?섂깘???쎺꺇?앩깪?앩깛 " + limit + " ?⒰깘?쒊깘?п깞?졹깦???쎺깮?쒊깦?ⓤ깢?쒊깘"; },
        formatLoadMore: function (pageNumber) { return "?ⓤ깞?볚깞?믟깦???⒰깘?㏇깢?섂깲?쀡깢?먥?; },
        formatSearching: function () { return "?メ깞?묃깭?먥?; }
    };

    $.extend($.fn.select2.defaults, $.fn.select2.locales['ka']);
})(jQuery);
