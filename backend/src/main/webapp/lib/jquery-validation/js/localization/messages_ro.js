(function( factory ) {
	if ( typeof define === "function" && define.amd ) {
		define( ["jquery", "../jquery.validate"], factory );
	} else {
		factory( jQuery );
	}
}(function( $ ) {

/*
 * Translated default messages for the jQuery validation plugin.
 * Locale: RO (Romanian, limba rom창n훱)
 */
$.extend($.validator.messages, {
	required: "Acest c창mp este obligatoriu.",
	remote: "Te rug훱m s훱 completezi acest c창mp.",
	email: "Te rug훱m s훱 introduci o adres훱 de email valid훱",
	url: "Te rug훱m sa introduci o adres훱 URL valid훱.",
	date: "Te rug훱m s훱 introduci o dat훱 corect훱.",
	dateISO: "Te rug훱m s훱 introduci o dat훱 (ISO) corect훱.",
	number: "Te rug훱m s훱 introduci un num훱r 챤ntreg valid.",
	digits: "Te rug훱m s훱 introduci doar cifre.",
	creditcard: "Te rug훱m s훱 introduci un numar de carte de credit valid.",
	equalTo: "Te rug훱m s훱 reintroduci valoarea.",
	extension: "Te rug훱m s훱 introduci o valoare cu o extensie valid훱.",
	maxlength: $.validator.format("Te rug훱m s훱 nu introduci mai mult de {0} caractere."),
	minlength: $.validator.format("Te rug훱m s훱 introduci cel pu?in {0} caractere."),
	rangelength: $.validator.format("Te rug훱m s훱 introduci o valoare 챤ntre {0} ?i {1} caractere."),
	range: $.validator.format("Te rug훱m s훱 introduci o valoare 챤ntre {0} ?i {1}."),
	max: $.validator.format("Te rug훱m s훱 introduci o valoare egal sau mai mic훱 dec창t {0}."),
	min: $.validator.format("Te rug훱m s훱 introduci o valoare egal sau mai mare dec창t {0}.")
});

}));
