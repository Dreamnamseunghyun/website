(function( factory ) {
	if ( typeof define === "function" && define.amd ) {
		define( ["jquery", "../jquery.validate"], factory );
	} else {
		factory( jQuery );
	}
}(function( $ ) {

/*
 * Translated default messages for the jQuery validation plugin.
 * Locale: ET (Estonian; eesti, eesti keel)
 */
$.extend($.validator.messages, {
	required: "See v채li peab olema t채idetud.",
	maxlength: $.validator.format("Palun sisestage v채hem kui {0} t채hem채rki."),
	minlength: $.validator.format("Palun sisestage v채hemalt {0} t채hem채rki."),
	rangelength: $.validator.format("Palun sisestage v채채rtus vahemikus {0} kuni {1} t채hem채rki."),
	email: "Palun sisestage korrektne e-maili aadress.",
	url: "Palun sisestage korrektne URL.",
	date: "Palun sisestage korrektne kuup채ev.",
	dateISO: "Palun sisestage korrektne kuup채ev (YYYY-MM-DD).",
	number: "Palun sisestage korrektne number.",
	digits: "Palun sisestage ainult numbreid.",
	equalTo: "Palun sisestage sama v채채rtus uuesti.",
	range: $.validator.format("Palun sisestage v채채rtus vahemikus {0} kuni {1}."),
	max: $.validator.format("Palun sisestage v채채rtus, mis on v채iksem v천i v천rdne arvuga {0}."),
	min: $.validator.format("Palun sisestage v채채rtus, mis on suurem v천i v천rdne arvuga {0}."),
	creditcard: "Palun sisestage korrektne krediitkaardi number."
});

}));
