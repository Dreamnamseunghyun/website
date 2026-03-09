/**
 * Select2 Portuguese (Portugal) translation
 */
(function ($) {
    "use strict";

    $.fn.select2.locales['pt-PT'] = {
        formatNoMatches: function () { return "Nenhum resultado encontrado"; },
        formatInputTooShort: function (input, min) { var n = min - input.length; return "Introduza " + n + " car" + (n == 1 ? "찼cter" : "acteres"); },
        formatInputTooLong: function (input, max) { var n = input.length - max; return "Apague " + n + " car" + (n == 1 ? "찼cter" : "acteres"); },
        formatSelectionTooBig: function (limit) { return "S처 챕 poss챠vel selecionar " + limit + " elemento" + (limit == 1 ? "" : "s"); },
        formatLoadMore: function (pageNumber) { return "A carregar mais resultados??; },
        formatSearching: function () { return "A pesquisar??; }
    };

    $.extend($.fn.select2.defaults, $.fn.select2.locales['pt-PT']);
})(jQuery);
