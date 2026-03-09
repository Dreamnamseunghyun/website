/**
 * Select2 Galician translation
 * 
 * Author: Leandro Regueiro <leandro.regueiro@gmail.com>
 */
(function ($) {
    "use strict";

    $.fn.select2.locales['gl'] = {
        formatNoMatches: function () {
            return "Non se atoparon resultados";
        },
        formatInputTooShort: function (input, min) {
            var n = min - input.length;
            if (n === 1) {
                return "Engada un car찼cter";
            } else {
                return "Engada " + n + " caracteres";
            }
        },
        formatInputTooLong: function (input, max) {
            var n = input.length - max;
            if (n === 1) {
                return "Elimine un car찼cter";
            } else {
                return "Elimine " + n + " caracteres";
            }
        },
        formatSelectionTooBig: function (limit) {
            if (limit === 1 ) {
                return "S처 pode seleccionar un elemento";
            } else {
                return "S처 pode seleccionar " + limit + " elementos";
            }
        },
        formatLoadMore: function (pageNumber) {
            return "Cargando m찼is resultados??;
        },
        formatSearching: function () {
            return "Buscando??;
        }
    };

    $.extend($.fn.select2.defaults, $.fn.select2.locales['gl']);
})(jQuery);
