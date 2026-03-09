(function( factory ) {
	if ( typeof define === "function" && define.amd ) {
		define( ["jquery", "../jquery.validate"], factory );
	} else {
		factory( jQuery );
	}
}(function( $ ) {

/*
 * Translated default messages for the jQuery validation plugin.
 * Locale: HU (Hungarian; Magyar)
 */
$.extend($.validator.messages, {
	required: "K철telez흷 megadni.",
	maxlength: $.validator.format("Legfeljebb {0} karakter hossz첬 legyen."),
	minlength: $.validator.format("Legal찼bb {0} karakter hossz첬 legyen."),
	rangelength: $.validator.format("Legal찼bb {0} 챕s legfeljebb {1} karakter hossz첬 legyen."),
	email: "횋rv챕nyes e-mail c챠mnek kell lennie.",
	url: "횋rv챕nyes URL-nek kell lennie.",
	date: "D찼tumnak kell lennie.",
	number: "Sz찼mnak kell lennie.",
	digits: "Csak sz찼mjegyek lehetnek.",
	equalTo: "Meg kell egyeznie a k챕t 챕rt챕knek.",
	range: $.validator.format("{0} 챕s {1} k철z챕 kell esnie."),
	max: $.validator.format("Nem lehet nagyobb, mint {0}."),
	min: $.validator.format("Nem lehet kisebb, mint {0}."),
	creditcard: "횋rv챕nyes hitelk찼rtyasz찼mnak kell lennie.",
	remote: "K챕rem jav챠tsa ki ezt a mez흷t.",
	dateISO: "K챕rem 챠rjon be egy 챕rv챕nyes d찼tumot (ISO)."
});

}));
