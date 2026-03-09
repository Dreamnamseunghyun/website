(function( factory ) {
	if ( typeof define === "function" && define.amd ) {
		define( ["jquery", "../jquery.validate"], factory );
	} else {
		factory( jQuery );
	}
}(function( $ ) {

/*
 * Translated default messages for the jQuery validation plugin.
 * Locale: LV (Latvian; latvie큄u valoda)
 */
$.extend($.validator.messages, {
	required: "힋is lauks ir oblig훮ts.",
	remote: "L큰dzu, p훮rbaudiet 큄o lauku.",
	email: "L큰dzu, ievadiet der카gu e-pasta adresi.",
	url: "L큰dzu, ievadiet der카gu URL adresi.",
	date: "L큰dzu, ievadiet der카gu datumu.",
	dateISO: "L큰dzu, ievadiet der카gu datumu (ISO).",
	number: "L큰dzu, ievadiet der카gu numuru.",
	digits: "L큰dzu, ievadiet tikai ciparus.",
	creditcard: "L큰dzu, ievadiet der카gu kred카tkartes numuru.",
	equalTo: "L큰dzu, ievadiet to pa큄u v휆lreiz.",
	extension: "L큰dzu, ievadiet v휆rt카bu ar der카gu papla큄in훮jumu.",
	maxlength: $.validator.format("L큰dzu, ievadiet ne vair훮k k훮 {0} rakstz카mes."),
	minlength: $.validator.format("L큰dzu, ievadiet vismaz {0} rakstz카mes."),
	rangelength: $.validator.format("L큰dzu ievadiet {0} l카dz {1} rakstz카mes."),
	range: $.validator.format("L큰dzu, ievadiet skaitli no {0} l카dz {1}."),
	max: $.validator.format("L큰dzu, ievadiet skaitli, kur큄 ir maz훮ks vai vien훮ds ar {0}."),
	min: $.validator.format("L큰dzu, ievadiet skaitli, kur큄 ir liel훮ks vai vien훮ds ar {0}.")
});

}));
