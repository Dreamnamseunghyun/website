(function( factory ) {
	if ( typeof define === "function" && define.amd ) {
		define( ["jquery", "../jquery.validate"], factory );
	} else {
		factory( jQuery );
	}
}(function( $ ) {

/*
 * Translated default messages for the jQuery validation plugin.
 * Locale: LT (Lithuanian; lietuvi킬 kalba)
 */
$.extend($.validator.messages, {
	required: "힋is laukas yra privalomas.",
	remote: "Pra큄au pataisyti 큄캄 lauk훳.",
	email: "Pra큄au 캄vesti teising훳 elektroninio pa큄to adres훳.",
	url: "Pra큄au 캄vesti teising훳 URL.",
	date: "Pra큄au 캄vesti teising훳 dat훳.",
	dateISO: "Pra큄au 캄vesti teising훳 dat훳 (ISO).",
	number: "Pra큄au 캄vesti teising훳 skai훾i킬.",
	digits: "Pra큄au naudoti tik skaitmenis.",
	creditcard: "Pra큄au 캄vesti teising훳 kreditin휊s kortel휊s numer캄.",
	equalTo: "Pra큄au 캄vest캄 t훳 pa훾i훳 reik큄m휌 dar kart훳.",
	extension: "Pra큄au 캄vesti reik큄m휌 su teisingu pl휊tiniu.",
	maxlength: $.validator.format("Pra큄au 캄vesti ne daugiau kaip {0} simboli킬."),
	minlength: $.validator.format("Pra큄au 캄vesti bent {0} simbolius."),
	rangelength: $.validator.format("Pra큄au 캄vesti reik큄mes, kuri킬 ilgis nuo {0} iki {1} simboli킬."),
	range: $.validator.format("Pra큄au 캄vesti reik큄m휌 intervale nuo {0} iki {1}."),
	max: $.validator.format("Pra큄au 캄vesti reik큄m휌 ma탑esn휌 arba lygi훳 {0}."),
	min: $.validator.format("Pra큄au 캄vesti reik큄m휌 didesn휌 arba lygi훳 {0}.")
});

}));
