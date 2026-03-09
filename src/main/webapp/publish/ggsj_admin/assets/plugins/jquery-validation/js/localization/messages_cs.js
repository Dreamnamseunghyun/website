(function( factory ) {
	if ( typeof define === "function" && define.amd ) {
		define( ["jquery", "../jquery.validate"], factory );
	} else {
		factory( jQuery );
	}
}(function( $ ) {

/*
 * Translated default messages for the jQuery validation plugin.
 * Locale: CS (Czech; 훾e큄tina, 훾esk첵 jazyk)
 */
$.extend($.validator.messages, {
	required: "Tento 첬daj je povinn첵.",
	remote: "Pros챠m, opravte tento 첬daj.",
	email: "Pros챠m, zadejte platn첵 e-mail.",
	url: "Pros챠m, zadejte platn챕 URL.",
	date: "Pros챠m, zadejte platn챕 datum.",
	dateISO: "Pros챠m, zadejte platn챕 datum (ISO).",
	number: "Pros챠m, zadejte 훾챠slo.",
	digits: "Pros챠m, zad찼vejte pouze 훾챠slice.",
	creditcard: "Pros챠m, zadejte 훾챠slo kreditn챠 karty.",
	equalTo: "Pros챠m, zadejte znovu stejnou hodnotu.",
	extension: "Pros챠m, zadejte soubor se spr찼vnou p힂챠ponou.",
	maxlength: $.validator.format("Pros챠m, zadejte nejv챠ce {0} znak킁."),
	minlength: $.validator.format("Pros챠m, zadejte nejm챕n휎 {0} znak킁."),
	rangelength: $.validator.format("Pros챠m, zadejte od {0} do {1} znak킁."),
	range: $.validator.format("Pros챠m, zadejte hodnotu od {0} do {1}."),
	max: $.validator.format("Pros챠m, zadejte hodnotu men큄챠 nebo rovnu {0}."),
	min: $.validator.format("Pros챠m, zadejte hodnotu v휎t큄챠 nebo rovnu {0}.")
});

}));
