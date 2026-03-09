/**
 * Select2 Catalan translation.
 * 
 * Author: David Planella <david.planella@gmail.com>
 */
(function ($) {
    "use strict";

    $.fn.select2.locales['ca'] = {
        formatNoMatches: function () { return "No s'ha trobat cap coincid챔ncia"; },
        formatInputTooShort: function (input, min) { var n = min - input.length; return "Introdu챦u " + n + " car횪cter" + (n == 1 ? "" : "s") + " m챕s"; },
        formatInputTooLong: function (input, max) { var n = input.length - max; return "Introdu챦u " + n + " car횪cter" + (n == 1? "" : "s") + "menys"; },
        formatSelectionTooBig: function (limit) { return "Nom챕s podeu seleccionar " + limit + " element" + (limit == 1 ? "" : "s"); },
        formatLoadMore: function (pageNumber) { return "S'estan carregant m챕s resultats??; },
        formatSearching: function () { return "S'est횪 cercant??; }
    };

    $.extend($.fn.select2.defaults, $.fn.select2.locales['ca']);
})(jQuery);
