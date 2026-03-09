(function( factory ) {
	if ( typeof define === "function" && define.amd ) {
		define( ["jquery", "../jquery.validate"], factory );
	} else {
		factory( jQuery );
	}
}(function( $ ) {

/*
 * Translated default messages for the jQuery validation plugin.
 * Locale: PL (Polish; j휌zyk polski, polszczyzna)
 */
$.extend($.validator.messages, {
	required: "To pole jest wymagane.",
	remote: "Prosz휌 o wype흢nienie tego pola.",
	email: "Prosz휌 o podanie prawid흢owego adresu email.",
	url: "Prosz휌 o podanie prawid흢owego URL.",
	date: "Prosz휌 o podanie prawid흢owej daty.",
	dateISO: "Prosz휌 o podanie prawid흢owej daty (ISO).",
	number: "Prosz휌 o podanie prawid흢owej liczby.",
	digits: "Prosz휌 o podanie samych cyfr.",
	creditcard: "Prosz휌 o podanie prawid흢owej karty kredytowej.",
	equalTo: "Prosz휌 o podanie tej samej warto힄ci ponownie.",
	extension: "Prosz휌 o podanie warto힄ci z prawid흢owym rozszerzeniem.",
	maxlength: $.validator.format("Prosz휌 o podanie nie wi휌cej ni탉 {0} znak처w."),
	minlength: $.validator.format("Prosz휌 o podanie przynajmniej {0} znak처w."),
	rangelength: $.validator.format("Prosz휌 o podanie warto힄ci o d흢ugo힄ci od {0} do {1} znak처w."),
	range: $.validator.format("Prosz휌 o podanie warto힄ci z przedzia흢u od {0} do {1}."),
	max: $.validator.format("Prosz휌 o podanie warto힄ci mniejszej b훳d탄 r처wnej {0}."),
	min: $.validator.format("Prosz휌 o podanie warto힄ci wi휌kszej b훳d탄 r처wnej {0}.")
});

}));
