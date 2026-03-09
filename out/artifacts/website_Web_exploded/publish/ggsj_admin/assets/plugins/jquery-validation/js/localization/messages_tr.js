(function( factory ) {
	if ( typeof define === "function" && define.amd ) {
		define( ["jquery", "../jquery.validate"], factory );
	} else {
		factory( jQuery );
	}
}(function( $ ) {

/*
 * Translated default messages for the jQuery validation plugin.
 * Locale: TR (Turkish; T체rk챌e)
 */
$.extend($.validator.messages, {
	required: "Bu alan캇n doldurulmas캇 zorunludur.",
	remote: "L체tfen bu alan캇 d체zeltin.",
	email: "L체tfen ge챌erli bir e-posta adresi giriniz.",
	url: "L체tfen ge챌erli bir web adresi (URL) giriniz.",
	date: "L체tfen ge챌erli bir tarih giriniz.",
	dateISO: "L체tfen ge챌erli bir tarih giriniz(ISO format캇nda)",
	number: "L체tfen ge챌erli bir say캇 giriniz.",
	digits: "L체tfen sadece say캇sal karakterler giriniz.",
	creditcard: "L체tfen ge챌erli bir kredi kart캇 giriniz.",
	equalTo: "L체tfen ayn캇 de휓eri tekrar giriniz.",
	extension: "L체tfen ge챌erli uzant캇ya sahip bir de휓er giriniz.",
	maxlength: $.validator.format("L체tfen en fazla {0} karakter uzunlu휓unda bir de휓er giriniz."),
	minlength: $.validator.format("L체tfen en az {0} karakter uzunlu휓unda bir de휓er giriniz."),
	rangelength: $.validator.format("L체tfen en az {0} ve en fazla {1} uzunlu휓unda bir de휓er giriniz."),
	range: $.validator.format("L체tfen {0} ile {1} aras캇nda bir de휓er giriniz."),
	max: $.validator.format("L체tfen {0} de휓erine e힊it ya da daha k체챌체k bir de휓er giriniz."),
	min: $.validator.format("L체tfen {0} de휓erine e힊it ya da daha b체y체k bir de휓er giriniz.")
});

}));
