/**
 * Select2 French translation
 */
(function ($) {
    "use strict";

    $.fn.select2.locales['fr'] = {
        formatMatches: function (matches) { return matches + " r챕sultats sont disponibles, utilisez les fl챔ches haut et bas pour naviguer."; },
        formatNoMatches: function () { return "Aucun r챕sultat trouv챕"; },
        formatInputTooShort: function (input, min) { var n = min - input.length; return "Saisissez " + n + " caract챔re" + (n == 1? "" : "s") + " suppl챕mentaire" + (n == 1? "" : "s") ; },
        formatInputTooLong: function (input, max) { var n = input.length - max; return "Supprimez " + n + " caract챔re" + (n == 1? "" : "s"); },
        formatSelectionTooBig: function (limit) { return "Vous pouvez seulement s챕lectionner " + limit + " 챕l챕ment" + (limit == 1 ? "" : "s"); },
        formatLoadMore: function (pageNumber) { return "Chargement de r챕sultats suppl챕mentaires??; },
        formatSearching: function () { return "Recherche en cours??; }
    };

    $.extend($.fn.select2.defaults, $.fn.select2.locales['fr']);
})(jQuery);
