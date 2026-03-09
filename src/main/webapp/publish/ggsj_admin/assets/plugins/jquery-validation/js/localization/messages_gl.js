(function( factory ) {
	if ( typeof define === "function" && define.amd ) {
		define( ["jquery", "../jquery.validate"], factory );
	} else {
		factory( jQuery );
	}
}(function( $ ) {

/*
 * Translated default messages for the jQuery validation plugin.
 * Locale: GL (Galician; Galego)
 */
(function($) {
	$.extend($.validator.messages, {
		required: "Este campo 챕 obrigatorio.",
		remote: "Por favor, cubre este campo.",
		email: "Por favor, escribe unha direcci처n de correo v찼lida.",
		url: "Por favor, escribe unha URL v찼lida.",
		date: "Por favor, escribe unha data v찼lida.",
		dateISO: "Por favor, escribe unha data (ISO) v찼lida.",
		number: "Por favor, escribe un n첬mero v찼lido.",
		digits: "Por favor, escribe s처 d챠xitos.",
		creditcard: "Por favor, escribe un n첬mero de tarxeta v찼lido.",
		equalTo: "Por favor, escribe o mesmo valor de novo.",
		extension: "Por favor, escribe un valor cunha extensi처n aceptada.",
		maxlength: $.validator.format("Por favor, non escribas m찼is de {0} caracteres."),
		minlength: $.validator.format("Por favor, non escribas menos de {0} caracteres."),
		rangelength: $.validator.format("Por favor, escribe un valor entre {0} e {1} caracteres."),
		range: $.validator.format("Por favor, escribe un valor entre {0} e {1}."),
		max: $.validator.format("Por favor, escribe un valor menor ou igual a {0}."),
		min: $.validator.format("Por favor, escribe un valor maior ou igual a {0}."),
		nifES: "Por favor, escribe un NIF v찼lido.",
		nieES: "Por favor, escribe un NIE v찼lido.",
		cifES: "Por favor, escribe un CIF v찼lido."
	});
}(jQuery));

}));
